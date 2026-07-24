"""Synthetic end-to-end runner boundary for proof-from-scratch."""

from __future__ import annotations

import json
import os
from pathlib import Path

from common.proof_from_scratch_contract import (
    BEGIN_AGENT_HELPERS,
    BEGIN_AGENT_PROOF,
    END_AGENT_HELPERS,
    END_AGENT_PROOF,
)
from evaluator import runner
from evaluator.backends.agentic import AgenticBackend
from evaluator.modes.proof_from_scratch import ProofFromScratch


class _Backend(AgenticBackend):
    name = "copilot"

    def build_command(self, workspace, result_dir):
        return ["fake-agent"]

    def parse_output(self, jsonl_path):
        return "", 0, 100

    def detect_quota_block(self, jsonl_path):
        return None


def _module(name, body=""):
    return f"---- MODULE {name} ----\n{body}====\n"


def _task():
    return "\n".join(
        (
            "---- MODULE Task ----",
            "EXTENDS Model",
            BEGIN_AGENT_HELPERS,
            "",
            END_AGENT_HELPERS,
            "THEOREM Target == TRUE",
            BEGIN_AGENT_PROOF,
            "PROOF OBVIOUS",
            END_AGENT_PROOF,
            "====",
            "",
        )
    )


def test_runner_exposes_only_manifest_context_and_grades_on_fresh_snapshot(tmp_path, monkeypatch):
    suite = tmp_path / "benchmark" / "proof-from-scratch"
    task = suite / "Suite" / "Task.tla"
    model = suite / "Context" / "Model.tla"
    sibling = suite / "Suite" / "Sibling_Task.tla"
    unrelated = suite / "Suite" / "UnrelatedDefs.tla"
    task.parent.mkdir(parents=True)
    model.parent.mkdir(parents=True)
    task.write_text(_task())
    model.write_text(_module("Model", "Value == TRUE\n"))
    sibling.write_text(_module("Sibling_Task", "THEOREM Leak == TRUE\nPROOF OBVIOUS\n"))
    unrelated.write_text(_module("UnrelatedDefs", "Leak == TRUE\n"))
    (suite / "manifest.json").write_text(json.dumps({"Suite/Task.tla": {"context": ["Context/Model.tla"]}}))

    mode = ProofFromScratch(str(tmp_path / "benchmark"), "/checker")
    backend = _Backend()
    agent_canonical_dirs = []
    grader_canonical_dirs = []

    def fake_agent(
        item,
        backend_,
        mode_,
        workspace,
        agent_dir,
        agent_jsonl,
        prompt,
        result,
        checker_bin,
        canonical_dir=None,
    ):
        assert sorted(name for name in os.listdir(workspace) if name.endswith(".tla")) == ["Model.tla", "Task.tla"]
        assert os.stat(os.path.join(workspace, "Model.tla")).st_mode & 0o777 == 0o444
        assert os.stat(os.path.join(workspace, "Task.tla")).st_mode & 0o200
        assert sorted(name for name in os.listdir(canonical_dir) if name.endswith(".tla")) == [
            "Model.tla",
            "Task.tla",
        ]
        agent_canonical_dirs.append(canonical_dir)
        with open(agent_jsonl, "w") as f:
            f.write('{"type": "result", "exitCode": 0}\n')
        result["agent_exit"] = 0

    def fake_grader(item, workspace, basename, grading_dir, check_result_path, result, canonical_dir=None):
        assert (Path(canonical_dir) / "Model.tla").read_text() == model.read_text()
        grader_canonical_dirs.append(canonical_dir)
        result["check_verdict"] = "FAIL"

    monkeypatch.setattr(runner, "_run_backend_local", fake_agent)
    monkeypatch.setattr(runner, "_run_grader_local", fake_grader)

    item = runner.WorkItem(
        benchmark_path=str(task),
        output_dir=str(tmp_path / "results"),
        timeout=10,
        check_timeout=10,
        backend=backend,
        mode=mode,
        tlapm_path="/opt/tlapm",
        tlapm_lib="/opt/tlapm/lib",
        infra_retries=0,
    )
    runner.run_single_benchmark(item)

    input_dir = tmp_path / "results" / "Suite" / "Task" / "input"
    assert sorted(path.name for path in input_dir.iterdir()) == ["Model.tla", "benchmark.tla", "prompt.txt"]
    assert (input_dir / "benchmark.tla").read_text() == task.read_text()
    assert BEGIN_AGENT_HELPERS in (input_dir / "prompt.txt").read_text()
    assert grader_canonical_dirs[0] != agent_canonical_dirs[0]
