"""Stable specification identities for generated benchmark tasks."""

from __future__ import annotations

from pathlib import Path


def source_spec_id(source_path: str, source_root: str) -> str:
    """Identify a specification by its source-root-relative TLA+ path.

    Repository datasets use paths relative to ``source/``. A generator invoked
    on an external file falls back to its basename because it has no stable
    repository-relative path.
    """

    source = Path(source_path).resolve()
    try:
        relative = source.relative_to(Path(source_root).resolve())
    except ValueError:
        relative = Path(source.name)
    return relative.as_posix()
