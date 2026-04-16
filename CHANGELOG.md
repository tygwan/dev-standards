# Changelog

All notable changes to `dev-standards` will be documented in this file.

Format: [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).
Versioning: [Semver](https://semver.org/) with pragmatic interpretation.

---

## [0.5.0] — 2026-04-17

### Added

- `rules/R12-technical-blog-writing.md` — Technical Blog Writing rule (🟢 MAY)
  - Second MAY rule in the catalog; applies to public blog writing, distinct from R11 (portfolio/resume)
  - Six post types, each with its own minimum structure, length guide, and voice convention:
    - **(1) 기술 고찰 / Deep-dive** — specific technology or decision analysis (1,500–3,000자)
    - **(2) 프로젝트 회고 / Retrospective** — honest lessons learned, including failures (2,000–4,000자)
    - **(3) 범프로젝트 인사이트 / Synthesis** — pattern drawn from ≥3 cases (1,500–3,000자)
    - **(4) 문제해결 노트 / Troubleshooting** — diagnostic timeline with named root cause (800–2,000자)
    - **(5) 비교·가이드 / Comparison** — steelmanned side-by-side with explicit selection criteria (1,000–2,500자)
    - **(6) 튜토리얼 / Tutorial** — reproducible step-by-step with verification at each step (1,500–5,000자)
  - Shared foundation inherited from R11: Task-over-Tech, Audience-matched terminology, Depth-as-authenticity, Writing style rules
  - Blog-unique principles: Hook first (3 sentences answering "why keep reading?"), prerequisite line, personal-voice allowance, type-specific visual asset minimums
  - Post metadata convention: type / reader_level / prerequisite / read_time / related_projects declared at top of post
  - Cross-linking with R11 portfolio: portfolio page compresses, blog post expands; recommended bidirectional links between the two depths
  - Per-type anti-patterns (deep-dive without rejected alternatives, retrospective without failures, synthesis with one example, troubleshooting that skips to the answer, comparison with straw-man option, tutorial not runnable as written)
  - Explicit evolution clause: write down deviations so the rule improves with each post
- `STANDARDS.md` updated: 11 Rules → 12 Rules; meta rule diagram extended to show R3 / R4 / R8 / R10 → R12 and R11 ↔ R12 cross-link; version bumped to v0.5.0

### Notes

- R12 is a sibling of R11, not a hierarchy: R11 documents **what you did** for external evaluation (portfolio, resume), R12 documents **how you think** for public consumption (blog). The same project can produce both, at different depths
- R12 inherits the entire R11 shared foundation unchanged; blog writing that violates R11 principles fails R12 even if type-specific structure is correct
- The six post types are a starting menu, not a closed set. When a writer finds a post that fits none of the six, R12's evolution clause encourages proposing a 7th type with a worked example

---

## [0.4.0] — 2026-04-14

### Added

- **R11 expanded to v0.2.0** — three additive sections based on real-world application in the reference portfolio
  - **Audience-matched terminology** (new Writing Style rule #3): use industry-standard names like Redis / PostgreSQL / Nginx / Next.js / p95 latency when a concept has a widely-adopted label; avoid abstracted descriptions and invented aliases for mainstream concepts. Complements (not replaces) the plain-vocabulary rule
  - **Depth as authenticity** (new principle in Output Adaptation): depth is how engineering authenticity is demonstrated — specific metrics, rejected alternatives, explicit trade-offs, named incidents, upstream traces. A compressed surface-level portfolio reads as template-filled; detail proves presence during the decision
  - **Structural Convention for Single-Source Authoring** (new optional section): three marker H1 headings (`# 문제해결` / `# 구현` / `# 크로스역량`) enable tooling to auto-render both portfolio (detailed) and resume (compressed) views from one page. Graceful parsing required (tolerant matching, fallback on missing markers, no rigid heading-level enforcement)
- `STANDARDS.md` updated: R11 catalog line extended to reference the new axes; version bumped to v0.4.0
- `CHANGELOG.md` entry clarifies that all three additions were discovered while applying R11 to the reference portfolio, validating the "rules evolve through use" design

### Notes

- R11 v0.1.0 → v0.2.0 is additive; all prior R11 content (PAAR, two-part narrative, visual asset checklist, enrichment sections, depth-level table) is retained unchanged
- The marker convention is explicitly optional: R11 compliance does not require it. Authors without auto-render tooling can continue with plain narrative structure and still satisfy R11

---

## [0.3.0] — 2026-04-14

### Added

- `rules/R11-portfolio-writing.md` — Portfolio / External Writing rule (🟢 MAY)
  - First MAY rule in the catalog; applies only when presenting a project to an external audience
  - PAAR structure (Problem, Analyze, Action, Result) as the organizing lens
  - Two-part narrative: Context and Value (Part 1) + Implementation (Part 2)
  - Task-over-tech content focus: the story must stand when the tech stack is removed
  - Visual Asset Checklist (9 types, tiered by commonality)
  - Role-based tech stack classification
  - Writing style rules: complete sentences, no arrow notation in prose, specific metrics
  - Enrichment sections for operational experience (incidents, optimization) and open source contributions
- `STANDARDS.md` updated: 10 Rules → 11 Rules, version bumped to v0.3.0
- Meta rule diagram updated to show R11 as downstream of R1/R4/R10 (internal docs feeding external writing)

---

## [0.2.0] — 2026-04-13

### Added

- `rules/R10-decision-validation.md` — Decision Validation / A/B Testing rule (🟡 SHOULD)
  - Measurable decisions should be validated via A/B experiments before permanent adoption
  - Notebook evidence preserved alongside decision records
- `STANDARDS.md` updated: 9 Rules Catalog → 10 Rules Catalog, version bumped to v0.2.0
- `examples/first-ontology-project.md` updated to reflect Phase 0–6 completion (336 tests, Foundry 10 datasets, 3 A/B tests conducted under R10)

---

## [0.1.0] — 2026-04-12

### Added — Initial release

**Philosophy and framework**
- `README.md` describing repo purpose, usage, and structure
- `STANDARDS.md` with philosophy, rule catalog, meta rules, out of scope

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
