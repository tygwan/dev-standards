# Memory Index Template

This is the template index of Claude Code memory rules that apply when
working in a project following `dev-standards`.

When setting up a new project, copy the `feedback_*.md` files from
`dev-standards/memory/` into the project's Claude Code memory directory
(typically `~/.claude/projects/<project-slug>/memory/`), and copy this
`MEMORY.md` as the index.

## Default rules (from dev-standards@0.1.0)

- [Task logging rule](feedback_task_logging.md) — R2: Each completed task must be recorded with 5 sections in `docs/tasklog/`
- [Finding archive rule](feedback_finding_archive.md) — R3: Every data issue discovered must be immediately archived to `docs/findings/YYYY-MM-DD-ID-slug/` with audit script, evidence, and figures, then committed
- [Portal update rule](feedback_portal_update.md) — R1/R4: Updates to findings/decisions/timelines must be reflected in `docs/PROJECT-JOURNAL.md` immediately

## Project-specific rules

Add per-project rules below this line as you discover them.
