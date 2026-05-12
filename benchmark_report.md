# TLAPS Benchmark Validation Report

**Generated**: 2026-05-12 19:57:47

## Summary

| Metric | Count |
|--------|-------|
| Total benchmarks | 190 |
| ✅ Passed | 143 |
| ❌ Failed | 34 |
| ⚠️ Cheating detected | 13 |
| 🔍 No proof found | 0 |
| 💥 Error | 0 |
| ⏱️ Total verification time | 1612.1s |
| 📝 Total baseline proof lines | 4454 |

## Results by Module

### Allocator (10/10 passed)

| Theorem | Source | Status | Proof Lines | Time | Notes |
|---------|--------|--------|-------------|------|-------|
| `AllocateMutex` | `Allocator/Allocator.tla` | ✅ PASS | 70 | 6.1s |  |
| `AllocateTypeInvariant` | `Allocator/Allocator.tla` | ✅ PASS | 1 | 0.5s |  |
| `InitMutex` | `Allocator/Allocator.tla` | ✅ PASS | 1 | 0.6s |  |
| `InitTypeInvariant` | `Allocator/Allocator.tla` | ✅ PASS | 1 | 0.6s |  |
| `NextMutex` | `Allocator/Allocator.tla` | ✅ PASS | 1 | 0.5s |  |
| `NextTypeInvariant` | `Allocator/Allocator.tla` | ✅ PASS | 15 | 0.6s |  |
| `RequestMutexBis` | `Allocator/Allocator.tla` | ✅ PASS | 1 | 0.6s |  |
| `RequestTypeInvariant` | `Allocator/Allocator.tla` | ✅ PASS | 1 | 0.6s |  |
| `ReturnMutex` | `Allocator/Allocator.tla` | ✅ PASS | 19 | 0.7s |  |
| `ReturnTypeInvariant` | `Allocator/Allocator.tla` | ✅ PASS | 1 | 0.6s |  |

### AtomicBakery (0/8 passed)

| Theorem | Source | Status | Proof Lines | Time | Notes |
|---------|--------|--------|-------------|------|-------|
| `AfterPrime` | `AtomicBakery/AtomicBakeryWithoutSMT.tla` | ❌ FAIL | 1 | 30.7s | 6/8 obligations failed |
| `GGIrreflexive` | `AtomicBakery/AtomicBakeryWithoutSMT.tla` | ❌ FAIL | 15 | 30.7s | 6/30 obligations failed |
| `InductiveInvariant` | `AtomicBakery/AtomicBakeryWithoutSMT.tla` | ❌ FAIL | 256 | 44.6s | 9/253 obligations failed |
| `InitImpliesTypeOK` | `AtomicBakery/AtomicBakeryWithoutSMT.tla` | ❌ FAIL | 15 | 30.7s | 6/16 obligations failed |
| `InitInv` | `AtomicBakery/AtomicBakeryWithoutSMT.tla` | ❌ FAIL | 1 | 30.7s | 6/9 obligations failed |
| `InvExclusion` | `AtomicBakery/AtomicBakeryWithoutSMT.tla` | ❌ FAIL | 1 | 30.7s | 6/8 obligations failed |
| `Safety` | `AtomicBakery/AtomicBakeryWithoutSMT.tla` | ❌ FAIL | 5 | 30.7s | 6/14 obligations failed |
| `TypeOKInvariant` | `AtomicBakery/AtomicBakeryWithoutSMT.tla` | ❌ FAIL | 50 | 30.7s | 6/54 obligations failed |

### BubbleSort (8/8 passed)

| Theorem | Source | Status | Proof Lines | Time | Notes |
|---------|--------|--------|-------------|------|-------|
| `CompositionAssociative` | `BubbleSort/BubbleSort.tla` | ✅ PASS | 1 | 0.5s |  |
| `CompositionOfPerms` | `BubbleSort/BubbleSort.tla` | ✅ PASS | 1 | 0.6s |  |
| `ExchangeAPerm` | `BubbleSort/BubbleSort.tla` | ✅ PASS | 1 | 0.6s |  |
| `IdAPerm` | `BubbleSort/BubbleSort.tla` | ✅ PASS | 1 | 0.5s |  |
| `IdIdentity` | `BubbleSort/BubbleSort.tla` | ✅ PASS | 1 | 0.6s |  |
| `IsPermOfExchange` | `BubbleSort/BubbleSort.tla` | ✅ PASS | 8 | 0.7s |  |
| `IsPermOfReflexive` | `BubbleSort/BubbleSort.tla` | ✅ PASS | 1 | 0.6s |  |
| `IsPermOfTransitive` | `BubbleSort/BubbleSort.tla` | ✅ PASS | 14 | 0.7s |  |

### ByzantinePaxos (31/38 passed)

| Theorem | Source | Status | Proof Lines | Time | Notes |
|---------|--------|--------|-------------|------|-------|
| `BMessageLemma` | `ByzantinePaxos/BPConProof.tla` | ✅ PASS | 8 | 0.7s |  |
| `EnabledDef` | `ByzantinePaxos/Consensus.tla` | ⚠️ CHEATING | 7 | 0.7s | PROOF_OMITTED: Proof uses PROOF OMITTED to skip obligations |
| `FiniteMsgsLemma` | `ByzantinePaxos/BPConProof.tla` | ✅ PASS | 12 | 12.2s |  |
| `GeneralNatInduction` | `ByzantinePaxos/VoteProof.tla` | ✅ PASS | 31 | 0.8s |  |
| `InductiveInvariance` | `ByzantinePaxos/Consensus.tla` | ✅ PASS | 15 | 0.6s |  |
| `InductiveInvariance` | `ByzantinePaxos/VoteProof.tla` | ✅ PASS | 312 | 22.9s |  |
| `InitImpliesInv` | `ByzantinePaxos/VoteProof.tla` | ✅ PASS | 13 | 0.8s |  |
| `Invariance` | `Consensus/Consensus.tla` | ❌ FAIL | 6 | 0.2s |  |
| `KnowsSafeAtDef` | `ByzantinePaxos/BPConProof.tla` | ✅ PASS | 2 | 2.4s |  |
| `LiveSpecEquals` | `ByzantinePaxos/Consensus.tla` | ⚠️ CHEATING | 7 | 0.6s | PROOF_OMITTED: Proof uses PROOF OMITTED to skip obligations |
| `Liveness` | `ByzantinePaxos/VoteProof.tla` | ⚠️ CHEATING | 364 | 31.5s | PROOF_OMITTED: Proof uses PROOF OMITTED to skip obligations |
| `MaxBallotLemma1` | `ByzantinePaxos/BPConProof.tla` | ✅ PASS | 22 | 1.4s |  |
| `MaxBallotLemma2` | `ByzantinePaxos/BPConProof.tla` | ✅ PASS | 96 | 10.7s |  |
| `MaxBallotProp` | `ByzantinePaxos/BPConProof.tla` | ✅ PASS | 15 | 1.1s |  |
| `MsgsLemma` | `ByzantinePaxos/BPConProof.tla` | ❌ FAIL | 308 | 116.8s | 1/433 obligations failed |
| `MsgsTypeLemma` | `ByzantinePaxos/BPConProof.tla` | ✅ PASS | 19 | 16.3s |  |
| `MsgsTypeLemmaPrime` | `ByzantinePaxos/BPConProof.tla` | ✅ PASS | 19 | 15.3s |  |
| `NextDef` | `ByzantinePaxos/VoteProof.tla` | ✅ PASS | 7 | 0.7s |  |
| `NextDef` | `ByzantinePaxos/PConProof.tla` | ✅ PASS | 8 | 0.8s |  |
| `NextDef` | `ByzantinePaxos/BPConProof.tla` | ✅ PASS | 9 | 22.1s |  |
| `OnePlusFinite` | `ByzantinePaxos/BPConProof.tla` | ✅ PASS | 1 | 0.6s |  |
| `PMaxBalLemma3` | `ByzantinePaxos/BPConProof.tla` | ✅ PASS | 29 | 19.1s |  |
| `PNextDef` | `ByzantinePaxos/BPConProof.tla` | ✅ PASS | 6 | 5.3s |  |
| `PmaxBalLemma1` | `ByzantinePaxos/BPConProof.tla` | ✅ PASS | 10 | 1.1s |  |
| `PmaxBalLemma2` | `ByzantinePaxos/BPConProof.tla` | ✅ PASS | 11 | 1.0s |  |
| `PmaxBalLemma4` | `ByzantinePaxos/BPConProof.tla` | ✅ PASS | 32 | 18.7s |  |
| `PmaxBalLemma5` | `ByzantinePaxos/BPConProof.tla` | ✅ PASS | 34 | 21.6s |  |
| `QuorumNonEmpty` | `ByzantinePaxos/VoteProof.tla` | ✅ PASS | 1 | 0.5s |  |
| `QuorumTheorem` | `ByzantinePaxos/BPConProof.tla` | ✅ PASS | 16 | 1.1s |  |
| `SafeAtProp` | `ByzantinePaxos/VoteProof.tla` | ✅ PASS | 48 | 21.7s |  |
| `SafeLemma` | `ByzantinePaxos/VoteProof.tla` | ✅ PASS | 142 | 4.3s |  |
| `VT0` | `ByzantinePaxos/VoteProof.tla` | ✅ PASS | 71 | 2.2s |  |
| `VT0Prime` | `ByzantinePaxos/VoteProof.tla` | ✅ PASS | 71 | 6.3s |  |
| `VT1` | `ByzantinePaxos/VoteProof.tla` | ✅ PASS | 35 | 1.2s |  |
| `VT1Prime` | `ByzantinePaxos/VoteProof.tla` | ✅ PASS | 35 | 1.6s |  |
| `VT2` | `ByzantinePaxos/VoteProof.tla` | ⚠️ CHEATING | 6 | 0.6s | PROOF_OMITTED: Proof uses PROOF OMITTED to skip obligations |
| `VT3` | `ByzantinePaxos/VoteProof.tla` | ⚠️ CHEATING | 103 | 10.8s | PROOF_OMITTED: Proof uses PROOF OMITTED to skip obligations |
| `VT4` | `ByzantinePaxos/VoteProof.tla` | ✅ PASS | 75 | 9.2s |  |

### Cantor (11/11 passed)

| Theorem | Source | Status | Proof Lines | Time | Notes |
|---------|--------|--------|-------------|------|-------|
| `Cantor` | `Cantor/Cantor9.tla` | ✅ PASS | 11 | 0.6s |  |
| `Cantor` | `Cantor/Cantor8.tla` | ✅ PASS | 15 | 0.6s |  |
| `Cantor` | `Cantor/Cantor10.tla` | ✅ PASS | 6 | 0.6s |  |
| `NoSetContainsAllValues` | `Cantor/Cantor10.tla` | ✅ PASS | 13 | 0.6s |  |
| `cantor` | `Cantor/Cantor7.tla` | ✅ PASS | 6 | 0.5s |  |
| `cantor` | `Cantor/Cantor6.tla` | ✅ PASS | 4 | 0.6s |  |
| `cantor` | `Cantor/Cantor1.tla` | ✅ PASS | 7 | 0.6s |  |
| `cantor` | `Cantor/Cantor5.tla` | ✅ PASS | 5 | 0.6s |  |
| `cantor` | `Cantor/Cantor3.tla` | ✅ PASS | 20 | 0.6s |  |
| `cantor` | `Cantor/Cantor4.tla` | ✅ PASS | 14 | 0.6s |  |
| `cantor` | `Cantor/Cantor2.tla` | ✅ PASS | 19 | 0.7s |  |

### Consensus (36/50 passed)

| Theorem | Source | Status | Proof Lines | Time | Notes |
|---------|--------|--------|-------------|------|-------|
| `AllSafeAtZero` | `Consensus/Voting.tla` | ✅ PASS | 1 | 1.4s |  |
| `CardinalityInNat` | `Consensus/Sets.tla` | ✅ PASS | 1 | 0.6s |  |
| `CardinalityInNat` | `Consensus/Sets.tla` | ✅ PASS | 1 | 1.0s |  |
| `CardinalityInNat` | `Data/Sets.tla` | ✅ PASS | 1 | 1.1s |  |
| `CardinalityOne` | `Consensus/Sets.tla` | ✅ PASS | 1 | 14.9s |  |
| `CardinalityOne` | `Data/Sets.tla` | ✅ PASS | 1 | 15.3s |  |
| `CardinalityOne` | `Consensus/Sets.tla` | ✅ PASS | 1 | 15.7s |  |
| `CardinalityOneConverse` | `Consensus/Sets.tla` | ✅ PASS | 6 | 0.7s |  |
| `CardinalityOneConverse` | `Consensus/Sets.tla` | ✅ PASS | 6 | 1.3s |  |
| `CardinalityOneConverse` | `Data/Sets.tla` | ✅ PASS | 6 | 1.4s |  |
| `CardinalityPlusOne` | `Consensus/Sets.tla` | ❌ FAIL | 8 | 6.0s | 1/11 obligations failed |
| `CardinalityPlusOne` | `Consensus/Sets.tla` | ❌ FAIL | 8 | 6.5s | 1/11 obligations failed |
| `CardinalityPlusOne` | `Data/Sets.tla` | ❌ FAIL | 8 | 6.9s | 1/11 obligations failed |
| `CardinalitySetMinus` | `Consensus/Sets.tla` | ⚠️ CHEATING | 41 | 1.1s | PROOF_OMITTED: Proof uses PROOF OMITTED to skip obligations |
| `CardinalitySetMinus` | `Data/Sets.tla` | ⚠️ CHEATING | 41 | 2.2s | PROOF_OMITTED: Proof uses PROOF OMITTED to skip obligations |
| `CardinalitySetMinus` | `Consensus/Sets.tla` | ⚠️ CHEATING | 41 | 2.5s | PROOF_OMITTED: Proof uses PROOF OMITTED to skip obligations |
| `CardinalityTwo` | `Consensus/Sets.tla` | ✅ PASS | 1 | 15.6s |  |
| `CardinalityTwo` | `Consensus/Sets.tla` | ✅ PASS | 1 | 16.4s |  |
| `CardinalityTwo` | `Data/Sets.tla` | ✅ PASS | 1 | 16.4s |  |
| `CardinalityZero` | `Consensus/Sets.tla` | ✅ PASS | 13 | 1.2s |  |
| `CardinalityZero` | `Consensus/Sets.tla` | ✅ PASS | 13 | 1.5s |  |
| `CardinalityZero` | `Data/Sets.tla` | ✅ PASS | 13 | 1.5s |  |
| `ChoosableThm` | `Consensus/Voting.tla` | ✅ PASS | 1 | 1.1s |  |
| `Consistent` | `Consensus/Voting.tla` | ✅ PASS | 9 | 1.0s |  |
| `FiniteSubset` | `Data/Sets.tla` | ❌ FAIL | 65 | 19.2s | 1/52 obligations failed |
| `FiniteSubset` | `Consensus/Sets.tla` | ❌ FAIL | 65 | 19.7s | 1/52 obligations failed |
| `FiniteSubset` | `Consensus/Sets.tla` | ❌ FAIL | 65 | 19.7s | 1/52 obligations failed |
| `IntervalCardinality` | `Consensus/Sets.tla` | ✅ PASS | 14 | 1.4s |  |
| `IntervalCardinality` | `Consensus/Sets.tla` | ✅ PASS | 14 | 1.5s |  |
| `IntervalCardinality` | `Data/Sets.tla` | ✅ PASS | 13 | 1.6s |  |
| `Invariance` | `Consensus/Consensus.tla` | ✅ PASS | 6 | 1.2s |  |
| `Invariant` | `Consensus/Voting.tla` | ❌ FAIL | 82 | 35.2s | 1/73 obligations failed |
| `IsBijectionInverse` | `Consensus/Sets.tla` | ✅ PASS | 3 | 1.1s |  |
| `IsBijectionInverse` | `Consensus/Sets.tla` | ✅ PASS | 3 | 1.2s |  |
| `IsBijectionInverse` | `Data/Sets.tla` | ✅ PASS | 3 | 1.6s |  |
| `IsBijectionTransitive` | `Consensus/Sets.tla` | ✅ PASS | 7 | 1.1s |  |
| `IsBijectionTransitive` | `Consensus/Sets.tla` | ✅ PASS | 7 | 1.2s |  |
| `IsBijectionTransitive` | `Data/Sets.tla` | ✅ PASS | 7 | 1.2s |  |
| `OneVoteThm` | `Consensus/Voting.tla` | ✅ PASS | 1 | 1.1s |  |
| `OtherMessage` | `Consensus/PaxosProof.tla` | ✅ PASS | 1 | 6.9s |  |
| `PigeonHole` | `Consensus/Sets.tla` | ✅ PASS | 47 | 18.7s |  |
| `PigeonHole` | `Data/Sets.tla` | ✅ PASS | 47 | 18.8s |  |
| `PigeonHole` | `Consensus/Sets.tla` | ✅ PASS | 47 | 19.0s |  |
| `QuorumNonEmpty` | `Consensus/Voting.tla` | ✅ PASS | 1 | 1.2s |  |
| `Refinement` | `Consensus/Voting.tla` | ✅ PASS | 21 | 17.4s |  |
| `ShowsSafety` | `Consensus/Voting.tla` | ❌ FAIL | 3 | 6.1s | 1/3 obligations failed |
| `VotesSafeImpliesConsistency` | `Consensus/Voting.tla` | ❌ FAIL | 18 | 6.8s | 3/19 obligations failed |
| `WFmsgs` | `Consensus/PaxosProof.tla` | ✅ PASS | 1 | 1.9s |  |
| `struct_lemma` | `Consensus/PaxosProof.tla` | ⚠️ CHEATING | 7 | 8.0s | PROOF_OMITTED: Proof uses PROOF OMITTED to skip obligations |
| `typing` | `Consensus/PaxosProof.tla` | ⚠️ CHEATING | 8 | 2.6s | PROOF_OMITTED: Proof uses PROOF OMITTED to skip obligations |

### Data (25/37 passed)

| Theorem | Source | Status | Proof Lines | Time | Notes |
|---------|--------|--------|-------------|------|-------|
| `AppendDef` | `Data/SequencesTheorems.tla` | ❌ FAIL | 1 | 6.0s | 1/2 obligations failed |
| `AppendProperties` | `Data/SequencesTheorems.tla` | ✅ PASS | 1 | 1.5s |  |
| `AtLeastTwo` | `Data/GraphTheorem.tla` | ❌ FAIL | 1 | 6.0s | 1/4 obligations failed |
| `CardinalityInNat` | `Data/Sets.tla` | ✅ PASS | 1 | 1.2s |  |
| `CardinalityInNat` | `Data/Sets.tla` | ✅ PASS | 1 | 1.6s |  |
| `CardinalityOne` | `Data/Sets.tla` | ✅ PASS | 1 | 16.0s |  |
| `CardinalityOne` | `Data/Sets.tla` | ✅ PASS | 1 | 16.9s |  |
| `CardinalityOneConverse` | `Data/Sets.tla` | ✅ PASS | 6 | 1.6s |  |
| `CardinalityOneConverse` | `Data/Sets.tla` | ✅ PASS | 6 | 1.8s |  |
| `CardinalityPlusOne` | `Data/Sets.tla` | ❌ FAIL | 8 | 6.7s | 1/11 obligations failed |
| `CardinalityPlusOne` | `Data/Sets.tla` | ❌ FAIL | 8 | 7.0s | 1/11 obligations failed |
| `CardinalitySetMinus` | `Data/Sets.tla` | ⚠️ CHEATING | 41 | 2.2s | PROOF_OMITTED: Proof uses PROOF OMITTED to skip obligations |
| `CardinalitySetMinus` | `Data/Sets.tla` | ⚠️ CHEATING | 41 | 2.8s | PROOF_OMITTED: Proof uses PROOF OMITTED to skip obligations |
| `CardinalityTwo` | `Data/Sets.tla` | ✅ PASS | 1 | 15.0s |  |
| `CardinalityTwo` | `Data/Sets.tla` | ✅ PASS | 1 | 15.4s |  |
| `CardinalityZero` | `Data/Sets.tla` | ✅ PASS | 13 | 1.5s |  |
| `CardinalityZero` | `Data/Sets.tla` | ✅ PASS | 13 | 1.9s |  |
| `ConcatDef` | `Data/SequencesTheorems.tla` | ✅ PASS | 1 | 1.6s |  |
| `ConcatProperties` | `Data/SequencesTheorems.tla` | ✅ PASS | 1 | 1.4s |  |
| `EdgesAxiom` | `Data/GraphTheorem.tla` | ❌ FAIL | 1 | 31.5s | 1/2 obligations failed |
| `ElementOfSeq` | `Data/SequencesTheorems.tla` | ✅ PASS | 1 | 1.6s |  |
| `EmptySeq` | `Data/SequencesTheorems.tla` | ✅ PASS | 1 | 1.4s |  |
| `FiniteSubset` | `Data/Sets.tla` | ❌ FAIL | 65 | 18.4s | 1/52 obligations failed |
| `FiniteSubset` | `Data/Sets.tla` | ❌ FAIL | 65 | 17.9s | 1/52 obligations failed |
| `HeadAndTailOfSeq` | `Data/SequencesTheorems.tla` | ❌ FAIL | 9 | 0.5s |  |
| `InitialSubSeq` | `Data/SequencesTheorems.tla` | ❌ FAIL | 16 | 0.6s |  |
| `IntervalCardinality` | `Data/Sets.tla` | ✅ PASS | 13 | 1.6s |  |
| `IntervalCardinality` | `Data/Sets.tla` | ✅ PASS | 13 | 2.0s |  |
| `IsBijectionInverse` | `Data/Sets.tla` | ✅ PASS | 3 | 1.4s |  |
| `IsBijectionInverse` | `Data/Sets.tla` | ✅ PASS | 3 | 1.5s |  |
| `IsBijectionTransitive` | `Data/Sets.tla` | ✅ PASS | 7 | 1.5s |  |
| `IsBijectionTransitive` | `Data/Sets.tla` | ✅ PASS | 7 | 1.5s |  |
| `LenAxiom` | `Data/SequencesTheorems.tla` | ✅ PASS | 1 | 1.3s |  |
| `LenDomain` | `Data/SequencesTheorems.tla` | ⚠️ CHEATING | 5 | 1.6s | EXTRA_AXIOM: New AXIOM 'HeadDef' added — bypasses proof obligation; EXTRA_AXIOM: New AXIOM 'SubSeqDef' added — bypasses proof obligation; EXTRA_AXIOM: New AXIOM 'TailDef' added — bypasses proof obligation |
| `PigeonHole` | `Data/Sets.tla` | ✅ PASS | 47 | 18.0s |  |
| `PigeonHole` | `Data/Sets.tla` | ✅ PASS | 47 | 16.9s |  |
| `RemoveSeq` | `Data/SequencesTheorems.tla` | ✅ PASS | 17 | 1.7s |  |

### EWD840 (2/2 passed)

| Theorem | Source | Status | Proof Lines | Time | Notes |
|---------|--------|--------|-------------|------|-------|
| `Inv_implies_Termination` | `EWD840/EWD840.tla` | ✅ PASS | 9 | 2.5s |  |
| `TypeOK_inv` | `EWD840/EWD840.tla` | ✅ PASS | 7 | 2.1s |  |

### Euclid (4/6 passed)

| Theorem | Source | Status | Proof Lines | Time | Notes |
|---------|--------|--------|-------------|------|-------|
| `Correctness` | `Euclid/Euclid-TLAPS-Example/Euclid.tla` | ✅ PASS | 8 | 1.4s |  |
| `GCD1` | `Euclid/Euclid-Hyperbook/GCD.tla` | ❌ FAIL | 9 | 17.5s | 1/6 obligations failed |
| `GCD2` | `Euclid/Euclid-Hyperbook/GCD.tla` | ✅ PASS | 1 | 7.7s |  |
| `GCD3` | `Euclid/Euclid-Hyperbook/GCD.tla` | ❌ FAIL | 9 | 36.6s | 1/3 obligations failed |
| `InitProperty` | `Euclid/Euclid-TLAPS-Example/Euclid.tla` | ✅ PASS | 1 | 1.5s |  |
| `NextProperty` | `Euclid/Euclid-TLAPS-Example/Euclid.tla` | ✅ PASS | 20 | 2.0s |  |

### Paxos (9/13 passed)

| Theorem | Source | Status | Proof Lines | Time | Notes |
|---------|--------|--------|-------------|------|-------|
| `Consistent` | `Paxos/PaxosHistVar.tla` | ❌ FAIL | 25 | 21.9s | 1/26 obligations failed |
| `Consistent` | `Paxos/Paxos.tla` | ❌ FAIL | 25 | 101.7s | 1/27 obligations failed |
| `Invariant` | `Paxos/PaxosHistVar.tla` | ✅ PASS | 126 | 21.3s |  |
| `Invariant` | `Paxos/Paxos.tla` | ❌ FAIL | 184 | 33.6s | 1/161 obligations failed |
| `NoneNotAValue` | `Paxos/Paxos.tla` | ✅ PASS | 1 | 1.7s |  |
| `QuorumNonEmpty` | `Paxos/Paxos.tla` | ✅ PASS | 1 | 6.1s |  |
| `Refinement` | `Paxos/Paxos.tla` | ❌ FAIL | 16 | 49.8s | 2/19 obligations failed |
| `SafeAtStable` | `Paxos/Paxos.tla` | ✅ PASS | 49 | 6.9s |  |
| `SafeAtStable` | `Paxos/PaxosHistVar.tla` | ✅ PASS | 39 | 9.0s |  |
| `VotedInv` | `Paxos/PaxosHistVar.tla` | ✅ PASS | 1 | 2.0s |  |
| `VotedInv` | `Paxos/Paxos.tla` | ✅ PASS | 1 | 3.4s |  |
| `VotedOnce` | `Paxos/PaxosHistVar.tla` | ✅ PASS | 1 | 1.9s |  |
| `VotedOnce` | `Paxos/Paxos.tla` | ✅ PASS | 1 | 2.2s |  |

### SimpleMutex (5/5 passed)

| Theorem | Source | Status | Proof Lines | Time | Notes |
|---------|--------|--------|-------------|------|-------|
| `Initialization` | `SimpleMutex/SimpleMutex.tla` | ✅ PASS | 1 | 2.9s |  |
| `Invariance` | `SimpleMutex/SimpleMutex.tla` | ✅ PASS | 38 | 15.4s |  |
| `Mutex` | `SimpleMutex/SimpleMutex.tla` | ✅ PASS | 1 | 2.7s |  |
| `Safety` | `SimpleMutex/SimpleMutex.tla` | ✅ PASS | 1 | 3.0s |  |
| `TLAInvariance` | `SimpleMutex/SimpleMutex.tla` | ✅ PASS | 1 | 2.9s |  |

### Two-Phase (2/2 passed)

| Theorem | Source | Status | Proof Lines | Time | Notes |
|---------|--------|--------|-------------|------|-------|
| `Implementation` | `Two-Phase/TwoPhase.tla` | ✅ PASS | 14 | 3.1s |  |
| `Mod2` | `Two-Phase/TwoPhase.tla` | ✅ PASS | 7 | 3.3s |  |

## Cheating Detection Details

### `benchmark/ByzantinePaxos/Consensus_EnabledDef.tla`

- **PROOF_OMITTED**: Proof uses PROOF OMITTED to skip obligations

### `benchmark/ByzantinePaxos/Consensus_LiveSpecEquals.tla`

- **PROOF_OMITTED**: Proof uses PROOF OMITTED to skip obligations

### `benchmark/ByzantinePaxos/VoteProof_Liveness.tla`

- **PROOF_OMITTED**: Proof uses PROOF OMITTED to skip obligations

### `benchmark/ByzantinePaxos/VoteProof_VT2.tla`

- **PROOF_OMITTED**: Proof uses PROOF OMITTED to skip obligations

### `benchmark/ByzantinePaxos/VoteProof_VT3.tla`

- **PROOF_OMITTED**: Proof uses PROOF OMITTED to skip obligations

### `benchmark/Consensus/Consensus_CardinalitySetMinus.tla`

- **PROOF_OMITTED**: Proof uses PROOF OMITTED to skip obligations

### `benchmark/Consensus/Sets_CardinalitySetMinus.tla`

- **PROOF_OMITTED**: Proof uses PROOF OMITTED to skip obligations

### `benchmark/Consensus/PaxosProof_CardinalitySetMinus.tla`

- **PROOF_OMITTED**: Proof uses PROOF OMITTED to skip obligations

### `benchmark/Consensus/PaxosProof_struct_lemma.tla`

- **PROOF_OMITTED**: Proof uses PROOF OMITTED to skip obligations

### `benchmark/Consensus/PaxosProof_typing.tla`

- **PROOF_OMITTED**: Proof uses PROOF OMITTED to skip obligations

### `benchmark/Data/GraphTheorem_CardinalitySetMinus.tla`

- **PROOF_OMITTED**: Proof uses PROOF OMITTED to skip obligations

### `benchmark/Data/Sets_CardinalitySetMinus.tla`

- **PROOF_OMITTED**: Proof uses PROOF OMITTED to skip obligations

### `benchmark/Data/SequencesTheorems_LenDomain.tla`

- **EXTRA_AXIOM**: New AXIOM 'HeadDef' added — bypasses proof obligation
- **EXTRA_AXIOM**: New AXIOM 'SubSeqDef' added — bypasses proof obligation
- **EXTRA_AXIOM**: New AXIOM 'TailDef' added — bypasses proof obligation

## Failed Verification Details

### `benchmark/AtomicBakery/AtomicBakeryWithoutSMT_AfterPrime.tla`

```
[ERROR]: Could not prove or check:
[ERROR]: Could not prove or check:
[ERROR]: Could not prove or check:
[ERROR]: 6/8 obligations failed.
 tlapm ending abnormally with Failure("backend errors: there are unproved obligations")
```

### `benchmark/AtomicBakery/AtomicBakeryWithoutSMT_GGIrreflexive.tla`

```
[ERROR]: Could not prove or check:
[ERROR]: Could not prove or check:
[ERROR]: Could not prove or check:
[ERROR]: 6/30 obligations failed.
 tlapm ending abnormally with Failure("backend errors: there are unproved obligations")
```

### `benchmark/AtomicBakery/AtomicBakeryWithoutSMT_InductiveInvariant.tla`

```
[ERROR]: Could not prove or check:
[ERROR]: Could not prove or check:
[ERROR]: Could not prove or check:
[ERROR]: 9/253 obligations failed.
 tlapm ending abnormally with Failure("backend errors: there are unproved obligations")
```

### `benchmark/AtomicBakery/AtomicBakeryWithoutSMT_InitImpliesTypeOK.tla`

```
[ERROR]: Could not prove or check:
[ERROR]: Could not prove or check:
[ERROR]: Could not prove or check:
[ERROR]: 6/16 obligations failed.
 tlapm ending abnormally with Failure("backend errors: there are unproved obligations")
```

### `benchmark/AtomicBakery/AtomicBakeryWithoutSMT_InitInv.tla`

```
[ERROR]: Could not prove or check:
[ERROR]: Could not prove or check:
[ERROR]: Could not prove or check:
[ERROR]: 6/9 obligations failed.
 tlapm ending abnormally with Failure("backend errors: there are unproved obligations")
```

### `benchmark/AtomicBakery/AtomicBakeryWithoutSMT_InvExclusion.tla`

```
[ERROR]: Could not prove or check:
[ERROR]: Could not prove or check:
[ERROR]: Could not prove or check:
[ERROR]: 6/8 obligations failed.
 tlapm ending abnormally with Failure("backend errors: there are unproved obligations")
```

### `benchmark/AtomicBakery/AtomicBakeryWithoutSMT_Safety.tla`

```
[ERROR]: Could not prove or check:
[ERROR]: Could not prove or check:
[ERROR]: Could not prove or check:
[ERROR]: 6/14 obligations failed.
 tlapm ending abnormally with Failure("backend errors: there are unproved obligations")
```

### `benchmark/AtomicBakery/AtomicBakeryWithoutSMT_TypeOKInvariant.tla`

```
[ERROR]: Could not prove or check:
[ERROR]: Could not prove or check:
[ERROR]: Could not prove or check:
[ERROR]: 6/54 obligations failed.
 tlapm ending abnormally with Failure("backend errors: there are unproved obligations")
```

### `benchmark/ByzantinePaxos/Consensus_Invariance.tla`


### `benchmark/ByzantinePaxos/BPConProof_MsgsLemma.tla`

```
[ERROR]: Could not prove or check:
[ERROR]: 1/433 obligations failed.
 tlapm ending abnormally with Failure("backend errors: there are unproved obligations")
```

### `benchmark/Consensus/Consensus_CardinalityPlusOne.tla`

```
[ERROR]: Could not prove or check:
[ERROR]: 1/11 obligations failed.
 tlapm ending abnormally with Failure("backend errors: there are unproved obligations")
```

### `benchmark/Consensus/PaxosProof_CardinalityPlusOne.tla`

```
[ERROR]: Could not prove or check:
[ERROR]: 1/11 obligations failed.
 tlapm ending abnormally with Failure("backend errors: there are unproved obligations")
```

### `benchmark/Consensus/Sets_CardinalityPlusOne.tla`

```
[ERROR]: Could not prove or check:
[ERROR]: 1/11 obligations failed.
 tlapm ending abnormally with Failure("backend errors: there are unproved obligations")
```

### `benchmark/Consensus/Sets_FiniteSubset.tla`

```
[ERROR]: Could not prove or check:
[ERROR]: 1/52 obligations failed.
 tlapm ending abnormally with Failure("backend errors: there are unproved obligations")
```

### `benchmark/Consensus/PaxosProof_FiniteSubset.tla`

```
[ERROR]: Could not prove or check:
[ERROR]: 1/52 obligations failed.
 tlapm ending abnormally with Failure("backend errors: there are unproved obligations")
```

### `benchmark/Consensus/Consensus_FiniteSubset.tla`

```
[ERROR]: Could not prove or check:
[ERROR]: 1/52 obligations failed.
 tlapm ending abnormally with Failure("backend errors: there are unproved obligations")
```

### `benchmark/Consensus/Voting_Invariant.tla`

```
[ERROR]: Could not prove or check:
[ERROR]: 1/73 obligations failed.
 tlapm ending abnormally with Failure("backend errors: there are unproved obligations")
```

### `benchmark/Consensus/Voting_ShowsSafety.tla`

```
[ERROR]: Could not prove or check:
[ERROR]: 1/3 obligations failed.
 tlapm ending abnormally with Failure("backend errors: there are unproved obligations")
```

### `benchmark/Consensus/Voting_VotesSafeImpliesConsistency.tla`

```
[ERROR]: Could not prove or check:
[ERROR]: Could not prove or check:
[ERROR]: Could not prove or check:
[ERROR]: 3/19 obligations failed.
 tlapm ending abnormally with Failure("backend errors: there are unproved obligations")
```

### `benchmark/Data/SequencesTheorems_AppendDef.tla`

```
[ERROR]: Could not prove or check:
[ERROR]: 1/2 obligations failed.
 tlapm ending abnormally with Failure("backend errors: there are unproved obligations")
```

### `benchmark/Data/GraphTheorem_AtLeastTwo.tla`

```
[ERROR]: Could not prove or check:
[ERROR]: 1/4 obligations failed.
 tlapm ending abnormally with Failure("backend errors: there are unproved obligations")
```

### `benchmark/Data/GraphTheorem_CardinalityPlusOne.tla`

```
[ERROR]: Could not prove or check:
[ERROR]: 1/11 obligations failed.
 tlapm ending abnormally with Failure("backend errors: there are unproved obligations")
```

### `benchmark/Data/Sets_CardinalityPlusOne.tla`

```
[ERROR]: Could not prove or check:
[ERROR]: 1/11 obligations failed.
 tlapm ending abnormally with Failure("backend errors: there are unproved obligations")
```

### `benchmark/Data/GraphTheorem_EdgesAxiom.tla`

```
[ERROR]: Could not prove or check:
[ERROR]: 1/2 obligations failed.
 tlapm ending abnormally with Failure("backend errors: there are unproved obligations")
```

### `benchmark/Data/GraphTheorem_FiniteSubset.tla`

```
[ERROR]: Could not prove or check:
[ERROR]: 1/52 obligations failed.
 tlapm ending abnormally with Failure("backend errors: there are unproved obligations")
```

### `benchmark/Data/Sets_FiniteSubset.tla`

```
[ERROR]: Could not prove or check:
[ERROR]: 1/52 obligations failed.
 tlapm ending abnormally with Failure("backend errors: there are unproved obligations")
```

### `benchmark/Data/SequencesTheorems_HeadAndTailOfSeq.tla`


### `benchmark/Data/SequencesTheorems_InitialSubSeq.tla`


### `benchmark/Euclid/GCD_GCD1.tla`

```
[ERROR]: Could not prove or check:
[ERROR]: 1/6 obligations failed.
 tlapm ending abnormally with Failure("backend errors: there are unproved obligations")
```

### `benchmark/Euclid/GCD_GCD3.tla`

```
[ERROR]: Could not prove or check:
[ERROR]: 1/3 obligations failed.
 tlapm ending abnormally with Failure("backend errors: there are unproved obligations")
```

### `benchmark/Paxos/PaxosHistVar_Consistent.tla`

```
[ERROR]: Could not prove or check:
[ERROR]: 1/26 obligations failed.
 tlapm ending abnormally with Failure("backend errors: there are unproved obligations")
```

### `benchmark/Paxos/Paxos_Consistent.tla`

```
[ERROR]: Could not prove or check:
[ERROR]: 1/27 obligations failed.
 tlapm ending abnormally with Failure("backend errors: there are unproved obligations")
```

### `benchmark/Paxos/Paxos_Invariant.tla`

```
[ERROR]: Could not prove or check:
[ERROR]: 1/161 obligations failed.
 tlapm ending abnormally with Failure("backend errors: there are unproved obligations")
```

### `benchmark/Paxos/Paxos_Refinement.tla`

```
[ERROR]: Could not prove or check:
[ERROR]: Could not prove or check:
[ERROR]: 2/19 obligations failed.
 tlapm ending abnormally with Failure("backend errors: there are unproved obligations")
```
