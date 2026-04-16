# R12 — Technical Blog Writing

**Strength**: 🟢 MAY
**Version**: 0.1.0

---

## Rule

When writing a technical blog post for a **public audience**, declare one
of six post types at the top of the post and follow the minimum structure,
length guide, and voice convention for that type. Shared foundations
(Task-over-Tech, Audience-matched terminology, Depth-as-authenticity,
Writing style) are inherited from R11.

The goal is to make blog writing a **disciplined but flexible** practice:
each post type has its own shape, so the writer picks the right shape
for the purpose instead of fitting every idea into a single template.

### When to apply

- Publishing to a personal technical blog, team blog, or newsletter
- Writing a public post-mortem, retrospective, or deep-dive
- Translating internal findings (R3) or decision records (R4) into
  external posts
- Any public writing that is narrative in nature and not a portfolio
  project page

### When NOT to apply

- Portfolio project pages, resumes, recruiter-facing case studies
  — use **R11** instead
- Internal docs that ship under R1–R4 (they have their own formats)
- Short social-media posts (a single paragraph on LinkedIn / X)
- Reference documentation, API docs, or tutorials that are part of
  a software product (not authored as a blog post)

R11 and R12 are siblings, not a hierarchy: R11 documents **what you
did** for an external audience; R12 documents **how you think** for a
public audience. The same project can produce both.

---

## Six Post Types — Choose One

Every post SHOULD declare its type in the metadata (see "Post Metadata"
below). Picking a type commits the writer to its minimum structure; it
also tells the reader how to read the post.

### (1) 기술 고찰 / Deep-dive

Deep analysis of a specific technology, pattern, or design decision.

- **Example**: "Medallion Architecture를 건설 온톨로지 파이프라인에 적용한 이유"
- **Minimum structure**:
  1. Hook — the concrete symptom or question that forced the decision
  2. Context — what the surrounding system looked like and what constraints applied
  3. Options considered — at least two rejected alternatives, named specifically
  4. Selection rationale — why this option won under these constraints
  5. Trade-offs accepted — what was given up and why it was acceptable
  6. Outcome — what changed, measured where possible
- **Length guide**: 1,500 ~ 3,000 Korean characters (roughly 5–12 min read)
- **Voice**: analytical, evidence-heavy. Diagrams and tables are
  encouraged. Personal judgment is acceptable when framed as "I decided
  X because Y" with the reasoning exposed.

### (2) 프로젝트 회고 / Retrospective

Lessons-learned writeup after a project ended or a major phase closed.

- **Example**: "6개월 간 Refinery Ontology Analytics를 구축하며 잘못 판단한 3가지"
- **Minimum structure**:
  1. What was attempted and why
  2. Assumptions made going in (explicit list)
  3. What actually happened — including failures, regressions, dead-ends
  4. Which assumptions were wrong, and how they were corrected
  5. Transferable lessons — stated as patterns, not just anecdotes
- **Length guide**: 2,000 ~ 4,000 Korean characters (roughly 7–15 min read)
- **Voice**: honest. A retrospective without named failures usually is
  not a retrospective; it is a victory lap. Include what you would do
  differently, specifically.

### (3) 범프로젝트 인사이트 / Synthesis

Pattern or principle drawn from multiple projects.

- **Example**: "데이터가 없는 도메인에서 일할 때 반복해서 마주친 3가지 패턴"
- **Minimum structure**:
  1. The pattern or claim, stated upfront in one sentence
  2. At least three concrete cases that exhibit the pattern (each with
     project name, specific artifact, and outcome)
  3. Generalization — when does the pattern apply, when does it break
  4. Boundary conditions — where the claim is weakest or unproven
- **Length guide**: 1,500 ~ 3,000 Korean characters
- **Voice**: assertive but bounded. State the claim, then ground it in
  evidence. Acknowledge where the generalization is speculative.

### (4) 문제해결 노트 / Troubleshooting

Timeline of a specific bug, incident, or debugging session.

- **Example**: "Palantir Foundry가 pandas 2.x StringDtype을 거부한 이유"
- **Minimum structure**:
  1. Symptom — exact error, when it started, what worked before
  2. First hypothesis and why it seemed right
  3. Diagnosis timeline — what was tried, what each attempt ruled out
  4. Root cause — named with technical specificity
  5. Fix — the change made, with code or config diff if appropriate
  6. Prevention — what monitoring, test, or process was added
- **Length guide**: 800 ~ 2,000 Korean characters (keep it focused)
- **Voice**: chronological, concrete. "At 14:00 I noticed X. I first
  assumed Y, which was wrong because Z." Resist the urge to skip to the
  answer — the diagnostic journey is the value.

### (5) 비교·가이드 / Comparison

Side-by-side analysis of competing options with guidance on selection.

- **Example**: "Navisworks .NET API vs COM API: 언제 뭘 써야 하나"
- **Minimum structure**:
  1. Why this comparison matters (what decision the reader is facing)
  2. Each option's intent and primary use case
  3. Honest limitations of each (not just pros)
  4. Comparison table on axes that matter to the decision
  5. Selection criteria — "pick A when X; pick B when Y"
  6. Concrete mapping — worked example of applying the criteria
- **Length guide**: 1,000 ~ 2,500 Korean characters
- **Voice**: neutral. A comparison post loses credibility if one option
  looks artificially weak. Steelman both sides, then make the call based
  on explicit criteria.

### (6) 튜토리얼 / Tutorial

Step-by-step walkthrough for reproducing a capability.

- **Example**: "Florence-2 + SAM2 + ResNet-50 few-shot filter 파이프라인
  로컬 재현"
- **Minimum structure**:
  1. Goal — what the reader will have at the end, concretely
  2. Prerequisites — environment, dependencies, prior knowledge
  3. Numbered steps — each with code or command the reader runs
  4. Verification — how the reader confirms each step worked
  5. Extensions — optional variations or next steps
- **Length guide**: 1,500 ~ 5,000 Korean characters (longer is
  acceptable when code is included)
- **Voice**: imperative ("Install X", "Run Y"), reproducible.
  Reproducibility is the primary quality: versions pinned, commands
  copy-pastable, expected output shown.

---

## Shared Foundation (inherited from R11)

The following R11 principles apply to blog writing unchanged. A blog
post violating them fails R12 even if its type-specific structure is
correct.

### Task over Tech

The post centers on the task (the problem being explored), not the
technologies used. See R11 "Content Focus — Task over Tech" for the
full principle and examples. For blog specifically: if the reader
cannot state what problem your post addressed after reading, the post
is tech-listed, not task-centered.

### Audience-matched terminology

Use the industry-standard name for mainstream concepts (Redis,
PostgreSQL, Next.js, p95 latency, etc.). Do not invent an abstracted
alias for a concept that has a widely-adopted label. See R11 "Writing
Style — Audience-matched Terminology" for the full rule and table of
substitutions.

### Depth as authenticity

Specific numbers, rejected alternatives, explicit trade-offs, named
incidents, upstream traces (links to commits, PRs, issues, notebooks).
Depth is how engineering authenticity is demonstrated; surface-level
blog posts read as template-filled even when every word is true. See
R11 "Output Adaptation — Depth as authenticity" for the principle.

### Writing style rules

All R11 writing style rules apply:
- Complete sentences (no arrow notation in prose)
- Plain vocabulary (define jargon on first use)
- Specific metrics over vague claims
- Active voice
- Consistent tense

See R11 "Writing Style" for the full list and anti-patterns.

---

## Blog-unique Principles

These principles are additive to the shared foundation and apply only
to blog writing.

### Hook first

The first three sentences MUST answer "why should I keep reading?" for
the target reader. Options for a strong hook:

- **Concrete symptom**: "At 14:00 the build started failing on a line I
  had not changed in three months."
- **Counterintuitive claim**: "Microservices made our single-user tool
  slower, not faster."
- **Reader's pain**: "If you have ever tried to extract BIM data from
  Navisworks, you know the .NET API can read but not write."

Avoid empty openings: "In this post I will discuss...", "Recently I had
the chance to work on..."

### Prerequisite line

State what the reader should already know in one sentence near the top.
This is both a courtesy and a scope-setter.

- **Good**: "Assumes familiarity with OWL ontologies and basic SPARQL."
- **Good**: "No prior knowledge of Navisworks required."
- **Bad**: Omitting the line and losing readers who expected a
  beginner guide.

### Personal voice allowed

Unlike R11 (portfolio, past-tense accomplishments), R12 allows
first-person judgment and uncertainty:

- **Allowed**: "I think the trade-off was worth it because..."
- **Allowed**: "I am not fully convinced this pattern generalizes."
- **Allowed**: "If I were starting over I would try X first."

The discipline is to ground personal judgment in specific evidence,
not to hide behind it.

### Visual assets by type

Minimum visual asset guidance varies by post type:

| Post type | Visual asset minimum |
|-----------|--------------------|
| Deep-dive | ≥1 diagram or comparison table |
| Retrospective | Optional — use when a timeline or before/after makes it clearer |
| Synthesis | ≥1 pattern diagram or labeled table of cases |
| Troubleshooting | Recommended — screenshot of the error, diagnostic output |
| Comparison | ≥1 comparison table on the decision axes |
| Tutorial | Required — screenshots of expected output at key steps |

The R11 Visual Asset Checklist is a good reference for which asset
types to consider.

---

## Post Metadata (SHOULD declare at top of post)

A short YAML front matter or the first block of the post SHOULD declare
the following:

```yaml
type: 기술고찰 | 회고 | 인사이트 | 문제해결 | 비교 | 튜토리얼
reader_level: 초급 | 중급 | 고급
prerequisite: <one-line statement of assumed knowledge>
read_time: <estimated minutes>
related_projects: <link to R11 portfolio page(s) if applicable>
```

The metadata is not enforced — graceful parsing applies if tooling
reads it. But declaring it in human-readable form signals to the reader
how to approach the post and commits the writer to the chosen type.

### Example

```yaml
---
type: 기술고찰
reader_level: 중급
prerequisite: OWL 온톨로지와 SPARQL 기초 지식
read_time: 8분
related_projects: https://tygwan.dev/projects/refinery
---
```

---

## Cross-linking with R11 Portfolio

A blog post often expands on a single problem that a portfolio page
mentions in compressed form. When this is the case, R12 recommends
explicit cross-links in both directions:

### From the blog post

Near the top of the post, link to the portfolio project page:

> 이 글은 포트폴리오의 Refinery Ontology Analytics 프로젝트에서
> [M1 상류 분류 버그] 항목을 확장한 deep-dive입니다.
> <링크>

### From the portfolio project page

Inside the relevant `# 문제해결` H2 entry, link to the blog post:

```markdown
## [상류 분류 버그 M1] DXTnavis InferClass substring matching 997건 오분류를 ...

...

**Deep-dive**: 이 진단 과정의 전체 타임라인과 diagnostic evidence는
블로그 글 "DXTnavis InferClass 함수가 997건을 오분류한 과정"에 정리되어 있다.
```

### Why

R11 is depth-compressed for external evaluation (portfolio reader has
limited time). R12 is depth-expanded for readers who want the full
journey. Cross-linking lets the reader traverse both depths without
duplicating content.

---

## Anti-patterns

### General

- **No declared type**: a post that is "kind of a retrospective, kind
  of a deep-dive" tends to satisfy neither. Pick one; split if needed.
- **Hook missing**: opening with "In this post, I will discuss X" tells
  the reader nothing about why to care.
- **No prerequisites stated**: readers either get lost or bounce when
  the assumed background is invisible.
- **Depth inversion**: blog post shorter and less detailed than the
  portfolio page it expands. The whole point of R12 is that blog
  allows more depth than the portfolio's compressed view.

### Per type

- **Deep-dive without rejected alternatives**: presenting one
  approach as if it were the only option erodes engineering credibility.
- **Retrospective without failures**: a "lessons learned" post where
  every lesson was learned by succeeding is a victory lap, not a
  retrospective.
- **Synthesis with one example**: a cross-project pattern needs at
  least three cases to be a pattern. One case is a story.
- **Troubleshooting that skips to the answer**: the diagnostic journey
  is the content. A post that says "we had a bug, fixed it by X" wastes
  the reader's time.
- **Comparison with a straw-man option**: if one option looks
  artificially weak, the author did not engage with it seriously.
- **Tutorial not runnable as written**: copy-paste the post's commands
  into a fresh environment; if they fail, the tutorial fails.

---

## Examples

### Good — Deep-dive hook

> 정유 플랜트 BIM 모델에서 12,009개 객체를 Medallion Architecture로
> 흘려보낼지, 단일 Gold 테이블로 직행할지를 두 달간 고민했다. 결론만
> 말하면 Medallion을 택했고 신뢰도 플래그를 Gold 레이어에 도입한
> 덕분에 997건의 분류 오류를 downstream에 투명하게 노출할 수 있었다.
> 이 글은 그 결정의 과정과 기각한 대안, 지금 돌아보면 무엇을 다르게
> 했을지를 정리한다.

Why it works: concrete numbers in the hook, decision signaled upfront,
promise of rejected alternatives.

### Bad — Deep-dive hook

> 이번 포스트에서는 데이터 파이프라인 아키텍처에 대해 다뤄보고자
> 합니다. 최근 Medallion Architecture가 주목받고 있어 한번 정리해
> 보았습니다.

Why it fails: empty opening, no concrete problem, no hint of the
writer's stake.

### Good — Retrospective opening with named failure

> Refinery Ontology Analytics를 구축할 때 parent box 객체 448개가
> adjacency 그래프의 66%를 점유하고 있다는 것을 놓쳤다. 이 단일 가정
> 실패로 Louvain community detection이 의미 없는 29개 거대 zone을
> 생성했고, 추후 parent box를 제외한 뒤에야 144개 유의미한 zone이
> 드러났다. 이 회고에서는 놓친 가정 3가지와 각각을 다음 프로젝트에서
> 어떻게 조기 발견할지를 적는다.

Why it works: concrete failure named in the opening, specific metrics
of the failure, promise of transferable lessons.

### Good — Troubleshooting timeline

> **14:00** Foundry에 10개 데이터셋 업로드 중 3번째에서 `TypeError:
> Cannot convert StringDtype to Spark Arrow`.
>
> **14:05** 첫 가설: Foundry 환경의 pyarrow 버전이 낮다고 추측.
> `pyarrow.__version__` 확인 결과 14.0.1로 충분. 가설 기각.
>
> **14:25** 로컬에서 동일 DataFrame을 재생성해도 문제없음. 환경 차이가
> 원인이라는 것만 확인. 이 시점에서 pandas 2.x vs 1.x 차이를 의심하기
> 시작.
>
> ...

Why it works: timestamps anchor the reader, each attempt is explicit
about what it ruled out, the eventual root cause becomes believable
because the journey is visible.

### Good — Comparison selection criteria

> Navisworks .NET API와 COM API를 하이브리드로 사용하기로 결정한
> 이유는 단일 API로 커버되는 경계가 명확했기 때문이다. 속성 읽기,
> Selection Set, TimeLiner 조작은 .NET으로 type-safe하게 처리하고,
> 속성 쓰기와 메시 추출은 COM의 Late-binding을 통해서만 가능하다.
> 따라서 "쓰기 연산이 필요하면 COM, 아니면 .NET"이 실용 기준이었다.

Why it works: explicit decision criterion ("쓰기 연산이 필요하면
COM"), grounded in each API's actual capability boundary.

---

## Integration with other rules

| Rule | Relationship |
|------|-------------|
| R3 (Finding archival) | A finding documented internally under R3 can be rewritten as a **(4) 문제해결 노트** for public audience |
| R4 (Decision records) | A decision recorded internally under R4 can be expanded into a **(1) 기술 고찰** for public audience |
| R8 (Human-AI collaboration) | Trade-off analyses surfaced in R8 can feed **(2) 회고** or **(3) 인사이트** posts |
| R10 (Decision validation) | A/B experiment evidence from R10 becomes the quantitative Result in a **(1) 기술 고찰** |
| R11 (Portfolio writing) | R11 and R12 cross-link: portfolio page compresses, blog post expands. See "Cross-linking with R11 Portfolio" above |

R12 is **downstream** of R3 / R4 / R8 / R10 the same way R11 is:
internal documentation is the raw material that a public blog post
rewrites for a different audience with a different depth.

---

## Adjusting R12 over time

R12 is explicitly designed to evolve. When the writer discovers:

- A post type that does not fit any of the six → propose a 7th type
  with a worked example
- A shared principle from R11 that needs blog-specific tightening or
  loosening → document the delta
- An anti-pattern that the writer consistently falls into → add it
  to the Anti-patterns section

The rule is MAY, so unilateral deviation is acceptable. What is
encouraged is to **write down the deviation** so the rule improves
with each post rather than being ignored.

---

## Reference implementation

The portfolio site at <https://github.com/tygwan/portfolio> will host
blog posts under the `Posts` Notion database with `type` tagging
corresponding to the six post types above. The blog index view at
`/posts` filters by type, making the convention discoverable to readers.
