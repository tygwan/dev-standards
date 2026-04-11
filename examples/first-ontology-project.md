# Example: first-ontology-project

> Real-world application of `dev-standards` v0.1.0. This document shows
> how each of the 9 rules was applied in a concrete project, without
> duplicating the project's domain-specific details.

**Repository**: https://github.com/tygwan/first-ontology-project
**Standards version used**: 0.1.0
**First consumer**: Yes — this project's practices *became* dev-standards

---

## Why this example exists

`dev-standards` rules are intentionally abstract (language-neutral,
domain-neutral). This example grounds each rule in a real project
so future users can see what a rule looks like "in the wild".

The underlying domain (BIM / ontology pipelines / data transforms)
is **not relevant** for understanding the rules. The *patterns* are
what matters.

## Project one-liner

A data transformation pipeline that ingests versioned snapshots from
an upstream tool, produces cleaned and enriched outputs, and prepares
the data for ingestion into a target platform.

- **~12,000 primary entities**, ~110,000 relations
- **7-phase implementation plan** (Bootstrap → Ingest → Ontology → Quality → Analytics → LLM Service → API/UI)
- **Multiple output formats** for different downstream consumers
- **Oracle test against upstream tool** to ensure reproducibility

---

## R1 — Documentation architecture

The project uses the canonical `docs/` layout:

```
docs/
├── PROJECT-JOURNAL.md        ← Single portal with 8 sections
├── README.md                 ← Documentation index
├── plan/
│   └── implementation-plan.md
├── analysis/
│   ├── phase-1a-design.md    ← Why we decided each class boundary
│   ├── upstream-logic.md     ← Analysis of external tool's logic
│   └── verification-guide.md
├── tasklog/
│   ├── phase-0-bootstrap.md
│   ├── phase-1a-*.md
│   └── phase-1e-*.md
├── findings/
│   ├── README.md
│   ├── TEMPLATE.md
│   └── 2026-04-12-M1-*/      ← Dated issue folders
└── reference/
    ├── DATA-SPEC.md
    └── upstream-baselines.md
```

**Observation**: Each directory has a clear, non-overlapping purpose.
Developers never wonder "where does this go?".

## R2 — Task logging

Every phase produced a task log with the 5-section format. Examples
(file names only, per R2):

- `phase-0-bootstrap.md` — initial environment setup
- `phase-1a-ingest.md` — data loading and normalization
- `phase-1b-unit-parser.md` — parser implementation
- `phase-1c-sqlite-writer.md` — storage layer
- `phase-1d-exports.md` — downstream exports
- `phase-1e-confidence-layer.md` — quality confidence columns (added after finding)

**Pattern used**: Sections 1-5 correspond to language/content, problem,
analysis, solution, result. Every log has concrete test counts, commit
hashes, and next-step notes.

## R3 — Finding archival

The first finding uncovered an upstream tool bug that misclassified
~25% of one category. It was archived following R3's 6-step process:

```
docs/findings/2026-04-12-M1-<slug>/
├── README.md                # 5-section finding report
├── audit.py                 # Reproducible diagnosis
├── make_figures.py          # Visualization generator
├── data/
│   ├── confidence_breakdown.csv
│   ├── root_cause_attribution.csv
│   ├── affected_sample.csv
│   ├── keyword_hit_debug.csv
│   └── sanity_check.csv
├── figures/
│   ├── 01_confidence_distribution.png
│   ├── 02_substring_bug_causes.png
│   ├── 03_affected_patterns.png
│   └── 04_class_distribution.png
└── upstream-pr-draft.md     # Draft of the external PR (R6)
```

**Observation**: The audit script lets anyone re-derive the numbers
months later. The figures make the severity immediately obvious.
The upstream PR draft (R6) was prepared before submission.

## R4 — Decision records

9 Decision Records (D1-D9) were accumulated in `PROJECT-JOURNAL.md §4`
during Phase 1. Examples (generalized):

- **D1**: Adopt medallion-style layered data architecture (Bronze/Silver/Gold)
- **D2**: Use upstream XLSX as source of truth for classification
- **D3**: Parallel output for two target platforms (keep options open)
- **D7**: Add local confidence layer as workaround for D2's side effects
- **D9**: Establish finding archive rule (this document's R3)

Each D-record includes: Context / Decision / Rationale / Alternatives
considered / Impact / Related.

**Observation**: D2 and D7 are linked — D7 exists because D2 surfaced
a trade-off that was later found problematic. The decision graph makes
this evolution visible.

## R5 — Git workflow

All commits follow the imperative title + verification body format:

```
Phase 1e: classification confidence layer (M1 local fix)

Add two new columns to the Gold table to mitigate the M1 finding
without breaking the XLSX oracle contract...

Tests: 192 -> 210 passing (+18 in test_clean.py).

Co-Authored-By: AI-Assistant <noreply@example.com>
```

**Never-destroy pattern**: During Phase 1a folder reorganization,
1.7 GB of legacy artifacts from a prior backend were moved to
`data/backup/<old-backend>/` rather than deleted. This made the
migration fully reversible.

**Commit + push pair**: Every Phase completion ends with both
commit and push in the same session. No local-only commits.

## R6 — External dependency management

The project depends on an upstream data extraction tool. R6 applied as:

- **Registry**: `PROJECT-JOURNAL.md §5 External Dependencies` lists
  the upstream repo, current version pin, status, and contact channel
- **Version pinning**: `SNAPSHOT = "2026-04-07"` in config + version
  documented in journal §5
- **Inherited docs**: `docs/reference/` holds the upstream tool's
  data specification document (not edited, only referenced)
- **External action draft → submit**: The M1 finding produced a PR
  draft at `docs/findings/.../upstream-pr-draft.md` *before* submission
  to the upstream repo, then was submitted as an external Issue and
  tracked in the journal

## R7 — Issue classification

Severity vocabulary used consistently across findings and the portal:

- M1 (XLSX classification bug) → 🟠 MAJOR
- K1-K4 (various known limitations) → 🟡 MINOR / 🔭 Accepted

Status vocabulary evolution observed in the M1 finding:

```
🔄 Open
  ↓ (audit + analysis)
🛠 Fixing
  ↓ (Phase 1e implements local mitigation)
✅ Resolved locally (upstream fix tracked via Issue #2)
```

The compound status captures the fact that there are two resolution
dimensions (local and upstream) and the project has resolved one.

## R8 — Human-AI collaboration

The project was developed using Claude Code (AI assistant) in multiple
sessions. Patterns observed:

### Explicit trade-off analysis

Major decisions always presented 3-5 options with pros/cons before
asking for approval. Example from the M1 finding Resolution section:

```
Option 1: Accept and defer to Phase 2
Option 2: Phase 1e confidence column      ← recommended
Option 3: Override classifier in Python
Option 4: DXTnavis source fix
```

The human then chose Option 2 + Option 4 parallel, and the decision
was recorded as a Decision Record.

### Escalation

AI paused for human approval before:
- Reorganizing the directory layout (Phase 1a reorg)
- Creating the dev-standards repo structure
- Submitting external issues to upstream
- Changing data destructively (moves only with explicit approval)

### Memory rules

Claude Code memory in `~/.claude/projects/.../memory/`:
- `feedback_task_logging.md` — R2 as a memory rule
- `feedback_finding_archive.md` — R3 as a memory rule
- `feedback_portal_update.md` — R1/R4 portal maintenance rule

These files ensured consistent behavior across multiple sessions.

### Attribution

Every commit includes `Co-Authored-By: <AI> <...>` so future reviewers
know where to apply extra scrutiny.

## R9 — Provenance and reproducibility

- **Version pinning**: `SNAPSHOT = "2026-04-07"` in config; upstream tool
  version identified in journal §5
- **Lineage columns**: Gold output tables include `processed_at_utc`,
  `rule_version`, `original_class`, `refined_class` so every row carries
  its provenance
- **Audit scripts**: The M1 finding's `audit.py` re-derives all reported
  numbers (2,926 HIGH / 91 LOW / 997 LIKELY_BUG) from raw sources
- **Deterministic**: Audit runs are reproducible; no randomness, no
  external state

## Cross-cutting observations

### What worked

1. **Single portal** (PROJECT-JOURNAL.md) — made session handoffs
   trivial. Every session started by reading the portal.
2. **Finding archive 6-step** — transformed "we had a bug" from
   institutional memory into a queryable artifact.
3. **Trade-off tables** — forced explicit reasoning, producing
   Decision Records automatically.
4. **Memory rules** — kept the AI assistant's behavior consistent
   across multi-day work.
5. **Never-destroy** — the legacy backup saved the day when checking
   historical values during the M1 audit.

### What was hard

1. **Keeping PROJECT-JOURNAL.md up to date** — it's tempting to defer
   updates. The portal-update memory rule helped enforce this.
2. **Deciding what counts as a "finding" vs "task log"** — initial
   confusion. Clarified: findings are *problems*; tasklogs are *work*.
3. **Language in analysis docs** — mixing Korean and English was
   fine for solo work but would complicate team collaboration.

### What was avoided

- Dumping all docs into a single README
- Using issue labels in external systems as the source of truth
- Informal "I'll remember this" approach to decisions
- Relying on IDE/terminal history for reproducibility

## Takeaway for new projects

If you're starting a new project and want to follow dev-standards,
this example shows that:

- The full process applies even for a solo project with AI assistance
- The overhead is small after the first few phases (mostly templates)
- The value compounds over time (especially at Phase N when
  Phase 1 details are forgotten)

---

## See also

- **Actual repo**: https://github.com/tygwan/first-ontology-project
- **Notable files in that repo**:
  - `docs/PROJECT-JOURNAL.md` — the single portal
  - `docs/findings/2026-04-12-M1-piping-misclassification/` — R3 in action
  - `docs/analysis/phase-1a-data-realignment-design.md` — R4 alternatives example
  - `docs/tasklog/phase-1e-confidence-layer.md` — R2 example
