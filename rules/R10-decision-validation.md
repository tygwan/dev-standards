# R10 — Decision Validation (A/B Testing)

**Strength**: 🟡 SHOULD
**Version**: 0.1.0

---

## Rule

When a structural decision (R4) is **measurable** — meaning both options
can be implemented and compared against concrete metrics — the decision
SHOULD be validated by implementing at least two alternatives and
measuring outcomes before committing.

This is **not** web A/B testing (random user assignment). It is
**engineering decision validation**: run both approaches on the same data,
measure with the same metrics, choose based on evidence.

### When to apply

A decision qualifies for A/B validation if ALL three conditions are met:

1. **Reversibility cost is high** — changing later requires significant rework
2. **Metrics exist** — you can define numeric indicators that distinguish "better"
3. **Implementation cost is low** — building both prototypes takes less time
   than the rework cost of choosing wrong

If a decision is cheap to reverse, or no meaningful metric exists, skip
A/B and decide by reasoning (R4 is sufficient).

### When NOT to apply

- Pure architecture choices where no metric distinguishes options
  (e.g., "monorepo vs polyrepo")
- Decisions fully determined by external constraints
  (e.g., "use PostgreSQL because the platform requires it")
- Trivial choices with negligible impact

---

## Process

### Step 1 — Frame the comparison

Before coding, write in a notebook or document:

```markdown
## A/B Test: <decision title>

**Question**: <what are we trying to decide?>
**Option A**: <first approach>
**Option B**: <second approach>
**Metrics** (lower/higher is better):
  1. <metric_1> — <why this matters>
  2. <metric_2> — <why this matters>
  3. <metric_3> — <why this matters>
**Input data**: <what dataset/graph/model both options run on>
```

### Step 2 — Implement both

Run both options on the same input. Store results side by side.
Do NOT optimize one more than the other — equal effort.

### Step 3 — Measure and visualize

For each metric, produce a numeric comparison and a visualization.
Save as PNG per project visualization rules.

```
| Metric | Option A | Option B | Winner |
|--------|----------|----------|--------|
| metric_1 | 44.4% | 14.1% | B |
| metric_2 | 1.50 | 0.79 | B |
| metric_3 | low | high | A |
```

### Step 4 — Decide and record

Record the decision using R4 format, with the addition of:

```markdown
### D<N> — <title>

**Validation**: A/B tested in `<notebook or script path>`
**Metrics**: <metric summary — who won and by how much>
**Adopted**: Option <X> (<N>/<M> metrics won)
```

If the result is ambiguous (tie or context-dependent), document WHY
you chose one over the other despite the tie.

### Step 5 — Archive the evidence

The notebook or script that ran the A/B test is the evidence.
It MUST be committed and linked from the decision record.

---

## Examples from practice

### Example 1: Zone definition strategy

```
Question: Grid 15m vs Louvain community for construction zones
Metrics: cross-zone edges, size CV, intra-zone distance, pipeline dispersion
Result: Louvain 3/4 wins → adopted
Evidence: notebooks/02_construction_management.ipynb
```

### Example 2: Adjacency tier filtering

```
Question: All vs Strong vs Strong+Medium for precedence DAG
Metrics: DAG edges, critical chain length
Result: Strong+Medium = realistic compromise (53 → 44 steps after M3)
Evidence: notebooks/03_adjacency_tiers.ipynb
```

### Example 3: Pre/post data cleanup

```
Question: Include vs exclude parent box objects from graph analysis
Metrics: node count, max degree, zone count, cross-zone %, critical chain
Result: Exclude → max degree 5161→388, zones 29→144
Evidence: Finding M3 archive
```

---

## Integration with other rules

| Rule | Relationship |
|------|-------------|
| R4 (Decision Records) | R10 extends R4 — validated decisions get an extra `**Validation**` field |
| R3 (Finding Archival) | A/B tests sometimes discover findings (e.g., M3 was found during zone A/B) |
| R8 (Human-AI Collaboration) | AI proposes options + metrics, human approves which to test |

---

## Anti-patterns

- **A/B theater**: Running the test but ignoring the result because you
  prefer the other option. If you override the data, document WHY.
- **Metric shopping**: Adding metrics until your preferred option wins.
  Define metrics BEFORE running.
- **Unequal effort**: Optimizing one option heavily but not the other.
  Both must get equal implementation effort.
- **Premature A/B**: Testing when the decision is trivially reversible
  or when no metric matters. This wastes time.
