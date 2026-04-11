# R1 — Documentation Architecture

**Strength**: 🔴 MUST
**Version**: 0.1.0

---

## Rule

Every project following `dev-standards` MUST organize its documentation
with the following directory structure and a single navigation portal.

### Required structure

```
<project-root>/
└── docs/
    ├── README.md                  # Documentation index
    ├── PROJECT-JOURNAL.md         # Single navigation portal
    ├── plan/                      # Forward-looking plans
    ├── analysis/                  # Design decisions + rationale
    ├── tasklog/                   # Retrospective task records
    │   └── README.md
    ├── findings/                  # Data/design issue archives
    │   └── README.md
    └── reference/                 # External / inherited documents
```

Each directory has a single clear purpose and SHOULD NOT hold documents
that belong elsewhere.

### Directory purposes

| Directory | Answers the question |
|-----------|----------------------|
| `docs/plan/` | "What do we plan to do?" |
| `docs/analysis/` | "Why did we decide this way?" |
| `docs/tasklog/` | "What did we actually do?" |
| `docs/findings/` | "What problems did we encounter?" |
| `docs/reference/` | "What external materials are we referencing?" |

### Single navigation portal — `PROJECT-JOURNAL.md`

`docs/PROJECT-JOURNAL.md` is the **single entry point** that answers the
question "what happened in this project and where can I find the details?".

Required sections:

1. **한눈에 보기 / At a Glance** — Current project state, open issues, next steps
2. **Quick Problem Index** — One-line rows linking to findings, limitations, decisions
3. **Timeline** — Chronological log of key events with commit hashes
4. **Findings (상세)** — Brief summary of each archived finding
5. **Decisions** — Major design choices with rationale
6. **External Dependencies** — Upstream repos, platforms, integrations
7. **Open Questions** — Unresolved items awaiting decision
8. **Where to find what** — Quick-reference pointer table

A reader should be able to open PROJECT-JOURNAL.md and, within 5 minutes,
answer any of:
- "What issues did this project face?"
- "Why was X decided?"
- "What external systems does this depend on?"
- "What still needs resolving?"
- "Where is the code/data for Y?"

## Rationale

### Why this specific layout

**Separation of concerns**:
- Plans (future) and tasklogs (past) are kept apart so neither becomes a graveyard of stale promises
- Analysis (why) is separated from tasklog (what) so decision rationale doesn't get buried in implementation details
- Findings (problems) get their own directory with dedicated archival process — they are first-class artifacts, not footnotes

**Reference vs owned content**:
- `reference/` holds documents *inherited* from external sources (specifications, data docs, 3rd-party guides)
- Other directories hold documents the project *owns* and maintains
- This prevents "reference document" from being mistaken for a project decision

### Why a single portal

Without a portal, users must know which directory to look in. With a portal,
they always start at PROJECT-JOURNAL.md and follow links outward.

This is especially important for:
- Future-you (6 months later)
- New collaborators (no context)
- AI assistants (needs a consistent entry point)

## Examples

### Good

```
docs/
├── PROJECT-JOURNAL.md            ✅ Single portal
├── plan/
│   └── implementation-plan.md    ✅ Forward plan
├── analysis/
│   ├── phase-1a-design.md        ✅ Why this design
│   └── api-versioning.md         ✅ Why this approach
├── tasklog/
│   ├── phase-1a-setup.md         ✅ Retrospective
│   └── phase-1b-ingest.md        ✅ Retrospective
├── findings/
│   └── 2026-04-12-M1-slug/       ✅ Dated issue folder
└── reference/
    └── DATA-SPEC.md              ✅ External inherited doc
```

### Bad

```
docs/
├── everything-about-the-project.md   ❌ Single file with mixed content
├── PLAN.md                            ❌ No directory, flat
├── issues.md                          ❌ Not archived, not dated
└── misc/                              ❌ Dumping ground
```

## Enforcement

### At project start

Run `scripts/init-project.sh` (from `dev-standards`) which creates the
directory skeleton and empty index files automatically.

### During development

- Every new plan → `docs/plan/`
- Every design decision → `docs/analysis/` AND `PROJECT-JOURNAL.md §4`
- Every completed task → `docs/tasklog/` (see R2)
- Every issue → `docs/findings/` (see R3)
- Every external reference → `docs/reference/`

### Check during code review

Before merging a PR that adds documentation, verify:
- [ ] New docs are in the correct directory
- [ ] If a new issue was discovered, it's archived per R3
- [ ] If a major decision was made, it's in PROJECT-JOURNAL.md §4
- [ ] PROJECT-JOURNAL.md is up to date

## Out of scope

- **File naming conventions within each directory** — Individual rules
  (R2, R3) define those. R1 only defines the directory layout.
- **docs in subdirectories of `src/`** — Code-adjacent READMEs are fine
  and don't violate R1.
- **External documentation systems** (Confluence, Notion, etc.) — R1 is
  about the git-tracked `docs/` directory. External systems are allowed
  but should be linked from `PROJECT-JOURNAL.md §8`.

## Related rules

- **R2 Task logging** — Governs `docs/tasklog/` content
- **R3 Finding archival** — Governs `docs/findings/` content
- **R4 Decision records** — Governs `docs/PROJECT-JOURNAL.md §4 Decisions`
- **R6 External dependency management** — Governs `docs/reference/` content

## References

- Example: `examples/first-ontology-project.md` — concrete application of R1
- Template: `templates/common/docs/` — copyable skeleton for new projects
