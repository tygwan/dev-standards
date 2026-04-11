# Project: {{PROJECT_NAME}}

> Runtime activation point for dev-standards rules in Claude Code sessions.

---

## Dev standards version

- **Source**: https://github.com/tygwan/dev-standards
- **Version pinned**: `0.1.0`
- **Rules applied**: R1-R9 (see source for details)

## Active memory rules

Claude Code memory files in `~/.claude/projects/.../memory/` apply the
following rules at session start:

- `feedback_task_logging.md` — R2 (5-section task log in `docs/tasklog/`)
- `feedback_finding_archive.md` — R3 (6-step issue archive in `docs/findings/`)
- `feedback_portal_update.md` — R1/R4 (single-portal `PROJECT-JOURNAL.md`)

If these memory files are missing, copy them from
[`dev-standards/memory/`](https://github.com/tygwan/dev-standards/tree/main/memory)
to the local Claude Code project memory directory.

## Project-specific context

<!-- Fill in per project -->

- **Goal**: {{PROJECT_GOAL}}
- **Current phase**: {{CURRENT_PHASE}}
- **Primary targets**: {{PRIMARY_TARGETS}}
- **Key data sources**: {{KEY_DATA_SOURCES}}

## Conventions this project follows

- **Directory layout**: R1 — `docs/{plan,analysis,tasklog,findings,reference}/`
- **Single portal**: R1 — `docs/PROJECT-JOURNAL.md`
- **Task logging**: R2 — 5-section format, written at task completion
- **Finding archival**: R3 — 6-step process with matplotlib visualizations
- **Decision records**: R4 — in `PROJECT-JOURNAL.md §4` with stable IDs (D1, D2, ...)
- **Git workflow**: R5 — atomic commits, imperative titles, commit+push pair
- **External dependencies**: R6 — registered in `PROJECT-JOURNAL.md §5`
- **Issue severity**: R7 — 🔴 CRITICAL / 🟠 MAJOR / 🟡 MINOR
- **Human-AI collab**: R8 — trade-off analysis + escalation on structural decisions
- **Provenance**: R9 — version pinning, lineage columns, reproducible audits

## Quick commands (add project-specific)

```bash
# Install / setup
# Test
# Lint
# Run
```

## Related

- [dev-standards repo](https://github.com/tygwan/dev-standards)
- [`PROJECT-JOURNAL.md`](docs/PROJECT-JOURNAL.md) — single navigation portal
