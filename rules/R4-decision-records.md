# R4 — Decision Records

**Strength**: 🔴 MUST
**Version**: 0.1.0

---

## Rule

Every **structural decision** made during the project MUST be recorded
as a Decision Record in `docs/PROJECT-JOURNAL.md §4 Decisions` with a
stable ID and full rationale.

### What counts as a "structural decision"

A decision is structural if it:
- Changes the project architecture
- Commits to a specific external dependency
- Defines a convention that affects many files
- Trades off quality vs speed or similar axes
- Resolves an open question that had multiple valid answers

A decision is NOT structural if it:
- Is a routine implementation choice (pick the first reasonable library)
- Is fully determined by prior decisions
- Has no meaningful alternative

### Required format

Each decision lives in a table row in `PROJECT-JOURNAL.md §4` and,
if complex, has a dedicated subsection below the table.

**Table row** (in the section `## 4. Decisions`):

```markdown
| ID | Decision | When | Where documented |
|----|----------|------|------------------|
| D1 | One-line summary | Phase/date | Link to full record |
```

**Full record** (as a subsection below the table):

```markdown
### D<N> — <One-line title>

**Context**:
What situation or question prompted this decision. What was the state
before the decision was made.

**Decision**:
The specific choice that was made, in active voice.

**Rationale**:
Why this choice over the alternatives. What trade-offs were accepted.
What evidence or principles drove the decision.

**Alternatives considered**:
- Option A: ... (pros / cons)
- Option B: ... (pros / cons)
- Option C: ... (pros / cons, if applicable)

**Impact**:
Which parts of the project are affected. What downstream work is
enabled or constrained. What follow-up actions are needed.

**Related**:
- Links to findings that prompted this decision
- Links to analysis documents
- Links to future decisions that depend on this one
```

### Decision IDs

Decisions are numbered sequentially: **D1, D2, D3, ...**

- Never renumber or renumber: decisions are immutable references
- If a decision is reversed, create a NEW decision that supersedes it
  (e.g., "D17 — Revert D4 because ...")
- Do NOT delete old decisions

## Rationale

### Why separate decisions from task logs

Task logs (R2) answer "what happened". Decisions answer "why it happened
that way". These are different questions with different audiences:

- **Task logs**: read by developers implementing similar tasks
- **Decisions**: read by anyone asking "why this choice over the
  alternative?"

Mixing them loses the "why" when scrolling through implementation details.

### Why all decisions in PROJECT-JOURNAL.md §4

Centralizing decisions in the portal means:
- One location to scan all past commitments
- Easy to check for conflicts between decisions
- New collaborators can read the §4 table to understand the project's
  architectural shape in 10 minutes
- Related decisions can be linked inline

### Why include rejected alternatives

Without alternatives:
- Future-you doesn't know what was considered, only what was chosen
- "We didn't think of that" becomes indistinguishable from "we decided
  against that"
- Stakeholders can't challenge the decision without re-deriving the
  options

Writing down 2-3 alternatives (even briefly) forces explicit trade-off
thinking.

### Why immutable IDs

Decisions often reference each other ("D7 is a refinement of D4").
If D4 gets renumbered, those references break. Immutable IDs are the
simplest way to preserve the decision graph.

## Examples

### Good — a full decision record

```markdown
### D3 — Use XLSX as source of truth for classification

**Context**:
During Phase 1a design, we initially planned to write a classifier from
scratch in Python. While analyzing the raw data, we discovered that an
existing XLSX file had already applied classification rules defined by
the upstream extraction tool.

**Decision**:
Adopt the existing XLSX as the authoritative source for the `class` column.
Implement a Python port of the external classification logic purely as an
oracle test (100% agreement requirement), not as a runtime replacement.

**Rationale**:
- The upstream tool is trusted by the project owner
- Rebuilding the classifier duplicates work without added value
- An oracle test catches any drift between upstream and our local copy

**Alternatives considered**:
- Option A: Write a Python classifier from scratch with 2-signal consensus
  - Pro: Full control, can fix known bugs immediately
  - Con: ~2 days of work, ongoing sync with upstream
- Option B: Use the XLSX directly and defer classifier questions
  - Pro: Zero effort, matches upstream
  - Con: Cannot fix known bugs without breaking the oracle

**Impact**:
- Phase 1a loader: simplified (just read XLSX)
- Phase 1e: needed later when XLSX classifier bug was discovered (D7)
- Phase 2 ontology: will depend on classification_confidence filter

**Related**:
- Analysis: docs/analysis/phase-1a-design.md §7
- Later refinement: D7 (confidence layer workaround)
- Finding: docs/findings/2026-04-12-M1-slug/ (exposed the trade-off)
```

### Bad

```markdown
### D3 — Used XLSX

Decided to use the XLSX file. Seemed faster.
```

## Enforcement

### When to create a decision record

Create a Decision Record whenever:
- You pause to think "which of these approaches should I take?"
- A user or stakeholder asks "why not X?"
- You're committing to an external dependency
- You're introducing a project convention
- A finding's Resolution section had multiple options

### When NOT to create a decision record

- Routine implementation choices (use `List` vs `Array` in a language)
- Decisions fully determined by prior decisions
- "Obvious" choices with only one reasonable alternative

When in doubt, create one — decisions are cheap to write and expensive
to reconstruct later.

### In code review

For PRs that introduce structural changes:

- [ ] Is there a new decision record in `PROJECT-JOURNAL.md §4`?
- [ ] Does it have a stable ID (next in sequence)?
- [ ] Does it include at least 2 alternatives considered?
- [ ] Does it reference related findings/analysis/other decisions?

## Out of scope

- **Architecture Decision Record (ADR) tooling** — R4 uses a lightweight
  in-journal format. If a project outgrows this, ADR tooling can be added.
- **Decision review process** — R4 doesn't mandate review meetings or
  approval workflows. Projects can add those on top.

## Related rules

- **R1** defines PROJECT-JOURNAL.md structure
- **R3** Finding archival — findings often prompt decisions
- **R8** Human-AI collaboration — trade-off analysis pattern feeds into
  the "Alternatives considered" section

## References

- Template: `templates/common/docs/PROJECT-JOURNAL.md` §4 section scaffold
- Example: `examples/first-ontology-project.md` — D1-D9 decision series
