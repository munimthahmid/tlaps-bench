"""Validate declarations added to the proof-from-scratch helper region."""

from __future__ import annotations

from common.proof_from_scratch_contract import (
    BEGIN_AGENT_HELPERS,
    BEGIN_AGENT_PROOF,
    END_AGENT_HELPERS,
    END_AGENT_PROOF,
    EditableRegionError,
    parse_editable_regions,
)

from ..context import CheckContext
from ..issue import Issue, Severity

name = "HELPER_REGION_VIOLATION"


def _editable_lines(source: str) -> tuple[tuple[int, int], tuple[int, int]] | None:
    lines = source.splitlines()
    try:
        begin_helpers = lines.index(BEGIN_AGENT_HELPERS)
        end_helpers = lines.index(END_AGENT_HELPERS)
        begin_proof = lines.index(BEGIN_AGENT_PROOF)
        end_proof = lines.index(END_AGENT_PROOF)
    except ValueError:
        return None
    return (begin_helpers + 2, end_helpers), (begin_proof + 2, end_proof)


def _inside(loc, bounds: tuple[int, int]) -> bool:
    return loc is not None and bounds[0] <= loc.line_start <= bounds[1]


def _contained(loc, bounds: tuple[int, int]) -> bool:
    return _inside(loc, bounds) and loc.line_end <= bounds[1]


def _issue(
    message: str,
    line: int | None = None,
    evidence: str | None = None,
    *,
    region: str = "helper",
) -> Issue:
    return Issue(
        vector=name,
        severity=Severity.CHEATING,
        message=message,
        location=f"{region} region:{line}" if line else f"{region} region",
        evidence=evidence,
    )


def check(ctx: CheckContext) -> list[Issue]:
    """Allow only operators, directives, and fully proved named lemmas."""

    if not ctx.solution or not ctx.baseline_source:
        return []
    try:
        parse_editable_regions(ctx.baseline_source)
        parse_editable_regions(ctx.solution_source)
    except EditableRegionError:
        return []  # The fixed-region integrity check owns malformed markers.

    bounds = _editable_lines(ctx.solution_source)
    if bounds is None:
        return []
    helper_bounds, proof_bounds = bounds

    issues: list[Issue] = []
    forbidden = (
        ("CONSTANT", ctx.solution.constants),
        ("VARIABLE", ctx.solution.variables),
        ("ASSUME/AXIOM", ctx.solution.assumes),
        ("INSTANCE", ctx.solution.instances),
    )
    for kind, declarations in forbidden:
        for declaration in declarations:
            if _inside(declaration.loc, helper_bounds):
                label = getattr(declaration, "name", None) or kind
                issues.append(
                    _issue(
                        f"{kind} declarations are not allowed in the helper region",
                        declaration.loc.line_start,
                        str(label),
                    )
                )

    for theorem in ctx.solution.theorems:
        if not _inside(theorem.loc, helper_bounds):
            continue
        if theorem.name is None:
            issues.append(
                _issue(
                    "helper THEOREM/LEMMA declarations must be named",
                    theorem.loc.line_start,
                    theorem.display_name,
                )
            )
        if theorem.is_admitted:
            issues.append(
                _issue(
                    "helper THEOREM/LEMMA declarations must include a complete proof",
                    theorem.loc.line_start,
                    theorem.display_name,
                )
            )

    allowed = (
        ("operator", ctx.solution.operators),
        ("THEOREM/LEMMA", ctx.solution.theorems),
        ("module directive", ctx.solution.directives),
    )
    for kind, declarations in allowed:
        for declaration in declarations:
            if _inside(declaration.loc, helper_bounds) and not _contained(declaration.loc, helper_bounds):
                issues.append(
                    _issue(
                        f"{kind} declarations must be contained in the helper region",
                        declaration.loc.line_start,
                    )
                )

    declarations = forbidden + (
        ("operator", ctx.solution.operators),
        ("THEOREM/LEMMA", ctx.solution.theorems),
        ("nested module", ctx.solution.inner_modules),
        ("module directive", ctx.solution.directives),
        ("unclassified top-level", ctx.solution.other_top_levels),
    )
    for kind, items in declarations:
        for declaration in items:
            if _inside(declaration.loc, proof_bounds):
                label = getattr(declaration, "name", None) or kind
                issues.append(
                    _issue(
                        f"module-level {kind} declarations belong in the helper region",
                        declaration.loc.line_start,
                        str(label),
                        region="proof",
                    )
                )

    for inner in ctx.solution.inner_modules:
        if _inside(inner.loc, helper_bounds):
            issues.append(
                _issue(
                    "nested modules are not allowed in the helper region",
                    inner.loc.line_start,
                    inner.name,
                )
            )

    for directive in ctx.solution.directives:
        if _inside(directive.loc, helper_bounds) and not directive.definitions_only:
            issues.append(
                _issue(
                    f"module-level {directive.kind} directives in the helper region must use DEF",
                    directive.loc.line_start,
                )
            )

    for node in ctx.solution.other_top_levels:
        if _inside(node.loc, helper_bounds):
            issues.append(
                _issue(
                    "unclassified top-level declarations are not allowed in the helper region",
                    node.loc.line_start,
                    node.kind,
                )
            )

    return issues
