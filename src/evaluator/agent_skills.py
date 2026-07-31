"""Portable Agent Skill catalog discovery and metadata validation."""

from __future__ import annotations

import re
from dataclasses import dataclass
from pathlib import Path

import yaml

_SKILL_NAME = re.compile(r"[a-z0-9]+(?:-[a-z0-9]+)*")
_REQUIRED_FIELDS = ("name", "description")
_MAX_NAME_LENGTH = 64
_MAX_DESCRIPTION_LENGTH = 1024


@dataclass(frozen=True)
class AgentSkill:
    """One validated skill in a project catalog."""

    name: str
    description: str
    source_dir: Path


class _UniqueKeyScalarLoader(yaml.BaseLoader):
    """Scalar-preserving YAML loader that rejects duplicate mapping keys."""


def _construct_unique_mapping(loader: yaml.BaseLoader, node: yaml.MappingNode, deep: bool = False) -> dict:
    mapping = {}
    for key_node, value_node in node.value:
        key = loader.construct_object(key_node, deep=deep)
        try:
            duplicate = key in mapping
        except TypeError as exc:
            raise yaml.constructor.ConstructorError(
                "while constructing a mapping",
                node.start_mark,
                "found an unhashable key",
                key_node.start_mark,
            ) from exc
        if duplicate:
            raise yaml.constructor.ConstructorError(
                "while constructing a mapping",
                node.start_mark,
                f"found duplicate key {key!r}",
                key_node.start_mark,
            )
        mapping[key] = loader.construct_object(value_node, deep=deep)
    return mapping


_UniqueKeyScalarLoader.add_constructor(
    yaml.resolver.BaseResolver.DEFAULT_MAPPING_TAG,
    _construct_unique_mapping,
)


def _skill_metadata(skill_file: Path) -> tuple[str, str]:
    lines = skill_file.read_text(encoding="utf-8").splitlines()
    if not lines or lines[0] != "---":
        raise ValueError(f"SKILL.md is missing YAML frontmatter: {skill_file}")

    frontmatter_end: int | None = None
    for index, line in enumerate(lines[1:], start=1):
        if line == "---":
            frontmatter_end = index
            break

    if frontmatter_end is None:
        raise ValueError(f"SKILL.md has unclosed YAML frontmatter: {skill_file}")
    try:
        metadata = yaml.load(
            "\n".join(lines[1:frontmatter_end]),
            Loader=_UniqueKeyScalarLoader,
        )
    except yaml.YAMLError as exc:
        raise ValueError(f"SKILL.md has invalid YAML frontmatter: {skill_file}") from exc
    if not isinstance(metadata, dict):
        raise ValueError(f"SKILL.md frontmatter must be a YAML mapping: {skill_file}")

    missing = [field for field in _REQUIRED_FIELDS if field not in metadata]
    if missing:
        raise ValueError(f"SKILL.md is missing required metadata {', '.join(missing)}: {skill_file}")
    name = metadata["name"]
    description = metadata["description"]
    if not isinstance(name, str):
        raise ValueError(f"Agent Skill name must be a string: {skill_file}")
    if not isinstance(description, str):
        raise ValueError(f"Agent Skill description must be a string: {skill_file}")
    description = description.strip()
    if not 1 <= len(name) <= _MAX_NAME_LENGTH:
        raise ValueError(f"Agent Skill name must be 1-{_MAX_NAME_LENGTH} characters: {skill_file}")
    if not 1 <= len(description) <= _MAX_DESCRIPTION_LENGTH:
        raise ValueError(f"Agent Skill description must be 1-{_MAX_DESCRIPTION_LENGTH} characters: {skill_file}")
    if not any(line.strip() for line in lines[frontmatter_end + 1 :]):
        raise ValueError(f"SKILL.md has no instructions: {skill_file}")
    return name, description


def discover_agent_skills(root: str | Path) -> list[AgentSkill]:
    """Return validated direct-child skills in deterministic name order."""

    root = Path(root)
    if not root.is_dir():
        return []

    skills: list[AgentSkill] = []
    seen_names: set[str] = set()
    for source_dir in sorted(root.iterdir(), key=lambda path: path.name):
        skill_file = source_dir / "SKILL.md"
        if not source_dir.is_dir() or not skill_file.is_file():
            continue
        name, description = _skill_metadata(skill_file)
        if _SKILL_NAME.fullmatch(name) is None:
            raise ValueError(f"invalid Agent Skill name {name!r}: {skill_file}")
        if name != source_dir.name:
            raise ValueError(f"Agent Skill name {name!r} must match directory {source_dir.name!r}: {skill_file}")
        if name in seen_names:
            raise ValueError(f"duplicate Agent Skill name: {name}")
        seen_names.add(name)
        skills.append(AgentSkill(name=name, description=description, source_dir=source_dir))
    return skills
