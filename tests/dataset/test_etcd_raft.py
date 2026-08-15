"""Regression coverage for the etcd Raft QuorumLog constant domain."""

from __future__ import annotations

import os
import shutil
import subprocess
from pathlib import Path

import pytest

REPO = Path(__file__).resolve().parents[2]
TASK_DIR = REPO / "benchmark" / "proof-from-scratch" / "etcd_raft"
SOURCE = REPO / "source" / "etcd_raft" / "etcd_raft.tla"
MODEL = TASK_DIR / "etcd_raftModel.tla"
TLA2TOOLS = REPO / "lib" / "tla2tools.jar"
COMMUNITY = REPO / "lib" / "community"
SUBSET_ASSUMPTION = r"ASSUME InitServerSubset == InitServer \subseteq Server"

CONFIG = """\
SPECIFICATION Spec
INVARIANT QuorumLogInv
CHECK_DEADLOCK FALSE

CONSTANTS
  InitServer = {init_server}
  Server = {server}
  ValueEntry = "ValueEntry"
  ConfigEntry = "ConfigEntry"
  Follower = "Follower"
  Candidate = "Candidate"
  Leader = "Leader"
  Nil = 0
  RequestVoteRequest = "RequestVoteRequest"
  RequestVoteResponse = "RequestVoteResponse"
  AppendEntriesRequest = "AppendEntriesRequest"
  AppendEntriesResponse = "AppendEntriesResponse"
"""


def _run_tlc(tmp_path: Path, *, init_server: str, server: str) -> str:
    if shutil.which("java") is None or not TLA2TOOLS.is_file() or not COMMUNITY.is_dir():
        pytest.skip("TLC dependencies are not installed; run make setup")

    tmp_path.mkdir()
    config = tmp_path / "QuorumLog.cfg"
    config.write_text(CONFIG.format(init_server=init_server, server=server))
    classpath = os.pathsep.join((str(TLA2TOOLS), str(COMMUNITY), str(TASK_DIR)))
    result = subprocess.run(
        [
            "java",
            "-cp",
            classpath,
            "tlc2.TLC",
            "-config",
            str(config),
            "etcd_raft_QuorumLog",
        ],
        cwd=tmp_path,
        capture_output=True,
        text=True,
        timeout=30,
    )
    return result.stdout + result.stderr


def test_quorum_log_rejects_initial_servers_outside_server(tmp_path):
    assert SUBSET_ASSUMPTION in SOURCE.read_text()
    assert SUBSET_ASSUMPTION in MODEL.read_text()

    invalid = _run_tlc(tmp_path / "invalid", init_server="{2}", server="{1}")
    assert "of module etcd_raftModel is false" in invalid
    assert "Computing initial states" not in invalid

    valid = _run_tlc(tmp_path / "valid", init_server="{}", server="{}")
    assert "Model checking completed. No error has been found." in valid
