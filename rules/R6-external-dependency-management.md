# R6 — External Dependency Management

**Strength**: 🟡 SHOULD
**Version**: 0.1.0

---

## Rule

Projects SHOULD explicitly track external dependencies (upstream
repositories, platforms, APIs, shared datasets) and handle interactions
with them through a **draft → submit → track** process.

### 6.1 Registry — what counts as an external dependency

An external dependency is anything the project consumes but does not
own. This includes:

- Upstream source code repositories
- External data sources (files, APIs, databases owned by others)
- Deployment platforms (cloud providers, PaaS, BaaS)
- Third-party services (SaaS)
- Shared libraries or specifications

NOT external dependencies:
- Standard library of your language
- Well-established public libraries (they're "assumed")
- Internal project modules

### 6.2 Single registry — `PROJECT-JOURNAL.md §5`

All external dependencies MUST be listed in
`docs/PROJECT-JOURNAL.md §5 External Dependencies` with:

- **Name and role** — what it provides
- **URL or location** — where to find it
- **What data/functionality it provides** — enumerated
- **Dependency status** — stable / beta / needs attention
- **Known issues** — cross-linked to findings
- **Contact channel** — issue tracker, email, Slack, etc.

### 6.3 Inherited documents — `docs/reference/`

Documentation, specifications, or manuals that originate from an
external source and are **referenced but not owned** by the project
SHOULD be placed in `docs/reference/` (not edited except for
formatting).

This keeps the project's own analysis/decision documents separate
from inherited material.

### 6.4 External actions — draft → submit → track

When the project needs to take action on an external dependency
(file an issue, submit a PR, open a support ticket):

1. **Draft first** — write the full content as a markdown file inside
   the project, typically at `docs/findings/<finding-id>/<action>-draft.md`
2. **Review** — ensure the draft is complete and accurate before
   submitting externally
3. **Submit** — send the content to the external system (GitHub issue,
   PR, email, etc.)
4. **Record the submission** — update the draft with the external URL
   and submission date
5. **Track** — add a row to `PROJECT-JOURNAL.md §5` or link from the
   related finding so the status is monitored

### 6.5 Version pinning

When depending on a specific version/snapshot/branch of an external
resource:

- **Pin explicitly** — record the exact version in code/config
- **Document why this version** — in analysis or decision records
- **Plan for updates** — when does the pin need to be revisited?

See R9 Provenance for deeper reproducibility requirements.

## Rationale

### Why a single registry

Without R6, external dependencies are scattered:
- Some in READMEs
- Some in code comments
- Some only in the developer's head
- Some in emails or chat

When something breaks, nobody remembers where to look. A single
registry in PROJECT-JOURNAL.md §5 makes the dependency graph
explicit.

### Why draft before submit

Direct submission to external systems (GitHub, Jira, support) creates
**external state** that's hard to:
- Edit after submission
- Search for historical context
- Link from project documents
- Share with collaborators who don't have external access

Writing a draft in the project first means:
- The full content lives in your version-controlled docs
- Multiple reviewers can comment before submission
- Future-you can re-read the reasoning without logging into external systems
- If you need to submit the same content elsewhere, you have it

### Why `docs/reference/` is separate

Mixing inherited docs with project-owned docs causes:
- Confusion about who can edit what
- Risk of unintended changes to inherited material
- Difficulty answering "did we write this or did someone else?"

Keeping them separate answers the "ownership" question by directory.

### Why pin versions

External things change. Without version pins:
- "It worked yesterday" becomes a common complaint
- Bug reports can't be reproduced months later
- New collaborators get a different version than you

With pins:
- Behavior is frozen to the pinned version
- Upgrading is an explicit decision (with its own Decision Record)
- Reproducibility is possible

## Examples

### Good — external dependency registry

```markdown
## 5. External Dependencies

### Upstream data source: <data-tool>

**Role**: Generates raw data snapshots consumed by this project.

**Location**: https://github.com/<owner>/<tool>
**Version pinned**: snapshot 2026-04-07
**Current status**: 🟡 One known issue — [see Issue #2](https://github.com/<owner>/<tool>/issues/2)

**What we consume**:
- Raw CSV exports (schema A, B, C)
- Generated visualization files
- Manifest JSON for provenance

**Known issues**:
- M1 classification bug — see [finding](findings/2026-04-12-M1-slug/)
- Issue submitted upstream as [Issue #2](<url>)

**Contact**: GitHub Issues on <tool> repo
```

### Good — draft first

```
docs/findings/2026-04-12-M1-slug/
├── README.md                         # Finding
└── upstream-issue-draft.md           # Full draft of the external issue
```

After submission, `upstream-issue-draft.md` is updated with:

```markdown
> **Submitted**: 2026-04-12 as <URL>
> **Status**: 🔄 Awaiting response
```

### Bad

```
I sent an email to the vendor about the bug.
(Nothing in docs/)
```

No record of what was sent, no way to follow up, no link for
collaborators.

## Enforcement

### At project start

- Create `PROJECT-JOURNAL.md §5` with initial dependencies
- List each dependency with name, URL, version pin, role
- Note contact channels

### When a new dependency is introduced

- [ ] Added to `PROJECT-JOURNAL.md §5`?
- [ ] Version pinned where applicable?
- [ ] Inherited docs (if any) placed in `docs/reference/`?
- [ ] Contact channel recorded?

### When taking external action

- [ ] Draft written in the project docs first?
- [ ] Draft reviewed (by self if solo)?
- [ ] Submitted externally with URL recorded?
- [ ] Status tracked in journal?

## Out of scope

- **License tracking** — separate concern (use your language's tooling)
- **SBOM / supply chain security** — different scope (can be added later
  as a separate rule)
- **API contract testing** — goes under R9 Provenance if applicable

## Related rules

- **R1** defines `docs/reference/` directory
- **R3** Finding archival — external issues often emerge from findings
- **R9** Provenance — version pinning connects here

## References

- Example: `examples/first-ontology-project.md` (DXTnavis dependency)
