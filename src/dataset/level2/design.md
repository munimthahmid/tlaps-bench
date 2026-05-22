# Level 2 Benchmark Generator — Design

## Goal

Transform a complete TLA+ + TLAPS source file into a Level 2 benchmark: keep the model specification, hollow out all proofs, and force the AI to design the proof structure from scratch (including reinventing invariants, helper lemmas, and inductive decomposition).

## Generation rule (core principle, one sentence)

> **Keep the model and the statement of the top-level theorem; delete all proof content.**

"Model" means anything that is **not** a `THEOREM`/`LEMMA` declaration. We deliberately do **not** distinguish whether a given `==` definition is an inductive invariant or a user-facing property — both are kept. That distinction is a semantic call made by the proof engineer and cannot be reliably automated from static analysis. We do not try.

## Detailed operation

For each **top-level theorem** `T` in source file `X.tla`, generate one benchmark file `X_T.tla`:

| Source element | L2 treatment |
|---|---|
| Module header / EXTENDS | Keep |
| CONSTANT / VARIABLE / ASSUME / AXIOM | Keep |
| `==` definitions (operator / INSTANCE binding) | **Keep all** |
| Target THEOREM `T`'s statement | Keep |
| Target THEOREM `T`'s proof body | Delete, replace with `PROOF OBVIOUS` |
| All other THEOREMs (statement + proof) | Delete |
| All LEMMAs (statement + proof) — never eligible as target, see keyword filter below | Delete |
| Dependency modules referenced by INSTANCE (e.g. `Consensus.tla`) | Copy alongside the benchmark file with all proofs stripped to `PROOF OMITTED` |

## Top-level theorem identification

Candidates first — then the OR rule.

**Keyword filter (candidates):** only `THEOREM`-keyword declarations are
candidates. `LEMMA` / `AXIOM` / `COROLLARY` / `PROPOSITION` are excluded
unconditionally. The TLA+ convention is that `LEMMA` marks a helper and
`THEOREM` marks a main result; we trust that convention.

Without this filter EWD840 would emit 3 benchmarks instead of 1: its
`LEMMA TypeOK_inv == Spec => []TypeOK` matches the shape rule below, and
its `LEMMA Inv_implies_Termination` matches the graph rule (no other
proof references it — it's an alternative pedagogical proof). Neither is
a benchmark target.

SANY treats `THEOREM` and `LEMMA` as the same `TheoremNode`, so we
recover the keyword from the source text at the node's
`loc.line_start` — the first non-whitespace token on that line.

**OR rule (among candidates):** a candidate `T` is top-level iff any of:

1. **Unnamed rule**: T has no name. In TLA+ a theorem can only be referenced by name, so an unnamed declaration cannot be used as a helper — the author's choice not to name it is itself a statement that it is a standalone claim.
2. **Shape rule**: T's statement has the form `<S> => ...` where `<S>` is a *spec formula* (see below).
3. **Graph rule**: T has a name and is not consumed by any other theorem/lemma's proof body (no incoming edges in the theorem-use graph, where an edge `T1 → T2` means T1's proof references T2 via a `BY` / `USE` clause).

The OR matches what Ruize listed as top-level theorems for the three starter examples:

- SimpleMutex → `Safety` (shape rule) plus the unnamed `THEOREM ASSUME … PROVE TypeOK' /\ Inv'` at L140 (unnamed rule — the author wrote a second SMT-backed proof of the same goal as a standalone deliverable).
- EWD840 → `THEOREM Spec => []TerminationDetection` only (shape rule; the LEMMAs are filtered out by the keyword filter).
- Paxos → `Invariant`, `Consistent`, `Refinement` (all three — shape rule; note `Invariant` and `Consistent` are consumed by downstream proofs but are still listed as top-level by Ruize, so the shape rule alone captures them).

The graph rule is kept as a backstop for the remaining sliver — *named*
`THEOREM`s whose final shape doesn't happen to start with `<S> =>` but
which are nonetheless not consumed by any other proof. Ruize warned in
Issue #1 that the shape heuristic "may be not sufficient"; the graph
rule covers that.

### What is a spec formula `<S>`?

We **do not** match the literal string `"Spec"`. The TLA+ convention prefers that name, but it is a convention only — real specs use `LiveSpec`, `Behavior`, `System`, `ProtocolSpec`, etc., and a single file may define more than one (typically a safety-only spec plus a fairness-enriched extension).

A definition `<S> == <body>` qualifies as a spec formula iff `<body>` is a *temporal closure of a transition system*, identified purely from its semantic shape (operator AST), not from its name:

- `Init /\ [][Next]_vars` — the canonical shape, or
- A top-level conjunction containing at least one conjunct of shape `[][<action>]_<vars>`, or
- A top-level conjunction whose conjuncts include another already-identified spec formula plus a fairness conjunct (`WF_vars(...)` / `SF_vars(...)`)

The *spec formula set* of a file is the closure of names that pass this test. The shape rule (rule 1 above) becomes: T's statement is `<S> => ...` for some `<S>` in that set.

**Audit log**: any of the following situations emits an entry into a separate audit log (the generator still proceeds; the log is purely a sanity-check artifact for human review).

About spec formula identification:

1. **Spec name is not `Spec`** — the identified spec formula is named something else (e.g. `LiveSpec`, `Behavior`). Likely fine, but flagged so a human can confirm we picked the right thing.
2. **No spec formula identified** — the file defines no `==` whose body matches a temporal closure shape. The shape rule then has nothing to fire against; only the graph rule applies. Worth a human look — either the file genuinely has no behavioral spec (e.g. a pure math module), or our shape detector missed something.
3. **Multiple spec formulas identified** — more than one `==` matches the shape (e.g. `Spec` plus `LiveSpec`). All of them participate in the shape rule. Flagged so a human can confirm none of them is a false positive.

About top-level theorem selection:

4. **No top-level THEOREM** — keyword filter + OR rule produced an empty set. No benchmark file is written.
5. **Multiple top-level THEOREMs** — more than one `THEOREM` passed the OR rule (e.g. Paxos' `Invariant`/`Consistent`/`Refinement`). Each entry records which rule fired: `[unnamed]`, or `[shape=Y/graph=N]` etc. for named candidates.
6. **Unnamed top-level THEOREM** — declared without a name (e.g. `THEOREM Spec => []TerminationDetection`). Not a warning; this entry records how the benchmark filename was derived: the RHS primary identifier (`TerminationDetection`), or the source line number if no usable primary name can be extracted.
7. **Filename collision** — two top-level THEOREMs would map to the same benchmark filename (e.g. Peterson has three `THEOREM Spec => []MutualExclusion` lines). Suffix `_L<line>` is appended to disambiguate.

About generator errors:

8. **SANY parse failure / generator error** — the dumper or generator threw an exception for this file. No benchmark is emitted; the original exception is recorded.

Example audit entries:

```
[level2-audit] source/Foo/Foo.tla: identified spec formula `LiveSpec` (body shape: `Spec /\ WF_vars(Next)`) — name != `Spec`
[level2-audit] source/Bar/Bar.tla: no spec formula identified — shape rule will not match any theorem
[level2-audit] source/Baz/Baz.tla: multiple spec formulas: `Spec`, `LiveSpec`
[level2-audit] source/Foo/Foo.tla: no top-level THEOREM identified — no benchmarks generated
[level2-audit] source/Paxos/Paxos.tla: multiple top-level THEOREMs: ['Invariant[shape=Y/graph=N]', 'Consistent[shape=Y/graph=N]', 'Refinement[shape=Y/graph=Y]']
[level2-audit] source/EWD840/EWD840.tla: unnamed top-level THEOREM at line 143 — using rhs primary name `TerminationDetection` for filename
[level2-audit] source/Peterson/Peterson.tla: filename collision on `Peterson_MutualExclusion`, disambiguated to `Peterson_MutualExclusion_L134`
[level2-audit] source/Foo/Foo.tla: ERROR JSONDecodeError('…')
```

### Output

- Named theorem (`THEOREM Safety == Spec => ...`): use its name → benchmark file `X_Safety.tla`
- Unnamed theorem (`THEOREM Spec => []TerminationDetection`): use the target property name → `X_TerminationDetection.tla`
- A source file with N top-level theorems → N benchmarks
- 0 top-level → no benchmark generated; reported in the log

### Implementation notes

- Spec formula detection walks SANY's semantic AST. The operator tags exposed by SANY for `[][_]_vars`, `WF_vars`, `SF_vars`, and top-level `/\` make this a direct AST pattern match — no regex on source text, no name matching.
- The theorem-use graph is built by walking each theorem/lemma's `ProofNode` and collecting names referenced from `BY` / `USE` / `DEFS` clauses, resolving each against the set of theorem/lemma declarations in scope.

## Applied to Ruize's three examples

### SimpleMutex.tla

Source has 5 THEOREMs: `Safety`, `Mutex`, `Invariance`, `Initialization`, `TLAInvariance`. Only `Safety` matches `Spec => ...`.

**Generates 1 benchmark**: `benchmark/level2/SimpleMutex/SimpleMutex_Safety.tla`
- Keep: all `==` definitions (including `TypeOK`, `Inv`, `IndInvSpec`, `Termination`, `MutualExclusion`, `Init`, `Next`, `Spec`, …)
- Delete: the other 4 theorems + all proof bodies

### EWD840.tla

Source has 1 unnamed top-level theorem (L143: `THEOREM Spec => []TerminationDetection`) and 2 LEMMAs.

**Generates 1 benchmark**: `benchmark/level2/EWD840/EWD840_TerminationDetection.tla`
- Keep: all `==` definitions (including `Inv`, `TerminationDetection`, …)
- Delete: 2 LEMMAs + the top-level theorem's proof body

### Paxos.tla

Source has 5 LEMMAs + 3 top-level THEOREMs (`Invariant`, `Consistent`, `Refinement`).

**Generates 3 benchmarks**:
- `benchmark/level2/Paxos/Paxos_Invariant.tla` — target `Spec => []Inv`
- `benchmark/level2/Paxos/Paxos_Consistent.tla` — target `Spec => []Consistency`
- `benchmark/level2/Paxos/Paxos_Refinement.tla` — target `Spec => C!Spec`

For each benchmark:
- Keep: all `==` definitions (including `Inv`, `Consistency`, `TypeOK`, `MsgInv`, `AccInv`, `SafeAt`, `WontVoteIn`, `C` (the INSTANCE binding), and all of `Phase1a`/`1b`/`2a`/`2b`, etc.)
- Delete: 5 LEMMAs + the other 2 non-target THEOREMs + the proof body of the target theorem itself
- Keeping the INSTANCE binding means `Consensus.tla` is also copied to the same directory (needed by all 3 benchmarks; copying it for the ones that don't strictly need it is harmless)

## AI's view

A typical L2 benchmark presents the AI with this shape:
```
MODULE X_T
EXTENDS ...
CONSTANT ...
VARIABLE ...
\* All == definitions go here
...

THEOREM T == Spec => X
PROOF OBVIOUS
====
```

The AI's task is to replace `PROOF OBVIOUS` with a real proof. It **sees no helper LEMMAs** and must design the entire proof decomposition itself — which sub-goals to prove, which invariant to use, how to split on `Next` cases — all from scratch.

## Algorithm outline

1. **Parse source file**: use SANY's semantic API (see `Specula/tools/cfa/PrintCFG.java` for a working example of this hack), and dump JSON with: every operator definition, every THEOREM/LEMMA node (statement + proof source-line range), every ASSUME/AXIOM, every CONSTANT/VARIABLE, every INSTANCE binding, plus the spec-formula set. Apalache `parse` is unusable here because it discards theorems.
2. **Recover keyword** for each theorem-like node by reading the first token on its `loc.line_start` (SANY collapses THEOREM/LEMMA/AXIOM/COROLLARY/PROPOSITION into one `TheoremNode` kind).
3. **Identify top-level theorems**: among THEOREM-keyword candidates, apply the OR rule (shape OR graph). Emit audit entries for the cases listed above.
4. **For each top-level theorem, emit a benchmark file**:
   - Start from the original source text
   - Delete every other theorem-or-lemma node by line range (the target itself stays)
   - Replace the target theorem's `proof_loc` line range with `PROOF OBVIOUS`
   - Rename the module header to `<File>_<TheoremName>` (or `<File>_<TheoremName>_L<line>` on collision)
5. **Handle dependency modules**: walk all INSTANCE references, copy the referenced `.tla` files into the benchmark output directory, and strip their proofs (replace with `PROOF OMITTED`) — reusing the logic already in `src/dataset/level1/generate.py`.

## Out of scope

- **Deciding which generated benchmarks have weak signal and should be skipped**: this is a human evaluation call, not a generator concern. The generator carries no hardcoded "skip if target is an inductive invariant" or similar special-case logic.
- **Anti-cheating extensions for L2**: an AI solving L2 may need to introduce new top-level `==` definitions (its own invariant / lemma). The current `check_proof.py` rule that "preamble must not be modified" needs to be loosened. That work is **deferred** until the L2 generator lands and we have a baseline.
- **Wiring Apalache or TLAPS into the generator**: we only use SANY for parsing in this round.

## Input / output

- **Input**: `source/<Module>/<File>.tla`
- **Output**: `benchmark/level2/<Module>/<File>_<TheoremName>.tla` (one file per top-level theorem, plus copied INSTANCE dependency `.tla` files)
- **CLI**: `python3 src/dataset/level2/generate.py [--filter <pattern>] [--source-dir source/] [--output-dir benchmark/level2/]`

## Implementation milestones

1. **M1 — SANY dumper (Java)**. `src/dataset/sany-dump/DumpSemantics.java`, JSON output. Start with the minimum useful fields: name, kind, source line range, and (for theorems) the location of the statement vs the proof body.
2. **M2 — Python generator**. Consume the JSON + source text, apply the strip rules, write benchmark files.
3. **M3 — Smoke-test on SimpleMutex / EWD840 / Paxos**, eyeball the outputs.
4. **M4 — Extend to all modules under `source/`**, confirm nothing breaks.
