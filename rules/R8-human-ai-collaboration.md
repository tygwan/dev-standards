# R8 — Human-AI Collaboration

**Strength**: 🟡 SHOULD
**Version**: 0.1.0

---

## Rule

Projects using AI assistants (e.g., Claude Code) as a development
collaborator SHOULD follow explicit patterns for how humans and AI
interact, to keep the collaboration auditable and productive.

### 8.1 Explicit trade-off analysis

When multiple approaches exist for a structural decision, the AI
assistant SHOULD present:

1. **At least 2 options** (more is fine)
2. **Pros and cons** for each
3. **A recommendation** with reasoning
4. **An explicit human-decision invitation** before implementing

The human then either accepts the recommendation or chooses a
different option. This becomes the basis for a Decision Record (R4).

**Anti-pattern**: AI silently picks one approach and implements it,
skipping the human's chance to weigh in.

### 8.2 Human checkpoint escalation

The AI MUST pause and escalate to the human for explicit approval
on structural decisions. Structural decisions include:

- Changing project architecture or directory layout
- Committing to an external dependency
- Introducing a new top-level convention
- Making data-destructive changes
- Resolving open questions with multiple valid answers

Routine implementation choices (using a standard library, naming a
local variable, choosing a common pattern) do NOT require escalation.

**Rule of thumb**: if the human reviewing a commit would say "wait,
why did you choose this?", the decision should have been escalated.

### 8.3 Memory rules as the long-term contract

When using Claude Code or similar AI systems with persistent memory,
projects SHOULD maintain memory rule files that encode the agreed
patterns. These rule files:

- Live in `~/.claude/projects/<project-slug>/memory/` (for Claude Code)
- Follow the `feedback_*.md` naming convention for behavioral rules
- Are indexed in `memory/MEMORY.md`
- Have frontmatter: `name`, `description`, `type` (user / feedback / project / reference)

Memory rules express durable behavior expectations, not one-off
instructions. They should survive across sessions.

### 8.4 Attribution in artifacts

When an AI assistant contributes to an artifact (code, documentation,
decision), attribution SHOULD be included:

- Commit messages: `Co-Authored-By: <AI-name> <email>`
- Decision records: note which parts were AI-generated vs human-authored
- Findings: audit script comments indicating AI involvement (if helpful
  for reproducibility)

Attribution is NOT blame — it's a signal for future reviewers about
where to double-check.

### 8.5 Session boundaries and context

AI assistants typically work in bounded sessions. Projects should:

- Keep critical context in `CLAUDE.md` (or equivalent) so AI can
  bootstrap quickly on session start
- Reference memory rules by file, not by retelling them inline
- Update `PROJECT-JOURNAL.md` so mid-project state is discoverable
  without re-reading the entire git history

## Rationale

### Why explicit trade-off analysis

Without R8.1:
- AI picks whatever seems best; human never sees the alternatives
- Decisions feel arbitrary because no alternatives are recorded
- Future reviewers can't tell "was this considered?"

With R8.1:
- Every structural decision has recorded alternatives
- Decision Records (R4) can cite the trade-off analysis directly
- The human's role as decision-maker is preserved

### Why human checkpoint escalation

AI assistants can move fast, but "fast" without escalation leads to:
- Surprising structural changes no one asked for
- Decisions the human would have rejected if asked
- Difficulty reverting because the work has snowballed

Escalation keeps humans in the loop for things that actually matter
and lets AI work autonomously on things that don't.

### Why memory rules

Without memory rules:
- Same instructions have to be repeated every session
- AI behavior is inconsistent across sessions
- Behavioral contracts are invisible / undocumented

With memory rules:
- Rules persist automatically
- New sessions pick up the rules at start
- Rules themselves are version-controlled (in dev-standards or project repo)

### Why attribution

Attribution serves multiple purposes:
- **Transparency** — readers know AI was involved
- **Review focus** — reviewers know where to apply extra scrutiny
- **Learning** — teams can audit which AI-authored sections succeeded or failed

## Examples

### Good — trade-off analysis with escalation

```
AI: I've found 4 options for handling this issue:

Option 1 — Accept and defer to Phase 2
  Pro: zero effort now
  Con: kicks the problem downstream

Option 2 — Local confidence column (Phase 1e)
  Pro: explicit, testable, non-destructive
  Con: 0.5 day of work

Option 3 — Override the external classifier in our Python port
  Pro: most accurate results
  Con: breaks the oracle contract

Option 4 — Fix at the external source
  Pro: benefits all consumers
  Con: requires coordinated upstream work

My recommendation: Option 2 for immediate local fix + Option 4 for
long-term source fix. Option 2 is cheap and non-destructive, Option 4
is the right long-term answer.

Proceed with Option 2 + 4 in parallel?
```

Human then decides. The decision is recorded as an R4 Decision Record
with the alternatives intact.

### Bad

```
AI: I'll just pick Option 2 and start implementing.
```

No alternatives shown, no human decision captured.

### Good — memory rule

`memory/feedback_task_logging.md`:

```markdown
---
name: Task logging rule
description: Every completed task requires a 5-section log
type: feedback
---

At task completion, write docs/tasklog/<task-id>.md with sections
1-5 (language/content, problem, analysis, solution, result).

Why: future readers need to reconstruct the task's reasoning.

How to apply: at the moment you mark the task completed, and in the
same commit as the code changes.
```

## Enforcement

### For each session

- [ ] AI has loaded memory rules at session start?
- [ ] `CLAUDE.md` or equivalent references the current standards version?
- [ ] `PROJECT-JOURNAL.md` is up to date?

### For each structural decision

- [ ] Trade-off analysis presented with >=2 options?
- [ ] Human explicitly approved before implementation?
- [ ] Decision recorded per R4?

### For each commit with AI contribution

- [ ] `Co-Authored-By:` line included in commit message?
- [ ] Material AI-authored sections noted where helpful?

## Out of scope

- **Specific AI system choice** — R8 works with Claude Code, but the
  principles apply to any AI assistant with session/memory semantics.
- **AI capability limits** — R8 doesn't assume specific model capabilities.
- **Privacy / data handling** — Orthogonal concern. Use your
  organization's policy.

## Related rules

- **R2** Task logging — captures what the AI and human did together
- **R3** Finding archival — AI helps generate audit scripts and figures
- **R4** Decision records — receives the trade-off analyses

## References

- Example: `examples/first-ontology-project.md` — demonstrates R8
  throughout Phase 1 (trade-off analyses, escalations, Decision Records)
- Memory rules: `memory/feedback_*.md` — concrete examples
