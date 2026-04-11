# Changelog

All notable changes to `dev-standards` will be documented in this file.

Format: [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).
Versioning: [Semver](https://semver.org/) with pragmatic interpretation.

---

## [0.1.0] — 2026-04-12

### Added — Initial release

**Philosophy and framework**
- `README.md` describing repo purpose, usage, and structure
- `STANDARDS.md` with philosophy, 9-rule catalog, meta rules, out of scope

**9 Rules (R1-R9)**
- `rules/R1-documentation-architecture.md` — `docs/{plan,analysis,tasklog,findings,reference}/` + PROJECT-JOURNAL.md
- `rules/R2-task-logging.md` — 5-section task log format
- `rules/R3-finding-archival.md` — 6-step finding archival process
- `rules/R4-decision-records.md` — Decision Record format (ADR-like)
- `rules/R5-git-workflow.md` — Atomic commits + imperative titles + commit-push pair + never-destroy
- `rules/R6-external-dependency-management.md` — Draft → submit → track external interactions
- `rules/R7-issue-classification.md` — Severity and Status vocabulary
- `rules/R8-human-ai-collaboration.md` — Trade-off analysis + escalation + Claude Code memory rules
- `rules/R9-provenance-reproducibility.md` — Version pinning + reproducible audit scripts

**Templates (language-neutral)**
- `templates/common/CLAUDE.md` — Project-level Claude Code activation point
- `templates/common/README.md` — Project README with progressive-disclosure structure
- `templates/common/.gitignore` — Language-neutral exclusions (venv, node_modules, .DS_Store, etc.)
- `templates/common/docs/README.md` — Documentation index
- `templates/common/docs/PROJECT-JOURNAL.md` — Single portal template
- `templates/common/docs/plan/.gitkeep`
- `templates/common/docs/analysis/.gitkeep`
- `templates/common/docs/tasklog/README.md` — Tasklog directory index
- `templates/common/docs/tasklog/TEMPLATE.md` — 5-section task log template
- `templates/common/docs/findings/README.md` — Findings directory index
- `templates/common/docs/findings/TEMPLATE.md` — Finding archive template
- `templates/common/docs/reference/.gitkeep`

**Claude Code memory rules**
- `memory/MEMORY.md` — Memory index template
- `memory/feedback_task_logging.md` — Rule R2 as memory file
- `memory/feedback_finding_archive.md` — Rule R3 as memory file
- `memory/feedback_portal_update.md` — Rule R1/R4 portal maintenance

**Scripts**
- `scripts/init-project.sh` — Automated new-project bootstrap

**Examples**
- `examples/first-ontology-project.md` — First real-world consumer (BIM ontology pipeline)

### Notes

- Initial release focuses on documentation and development process.
  Language-specific templates, CI/CD presets, and pre-commit hooks are
  intentionally deferred to later minor versions.
- All rules are language/domain/platform neutral.
- Severity MUST/SHOULD/MAY classification is established; no MAY rules
  in this release.
