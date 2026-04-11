# R7 — Issue Classification

**Strength**: 🟡 SHOULD
**Version**: 0.1.0

---

## Rule

Every issue (finding, open question, decision pending) SHOULD be
classified using the shared **Severity** and **Status** vocabularies.

### 7.1 Severity levels

| Symbol | Name | Definition |
|:-:|------|------------|
| 🔴 | **CRITICAL** | Downstream phases cannot proceed OR produces completely wrong results. Must be resolved before continuing. |
| 🟠 | **MAJOR** | Downstream results are partially wrong but functional. Strong recommendation to fix. Project can continue with awareness. |
| 🟡 | **MINOR** | Display/UX issue, rare edge case, known limitation. Can be deferred indefinitely without harm. |

### 7.2 Status values

| Symbol | Name | Definition |
|:-:|------|------------|
| 🔄 | **Open** | Under investigation or awaiting decision. |
| 🛠 | **Fixing** | Resolution in progress. |
| ✅ | **Resolved** | Fully resolved. Must include `Resolution commit` hash in the finding. |
| 📋 | **Deferred** | Intentionally postponed to a later phase. Must include reason. |
| 🔭 | **Accepted** | Accepted as limitation due to upstream constraints. Must include rationale. |

### 7.3 Partial resolution

If an issue is resolved in one dimension (e.g., locally) but not
another (e.g., upstream), use a **compound status**:

```
✅ Resolved locally — <external tracker link for source fix>
```

The finding's Resolution section should clearly distinguish between
the local fix and the remaining external work.

### 7.4 Required usage

Severity and Status MUST be used in:
- `docs/findings/*/README.md` — header block
- `docs/PROJECT-JOURNAL.md §1 Quick Problem Index` — table columns
- `docs/PROJECT-JOURNAL.md §3 Findings (상세)` — per-finding subsection header

SHOULD also be used in:
- External issue titles or labels when possible (e.g., GitHub labels)
- Commit messages when relevant

## Rationale

### Why shared vocabulary

Without shared vocabulary:
- "Important" means different things to different readers
- Triage becomes subjective per-person
- Historical archives lose comparability

With R7:
- New collaborators understand severity at a glance
- Filtering and prioritization become mechanical
- Portal scanning works: "show me all 🔴 Open issues"

### Why 3 severity levels (not more)

More levels (Catastrophic / Critical / High / Medium / Low / Trivial)
introduce diminishing returns. The boundaries become debatable,
slowing triage.

Three levels with clear criteria (blocks vs. partial vs. cosmetic) are
enough for most projects and minimize debate.

### Why 5 status values

- 🔄 Open — default for new issues
- 🛠 Fixing — distinguishes "we're working on it" from "we'll get to it"
- ✅ Resolved — evidence-backed closure
- 📋 Deferred — explicit conscious delay
- 🔭 Accepted — explicit "we can't/won't fix this"

Each status has a distinct meaning and forces clarity about what
"closed" means.

### Why partial resolution compound status

Many real issues have local mitigations and pending upstream fixes.
Forcing a single choice loses information:
- If we mark "Resolved", readers think the upstream is fixed too
- If we mark "Open", readers think nothing has been done

Compound status captures both.

## Examples

### Good

**In a finding header**:

```markdown
# 2026-04-12 — M1 — Classification bug in upstream data

**Severity**: 🟠 MAJOR
**Status**: ✅ Resolved locally (upstream fix tracked at <link>)
```

**In PROJECT-JOURNAL.md §1**:

```markdown
| ID | Date | Severity | Title | Status |
|----|------|:-:|-------|--------|
| M1 | 2026-04-12 | 🟠 MAJOR | Upstream classifier substring bug | ✅ Resolved locally |
| M2 | 2026-04-15 | 🟡 MINOR | Typo in analysis note | 🔭 Accepted |
| M3 | 2026-04-20 | 🔴 CRITICAL | Missing primary keys in raw data | 🛠 Fixing |
```

### Bad

```markdown
| ID | Title | Status |
|----|-------|--------|
| 1 | Bug | Fixed |
| 2 | Issue | Done |
| 3 | Problem | OK |
```

"Fixed" / "Done" / "OK" without severity or evidence is meaningless
for triage.

## Enforcement

### When creating a finding

- [ ] Severity assigned at creation time?
- [ ] Status is 🔄 Open if newly discovered?
- [ ] Title is descriptive enough to scan in the portal?

### When resolving a finding

- [ ] Status updated to ✅ / 📋 / 🔭?
- [ ] `Resolution commit` hash recorded in finding §4.4?
- [ ] PROJECT-JOURNAL.md §1 and §3 updated?
- [ ] Reason documented if Deferred or Accepted?

### Periodic triage

Once per major phase, scan `PROJECT-JOURNAL.md §1`:
- Any 🔴 Open → fix before continuing
- Any 🟠 Open → decide resolution approach
- Any 🟡 Open → confirm still minor, update or defer

## Out of scope

- **Priority** — severity is not priority. A 🟡 MINOR issue might still
  be high priority if it blocks a stakeholder demo. R7 doesn't define
  priority; projects can layer their own.
- **Ownership / assignment** — R7 doesn't mandate assignment workflows
- **SLAs** — response-time commitments are project-specific

## Related rules

- **R3** Finding archival — severity/status live in finding headers
- **R4** Decision records — often referenced from findings
- **R6** External dependencies — external issues use the same vocabulary

## References

- Example: `examples/first-ontology-project.md` (multiple findings with
  various severity/status combinations)
