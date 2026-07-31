"""Portable Agent Skill catalog discovery and metadata validation."""

from __future__ import annotations

import json
import re
from dataclasses import dataclass
from pathlib import Path

_SKILL_NAME = re.compile(r"[a-z0-9]+(?:-[a-z0-9]+)*")
_REQUIRED_FIELDS = ("name", "description")


@dataclass(frozen=True)
class AgentSkill:
    """One validated skill in a project catalog."""

    name: str
    description: str
    source_dir: Path


def _yaml_scalar(raw_value: str, skill_file: Path, field: str) -> str:
    """Parse the one-line YAML string forms used by Agent Skill metadata."""

    value = raw_value.lstrip()
    if not value or value.startswith("#"):
        raise ValueError(f"empty {field} in Agent Skill metadata: {skill_file}")
    if re.fullmatch(r"[>|][+-]?\d*(?:\s+#.*)?", value):
        raise ValueError(f"{field} must use a one-line string in Agent Skill metadata: {skill_file}")

    if value.startswith('"'):
        try:
            parsed, end = json.JSONDecoder().raw_decode(value)
        except (json.JSONDecodeError, TypeError) as exc:
            raise ValueError(f"invalid quoted {field} in Agent Skill metadata: {skill_file}") from exc
        if not isinstance(parsed, str):
            raise ValueError(f"{field} must be a string in Agent Skill metadata: {skill_file}")
        remainder = value[end:]
    elif value.startswith("'"):
        characters: list[str] = []
        position = 1
        while position < len(value):
            if value[position] != "'":
                characters.append(value[position])
                position += 1
            elif position + 1 < len(value) and value[position + 1] == "'":
                characters.append("'")
                position += 2
            else:
                position += 1
                break
        else:
            raise ValueError(f"invalid quoted {field} in Agent Skill metadata: {skill_file}")
        parsed = "".join(characters)
        remainder = value[position:]
    else:
        comment = re.search(r"\s+#", value)
        if comment:
            parsed = value[: comment.start()].rstrip()
            remainder = value[comment.start() :]
        else:
            parsed = value.rstrip()
            remainder = ""

    if remainder.strip() and re.fullmatch(r"\s+#.*", remainder) is None:
        raise ValueError(f"invalid trailing content in {field} metadata: {skill_file}")
    if not parsed:
        raise ValueError(f"empty {field} in Agent Skill metadata: {skill_file}")
    return parsed


def _skill_metadata(skill_file: Path) -> tuple[str, str]:
    lines = skill_file.read_text(encoding="utf-8").splitlines()
    if not lines or lines[0].strip() != "---":
        raise ValueError(f"SKILL.md is missing YAML frontmatter: {skill_file}")

    fields: dict[str, str] = {}
    frontmatter_end: int | None = None
    for index, line in enumerate(lines[1:], start=1):
        if line.strip() == "---":
            frontmatter_end = index
            break
        if not line or line[0].isspace():
            continue
        key, separator, raw_value = line.partition(":")
        key = key.strip()
        if not separator or key not in _REQUIRED_FIELDS:
            continue
        if key in fields:
            raise ValueError(f"duplicate {key} in Agent Skill metadata: {skill_file}")
        fields[key] = _yaml_scalar(raw_value, skill_file, key)

    if frontmatter_end is None:
        raise ValueError(f"SKILL.md has unclosed YAML frontmatter: {skill_file}")
    missing = [field for field in _REQUIRED_FIELDS if field not in fields]
    if missing:
        raise ValueError(f"SKILL.md is missing required metadata {', '.join(missing)}: {skill_file}")
    if not any(line.strip() for line in lines[frontmatter_end + 1 :]):
        raise ValueError(f"SKILL.md has no instructions: {skill_file}")
    return fields["name"], fields["description"]


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
