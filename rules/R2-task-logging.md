# R2 — Task Logging

**Strength**: 🔴 MUST
**Version**: 0.1.0

---

## Rule

Every completed unit of work (phase, milestone, significant task) MUST
be recorded in `docs/tasklog/<phase-or-task-id>.md` using the **5-section
format**.

### The 5 sections (required)

1. **언어 / 내용 (Language / Content)**
   What language(s) and files were created or modified, and for what purpose.

2. **문제 (Problem)**
   What problem(s) occurred during the task. If none, explicitly write "없음 / None".

3. **분석 (Analysis)**
   Root cause of the problem, or reasoning behind the approach.

4. **해결방안 (Solution)**
   The specific resolution applied, with code changes or configuration decisions.

5. **결과 (Result)**
   Verification outcome: tests passing, counts verified, output artifacts,
   commit hash.

### Required header

Each task log starts with a header block:

```markdown
# <Phase or Task Name>

**일자**: YYYY-MM-DD
**담당 Task**: #<task-id if tracked>
**커밋**: <commit hash once committed>

---
```

### Writing time

The task log MUST be written:
- **At task completion time**, not retroactively weeks later
- **Before marking the task as complete** in any tracking system
- **As part of the same commit** as the final code changes for that task

## Rationale

### Why the 5-section format

Each section answers a specific question a future reader will ask:

| Section | Question | Why it matters |
|---------|----------|----------------|
| 언어/내용 | What was done? | File-level scope for reviewers |
| 문제 | Did anything go wrong? | Honest record of obstacles |
| 분석 | Why did it go wrong? | Root cause, not just symptoms |
| 해결방안 | How was it fixed? | Reproducible path for next time |
| 결과 | How do we know it worked? | Evidence, not just claims |

Without this structure, task logs degenerate into "I did X" one-liners
that lose all diagnostic value.

### Why "문제" must not be omitted

If every task log says "no problems", the log becomes useless — there is
no pattern to learn from. Explicitly writing "없음" forces you to stop
and verify, rather than gloss over minor issues.

### Why write at completion time

- Memory is freshest (details that feel obvious will be forgotten in a week)
- Prevents "task complete" being declared without verification
- Couples the task log to the same commit as the code, so git blame works

## Examples

### Good — Phase completion log

```markdown
# Phase 1b — Unit Parser

**일자**: 2026-04-10
**담당 Task**: #3
**커밋**: 8bd8b43

---

## 1. 언어 / 내용

| 언어 | 파일 | 목적 |
|------|------|------|
| Python | src/proj/parser.py | 4-unit parser (length, weight, pressure, temperature) |
| Python | tests/test_parser.py | 44 unit tests + 5 integration tests |

## 2. 문제

Length 1,690 / 1,698 parsed (99.5% coverage). 8 failures on strings like
"24 ft   .43 in" (leading-dot decimals).

## 3. 분석

The initial regex `\d+(?:\.\d+)?` does not match leading-dot decimals
like `.43`. The source system uses this format when integer part is zero.

## 4. 해결방안

Introduced shared NUM regex constant:
    _NUM = r"-?(?:\d+(?:\.\d+)?|\.\d+)"

Applied uniformly to all unit parsers. Added 3 regression tests for
leading-dot edge cases.

## 5. 결과

- pytest: 44/44 passing (0.07s)
- Full-dataset coverage: 1,698/1,698 (100%) after fix
- Committed 8bd8b43
```

### Bad

```markdown
# Phase 1b

Added the parser. Tests pass.
```

This tells you nothing: no file paths, no problems acknowledged, no
verification, no evidence. Useless for future debugging.

## Enforcement

### During development

- Before declaring a task complete, open `docs/tasklog/<task-id>.md` and
  write the 5 sections
- Verify each section has content (not "TODO")
- Include `결과` with specific numbers (test counts, metrics, commit hash)

### At commit time

- The task log file MUST be part of the same commit as the task's code
- The task log commit message may reference the task log file in its body

### In code review

- Reviewers check that the task log exists, has all 5 sections, and the
  `결과` section contains verifiable evidence

## Out of scope

- **Bug fixes in the normal code flow** — Small bug fixes caught by tests
  don't need a full task log. Fix + commit is enough.
- **Exploration / scratch work** — Research or spikes that don't produce
  shipped code don't need a task log (but findings from research DO go in
  `docs/findings/` via R3 if they reveal issues).
- **Documentation-only changes** — Typo fixes, clarifications don't need
  task logs.

## Related rules

- **R1** defines `docs/tasklog/` as the required directory
- **R3** Finding archival — when a task uncovers an issue, the issue gets
  its own finding folder IN ADDITION to the task log
- **R5** Git workflow — task logs are committed atomically with the work

## References

- Template: `templates/common/docs/tasklog/TEMPLATE.md`
- Memory rule: `memory/feedback_task_logging.md` (for Claude Code)
- Example: `examples/first-ontology-project.md` — multiple task logs visible
