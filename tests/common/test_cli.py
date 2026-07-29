"""Top-level CLI argument routing."""

from tlaps_bench import cli


def test_public_check_enables_strict_proof_from_scratch_default(monkeypatch):
    captured = {}

    def fake_dispatch(prog, module_name, attr, passthrough, *, entry_kwargs=None):
        captured.update(
            prog=prog,
            module_name=module_name,
            attr=attr,
            passthrough=passthrough,
            entry_kwargs=entry_kwargs,
        )
        return 0

    monkeypatch.setattr(cli, "_dispatch", fake_dispatch)

    assert cli.main(["check", "Task.tla", "--mode", "proof-from-scratch"]) == 0
    assert captured == {
        "prog": "tlaps-bench check",
        "module_name": "common.check_proof",
        "attr": "main",
        "passthrough": ["Task.tla", "--mode", "proof-from-scratch"],
        "entry_kwargs": {"require_canonical_for_proof_from_scratch": True},
    }
