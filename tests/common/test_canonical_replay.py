"""Canonical proof-from-scratch staging and fixed-region integrity."""

from __future__ import annotations

import sys

import pytest

from common import check_proof
from common.proof_from_scratch_contract import (
    BEGIN_AGENT_HELPERS,
    BEGIN_AGENT_PROOF,
    END_AGENT_HELPERS,
    END_AGENT_PROOF,
)


def _task(*, helper="Helper == TRUE", proof="PROOF OBVIOUS", statement="THEOREM Target == TRUE"):
    return "\n".join(
        (
            "---- MODULE Task ----",
            "EXTENDS Model",
            "",
            BEGIN_AGENT_HELPERS,
            helper,
            END_AGENT_HELPERS,
            "",
            statement,
            BEGIN_AGENT_PROOF,
            proof,
            END_AGENT_PROOF,
            "====",
            "",
        )
    )


def test_canonical_replay_stages_submitted_target_with_only_canonical_context(tmp_path):
    workspace = tmp_path / "workspace"
    canonical = tmp_path / "canonical"
    staged = tmp_path / "staged"
    workspace.mkdir()
    canonical.mkdir()
    staged.mkdir()

    submitted = _task(proof="PROOF BY TRUE")
    (workspace / "Task.tla").write_text(submitted)
    (workspace / "Model.tla").write_text("TAMPERED MODEL")
    (workspace / "AgentOnly.tla").write_text("AGENT MODULE")
    (canonical / "Task.tla").write_text(_task())
    (canonical / "Model.tla").write_text("CANONICAL MODEL")
    (canonical / "Defs.tla").write_text("CANONICAL DEFS")

    staged_target = check_proof.stage_verification_files(
        str(workspace / "Task.tla"),
        str(staged),
        benchmark_dir=str(canonical),
        require_canonical=True,
    )

    assert (staged / "Task.tla").read_text() == submitted
    assert (staged / "Model.tla").read_text() == "CANONICAL MODEL"
    assert (staged / "Defs.tla").read_text() == "CANONICAL DEFS"
    assert not (staged / "AgentOnly.tla").exists()
    assert staged_target == str(staged / "Task.tla")


def test_noncanonical_staging_preserves_existing_workspace_behavior(tmp_path):
    workspace = tmp_path / "workspace"
    canonical = tmp_path / "canonical"
    staged = tmp_path / "staged"
    workspace.mkdir()
    canonical.mkdir()
    staged.mkdir()
    (workspace / "Task.tla").write_text("SUBMITTED")
    (workspace / "Model.tla").write_text("WORKSPACE MODEL")
    (canonical / "Task.tla").write_text("CANONICAL")
    (canonical / "Model.tla").write_text("CANONICAL MODEL")

    check_proof.stage_verification_files(
        str(workspace / "Task.tla"),
        str(staged),
        benchmark_dir=str(canonical),
        require_canonical=False,
    )

    assert (staged / "Task.tla").read_text() == "SUBMITTED"
    assert (staged / "Model.tla").read_text() == "WORKSPACE MODEL"


def test_canonical_staging_fails_without_canonical_directory(tmp_path):
    target = tmp_path / "Task.tla"
    staged = tmp_path / "staged"
    target.write_text("SUBMITTED")
    staged.mkdir()

    with pytest.raises(ValueError, match="canonical replay required"):
        check_proof.stage_verification_files(str(target), str(staged), require_canonical=True)


def test_helper_and_proof_region_changes_preserve_fixed_scaffold(tmp_path):
    canonical = tmp_path / "canonical"
    canonical.mkdir()
    target = tmp_path / "Task.tla"
    (canonical / "Task.tla").write_text(_task())
    target.write_text(_task(helper="Fresh == 1", proof="PROOF BY TRUE"))

    assert check_proof.check_editable_region_integrity(str(target), str(canonical)) == []


def test_fixed_scaffold_change_is_rejected(tmp_path):
    canonical = tmp_path / "canonical"
    canonical.mkdir()
    target = tmp_path / "Task.tla"
    (canonical / "Task.tla").write_text(_task())
    target.write_text(_task(statement="THEOREM Target == FALSE"))

    issues = check_proof.check_editable_region_integrity(str(target), str(canonical))

    assert issues == [(0, "fixed task scaffold outside editable regions was modified", "SCAFFOLD_MODIFIED")]


def test_marker_change_is_rejected(tmp_path):
    canonical = tmp_path / "canonical"
    canonical.mkdir()
    target = tmp_path / "Task.tla"
    (canonical / "Task.tla").write_text(_task())
    target.write_text(_task().replace(BEGIN_AGENT_PROOF, r"\* AGENT PROOF", 1))

    issues = check_proof.check_editable_region_integrity(str(target), str(canonical))

    assert issues[0][2] == "SCAFFOLD_MODIFIED"
    assert "markers were modified" in issues[0][1]


def test_invalid_canonical_markers_are_infrastructure_error(tmp_path):
    canonical = tmp_path / "canonical"
    canonical.mkdir()
    target = tmp_path / "Task.tla"
    (canonical / "Task.tla").write_text(_task().replace(END_AGENT_HELPERS, "", 1))
    target.write_text(_task())

    with pytest.raises(RuntimeError, match="canonical proof-from-scratch task has invalid editable regions"):
        check_proof.check_editable_region_integrity(str(target), str(canonical))


def test_canonical_replay_requirement_can_come_from_runner_environment(monkeypatch):
    monkeypatch.delenv("TLAPS_CANONICAL_REPLAY_REQUIRED", raising=False)
    assert not check_proof.canonical_replay_required(False)
    monkeypatch.setenv("TLAPS_CANONICAL_REPLAY_REQUIRED", "1")
    assert check_proof.canonical_replay_required(False)
    assert check_proof.canonical_replay_required(True)


def test_fixed_scaffold_failure_stops_before_tlapm(tmp_path, monkeypatch):
    canonical = tmp_path / "canonical"
    workspace = tmp_path / "workspace"
    canonical.mkdir()
    workspace.mkdir()
    (canonical / "Task.tla").write_text(_task())
    (canonical / "Model.tla").write_text("---- MODULE Model ----\n====\n")
    target = workspace / "Task.tla"
    target.write_text(_task(statement="THEOREM Target == FALSE"))
    (workspace / "Model.tla").write_text("---- MODULE Model ----\n====\n")
    output = tmp_path / "check.result"

    monkeypatch.setattr(check_proof, "check_sany_valid", lambda _path: ("valid", ""))
    monkeypatch.setattr(
        check_proof,
        "run_killgroup",
        lambda *_args, **_kwargs: pytest.fail("boundary failure must stop before TLAPM"),
    )
    monkeypatch.setattr(
        sys,
        "argv",
        [
            "check_proof",
            str(target),
            "--mode",
            "proof-from-scratch",
            "--no-container",
            "--no-git-track",
            "--canonical-replay-required",
            "--benchmark-dir",
            str(canonical),
            "--tlapm",
            "/bin/true",
            "--tlapm-lib",
            str(tmp_path),
            "--output",
            str(output),
        ],
    )

    with pytest.raises(SystemExit) as exc_info:
        check_proof.main()

    assert exc_info.value.code == 1
    assert "fixed task scaffold outside editable regions was modified" in output.read_text()
