# R5 — Git Workflow

**Strength**: 🟡 SHOULD
**Version**: 0.1.0

---

## Rule

Projects following `dev-standards` SHOULD adopt the following git
workflow conventions for consistency and archaeological clarity.

### 5.1 Atomic commits

One **unit of work** = one **commit**. A unit of work is:
- A completed task (paired with a task log under R2)
- A completed finding archive (paired with `docs/findings/` entry under R3)
- A structural decision (paired with PROJECT-JOURNAL.md §4 update under R4)
- A discrete feature or bug fix

Do NOT mix multiple units of work in one commit. Do NOT split a unit
across multiple commits unless the unit is unusually large.

### 5.2 Commit message structure

```
<type>: <imperative short summary>       (<=72 chars)

<body: what was done and why, with verification evidence>
<body continues>

Co-Authored-By: <attribution if AI-assisted>
```

**Rules**:
- **Title**: imperative mood ("Add feature", not "Added feature"), under 72 chars
- **Body**: describe the change, the reason, and the verification (tests
  passing, counts, benchmarks)
- **Attribution**: if an AI assistant was used, include a `Co-Authored-By`
  line with the assistant's identifier
- **References**: link to issue IDs, finding IDs, decision IDs in the body

### 5.3 Commit and push as a pair

After creating a commit for a completed unit of work, **push immediately**.
Do NOT leave commits local-only for extended periods.

Exceptions:
- Work-in-progress commits on a feature branch that isn't ready
- Sensitive changes pending review

The default is: local commit → push within the same session.

### 5.4 Never destroy, always backup

When refactoring, reorganizing, or removing large amounts of content:

- **Move, don't delete** — use `git mv` for file reorganization
- **Back up, don't drop** — move legacy artifacts to a `backup/` or
  `archive/` directory before removing from primary location
- **Commit the backup separately** from the "new home" commit so reverts
  are straightforward
- Before destructive operations (e.g., `rm -rf large-dir/`), stop and
  consider whether something of value would be lost

The default mindset: "I can always undo this if I haven't destroyed it."

### 5.5 Branch strategy (lightweight)

R5 does not mandate a specific branching strategy. Projects can use:
- Trunk-based development (main only)
- GitHub Flow (feature branches + PR)
- Git Flow (develop + release branches)
- Whatever fits the team size and release cadence

What R5 DOES require: **whichever branch strategy you choose, document
it in `docs/PROJECT-JOURNAL.md`** so new collaborators know.

## Rationale

### Why atomic commits

- **Reviewable** — one commit, one concern, easy to understand
- **Revertable** — broken feature can be reverted without losing unrelated work
- **Searchable** — `git log --oneline` becomes a meaningful history
- **Bisectable** — `git bisect` actually works when each commit is coherent

Mixing unrelated changes in one commit destroys all of these properties.

### Why imperative commit titles

Imperative titles ("Add X") read as instructions the commit performs.
This matches the convention used by major projects (Linux kernel, Git
itself, most OSS) and makes changelogs readable.

Past tense ("Added X") reads as a report about what happened, which is
redundant with the commit's existence.

### Why verification in the body

A commit message that just says "Fix bug" leaves you wondering:
- Was it tested?
- How do we know it's fixed?
- Any regressions checked?

A commit message that says "Fix parser to handle leading-dot decimals
(44/44 tests passing, 1,698/1,698 coverage on full dataset)" is
immediately trustable.

### Why commit + push pair

Local-only commits are invisible to:
- Collaborators
- CI/CD systems
- Your future self on another machine
- AI assistants that inspect repo state

They're also at risk of being lost if the local machine dies or the
working tree is reset. Push after each meaningful commit makes the
work durable.

### Why never-destroy

Git can recover a lot, but:
- Deleted files in early commits can be painful to recover
- Deleted branches without reflog are effectively gone
- Force-pushed history rewrites are irreversible from the remote side

The never-destroy mindset doesn't forbid deletions — it requires them
to be **explicit and reversible**. Moving to `backup/` is the standard
way to achieve this.

## Examples

### Good

```
Phase 1e: classification_confidence layer (M1 local fix)

Add two new columns to the Gold bim_objects_enriched table to mitigate
the M1 finding without breaking the XLSX oracle contract:

  classification_confidence          TEXT  HIGH / LOW / LIKELY_BUG
  classification_confidence_reason   TEXT  from 9-value vocabulary

Piping 4,014 splits as:
  HIGH       2,926 — has pipeline + (commodity/short/spec/npd)
  LOW           91 — pipeline XOR metadata
  LIKELY_BUG   997 — neither signal (misclassified by substring bug)

Tests: 192 -> 210 passing (+18 in test_clean.py).

Co-Authored-By: AI-Assistant <noreply@example.com>
```

This commit:
- Has an imperative title under 72 chars
- Explains what AND why
- Includes concrete verification (row counts, test counts)
- References the related finding (M1)
- Attributes AI assistance

### Bad

```
WIP fix
```

or

```
Added new columns and fixed some tests and reorganized a bit
```

or

```
x
```

## Enforcement

### For each commit

- [ ] Is this a single unit of work?
- [ ] Does the title use imperative mood?
- [ ] Is the title under 72 characters?
- [ ] Does the body explain what and why?
- [ ] Does the body include verification evidence?
- [ ] Is AI assistance attributed if applicable?
- [ ] Is the commit pushed within the session?

### For destructive operations

- [ ] Could this be a move instead of a delete?
- [ ] Is the "to-be-removed" content backed up?
- [ ] Is the backup in a separate commit from the removal?
- [ ] Does the commit message explain what was removed and why?

## Out of scope

- **Specific branch naming conventions** — Projects choose their own
  (feature/, fix/, epic/, etc.)
- **Pull request review process** — Orthogonal to R5
- **Signing commits / GPG / SSH** — Security practice, not workflow
- **Merge vs rebase strategy** — Project preference

## Related rules

- **R2** Task logging — task log lives in the same commit as the work
- **R3** Finding archival — finding archive is one atomic commit
- **R4** Decision records — decisions committed with the portal update

## References

- Template: `templates/common/README.md` may include project-specific
  commit conventions beyond this baseline
- Example: `examples/first-ontology-project.md` — actual commit history
