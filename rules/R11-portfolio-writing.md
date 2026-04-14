# R11 — Portfolio / External Writing

**Strength**: 🟢 MAY
**Version**: 0.2.0

---

## Rule

When a project is presented to an **external audience** (portfolio,
resume, public documentation, recruiter-facing page), the project
description SHOULD follow the **PAAR structure**, the **two-part narrative**,
and include at least one item from the **Visual Asset Checklist**.

The goal is to communicate **why the work mattered** and **how decisions
were made** — not merely what was built. In an era where implementation
is increasingly automated, the differentiating signal is problem framing
and engineering judgment.

### When to apply

- Writing a portfolio site's project page
- Writing a case study or public retrospective
- Preparing a project summary for hiring / recruiting contexts
- Translating internal docs (R1~R10 outputs) into external-facing content

### When NOT to apply

- Internal task logs (R2), finding archives (R3), decision records (R4)
  — those have their own formats and audiences
- READMEs for internal tools with no external readership
- Short one-liner project lists (summary cards) — too brief for full PAAR

---

## PAAR Structure

Every major section of the project description answers four questions:

| Letter | Question | What it demonstrates |
|:-:|----------|---------------------|
| **P** — Problem | Why did this problem matter? Who felt the pain? | Domain understanding |
| **A** — Analyze | What options existed? Why this direction? | Engineering judgment |
| **A** — Action | What trade-offs did you manage during implementation? | Technical execution |
| **R** — Result | What changed, measured how? | Evidence of impact |

PAAR is a **lens**, not a rigid template. Each paragraph may not include
all four letters, but the full project description MUST address all four
collectively.

---

## Content Focus — Task over Tech

The narrative MUST center on the **task** (the problem the project set
out to solve), not the **technologies** used. A reader should understand:

1. **What was the problem?** — The purpose of the project as a task,
   not as a tech stack showcase.
2. **What was used to solve it?** — Tools and technologies are
   mentioned in service of the solution, not as the headline.
3. **How was the problem actually solved?** — Specific decisions,
   trade-offs, and the reasoning behind them.

A sentence like "Built with Next.js + Supabase + TailwindCSS" fails
this test. A sentence like "To let users resume unfinished cover
letters without losing state, I moved draft persistence from local
storage to Supabase, which required reconciling offline edits on
reconnection" passes it.

**Rule of thumb**: If the tech stack is removed from your description,
does the core story still make sense? If yes, the task is properly
centered. If no, rewrite to focus on the task.

---

## Two-Part Narrative

### Part 1 — Context and Value

Conveys the project's **meaning** to someone outside the domain.
Written so a non-specialist (recruiter, PM, different-domain engineer)
can follow.

Required content:

1. **Domain background** — What actually happens in this field?
   Describe in plain language, no jargon.
2. **Problem definition** — What were the specific limitations of the
   existing approach? Use concrete language: "could not X", "was
   impossible to Y".
3. **Approach and result** — What judgment led to this direction,
   and what quantitative outcome resulted?

### Part 2 — Implementation

Conveys the **technical decisions** for engineers reviewing the work.

Required content:

1. **Architectural rationale** — Why this stack, pattern, or structure?
   What alternatives were rejected and why?
2. **Engineering detail** — Data flow, core algorithms, performance
   optimizations, or system boundaries that required care.
3. **Quality assurance** — Test strategy, validation methods, CI/CD,
   or reproducibility guarantees.

### Structure guidelines

- Default paragraph count is 3+3 (three Part 1, three Part 2) but scale
  up or down based on project size
- Headings reflect content naturally — avoid numbered headings like
  "1. Problem" or generic headings like "Introduction"
- If framework-specific skills need highlighting (for recruiting), weave
  them into the narrative rather than adding a separate "Skills" section

---

## Enrichment Sections (include when applicable)

Beyond the default 3+3 structure, the following sections MUST be
included when the project has relevant experience. These are high-signal
items that differentiate strong portfolios.

### Operational Experience

Include this section if the project was **operated** (deployed, used
by real users, or ran in production) and you handled either of:

- **Critical incident resolution** — Describe a severe outage or
  failure you diagnosed and resolved. Include: symptom, root cause,
  fix, and prevention measure.
- **Performance / resource optimization** — Describe a measurable
  optimization you performed. Include: baseline metric, bottleneck
  identified, change made, and resulting metric.

Format:

```markdown
### 운영 경험 / Operational Experience

**장애**: <one-line symptom, e.g., "API 응답시간이 p95 기준 2s→12s로 급등">
**원인**: <root cause>
**해결**: <what you did>
**결과**: <metric after fix>
**예방**: <monitoring, test, or process added>
```

### Open Source Contribution

Include this section if you encountered a bug, missing feature, or
limitation in an open-source dependency and **contributed a fix or
enhancement upstream**.

Format:

```markdown
### 오픈소스 기여 / Open Source Contribution

**대상**: <repo name + link>
**문제**: <bug or missing feature you encountered>
**기여**: <PR/issue link + what the contribution did>
**결과**: <merged / discussed / adopted + evidence>
```

Both sections are **signal-dense**: they demonstrate operational
maturity and ecosystem awareness, which are rarely visible from code
alone.

---

## Visual Asset Checklist

Review each item and include those that apply. Not every project needs
every type — use judgment.

### Commonly applicable (review for every project)

- [ ] **Screenshot / UI capture** — For any project with a user-facing
      surface (web, desktop, mobile, CLI)
- [ ] **Architecture Diagram** — For any project with ≥3 interacting
      components or services

### Context-dependent (review when relevant)

- [ ] **Before/After comparison** — When the project improved an
      existing workflow, process, or metric
- [ ] **Terminal / Code Output** — For CLI tools, libraries, or when
      command output is the primary artifact
- [ ] **Input→Output example** — For ML/CV/NLP projects where the
      system transforms data (show what goes in and what comes out)
- [ ] **Chart / Table** — For performance metrics, A/B results (R10),
      or quantitative comparisons

### Specialized (use when applicable)

- [ ] **Data Flow / Pipeline Diagram** — For multi-stage data pipelines
      where the stages themselves are meaningful
- [ ] **Graph / Network visualization** — For knowledge graphs,
      ontologies, dependency graphs, or network analysis
- [ ] **Demo GIF / Video** — For interactive behavior that cannot be
      conveyed by a static screenshot

### Minimum rule

At least **one** visual asset should be included. Projects with zero
visual assets fail to communicate scope and outcomes effectively.

---

## Tech Stack — Role-based Classification

List the tech stack **by role**, not as a flat tag cloud.

### Format

```
{ name: "<technology>", role: "<what it does in THIS project>" }
```

### Common categories

- **Frontend** — UI, rendering, state management
- **Backend** — API, business logic, server
- **AI** — Models, inference, agents, LLM orchestration
- **Data Pipeline** — ETL, transformation, validation
- **DevOps** — Deployment, CI/CD, infrastructure
- **Quality** — Testing, linting, monitoring

### Example

```
Frontend:
  - Next.js — App Router + ISR for portfolio pages
  - TailwindCSS — Design token system

Data Pipeline:
  - Python — Medallion pipeline (Bronze → Silver → Gold)
  - rdflib — OWL ontology materialization

AI:
  - Gemini 2.5 Flash — ReAct agent backbone
  - LangGraph — Tool orchestration
```

The role field makes the stack **interpretable** — a reader sees not
just "we used X" but "X was responsible for Y here".

---

## Writing Style

### Rules

1. **Complete sentences** — Do not use arrow notation (`→`) in prose.
   Write full sentences with verbs: "The pipeline transforms raw data
   into enriched Parquet files" (not "raw data → enriched Parquet").
2. **Plain vocabulary** — Prefer commonly understood words. Acronyms
   and jargon are acceptable only when the audience is expected to know
   them; otherwise define on first use.
3. **Audience-matched terminology** — Use the specific industry-standard
   name for mainstream technologies and concepts, not an abstracted
   description or an invented alias. See the subsection below.
4. **Specific metrics** — Prefer "336 tests passing, 100% Oracle
   agreement" over "extensive testing". Vague claims erode trust.
5. **Active voice** — "I built X" or "The system does Y", not
   "X was built".
6. **Consistent tense** — Stick to past tense for completed work,
   present tense for ongoing systems.

### Audience-matched Terminology

Rule #2 (plain vocabulary) prohibits unnecessary jargon. Rule #3 is its
complement: when a concept **does** have a widely-adopted name in the
relevant industry, use that name.

| Replace this | With this |
|--------------|-----------|
| "내부 캐시 서버" / "key-value store" | **Redis** |
| "관계형 DB" / "데이터베이스 시스템" | **PostgreSQL** / **MySQL** |
| "HTTP 프록시" / "웹 서버" | **Nginx** (if that is what was used) |
| "서버 렌더링 프레임워크" | **Next.js** (if that is what was used) |
| "대부분 요청의 응답시간" | **p95 latency** |
| "부하 분산기" | **load balancer** (the term most engineers expect) |

**Why.** External readers — recruiters, hiring managers, peer engineers
— filter many candidates or projects under time pressure. A recognized
name anchors them instantly to a known set of capabilities and failure
modes. An unfamiliar term forces them to either investigate (friction)
or default to a skeptical interpretation (bias).

**How to apply.**

- Name the specific tool or pattern that was actually used. Do not
  describe it abstractly when a shorter, recognized name exists.
- When a project overlaps with a mainstream pattern (web service,
  data pipeline, ML training), expect readers to know the standard
  stack terms for that domain and use them.
- If the project uses something genuinely non-mainstream (e.g., a
  custom protocol), name it and briefly define it on first use.
- Avoid the reverse trap: do not invent a new label for a mainstream
  concept in order to sound distinctive. Distinctiveness comes from
  the decisions, not the labels.

**This is not a license for jargon-stuffing.** The rule is directional:
use the precise, recognized name *when one exists*. If the reader would
reasonably not know a term, define it.

### Anti-patterns

- **Arrow diagrams in text**: `A → B → C` obscures the actual logic.
  Write: "A feeds into B, which then produces C."
- **Jargon without grounding**: "Leveraged polyglot observability
  fabric" (unclear what was actually done).
- **Abstracted-away tech names**: "Used an in-memory store" instead of
  "Used Redis". The reader cannot evaluate the choice if the tool is
  anonymous.
- **Unsubstantiated superlatives**: "Revolutionary", "cutting-edge",
  "state-of-the-art" — replace with concrete evidence.
- **AI hype padding**: If AI was used, describe what it did in one
  strong paragraph. Do not spread vague AI claims throughout.

---

## Output Adaptation — Depth varies by medium

### Depth as authenticity

Before the mechanics, a principle: **depth is how engineering
authenticity is demonstrated**, not an aesthetic preference.

In an era where anyone can generate a polished-sounding project
description from a tech stack, the differentiating signal is the
accumulation of specific details that only someone who actually did
the work would know: a concrete metric, an alternative that was tried
and rejected, a trade-off that was accepted, an incident that was
diagnosed and resolved. A portfolio that stays at the surface reads
as "template-filled" or "AI-generated" even when every word is true.

Depth is built from:

- **Specific numbers** with units and baselines (not "significant
  improvement" but "F1 52.56% → 88.05% on 4,959 images")
- **Rejected alternatives** (what else was considered, why it was not
  chosen — names of the options matter)
- **Explicit trade-offs** (what was given up, and why that was the
  right cost to pay)
- **Named incidents** (a real failure that happened, diagnosed with
  symptom → root cause → fix → prevention)
- **Upstream traces** (links to commits, PRs, issues, notebooks that
  let the reader audit the claim)

A compressed surface-level portfolio paragraph is indistinguishable
from hundreds of others. A detailed one proves the author was present
during the decision.

### The same PAAR narrative is portable across media

The narrative is portable, but the **depth** of each problem/solution
changes by audience and context.

### Depth levels

| Depth | Resume / CV | Portfolio / Case study |
|-------|-------------|----------------------|
| Problem | 1 sentence | 1~2 paragraphs — symptom, impact, why it mattered |
| Decision | Not included | 1 paragraph — what alternatives existed, why this one |
| Solution | 1 sentence | 1~2 paragraphs — concrete mechanism, technical detail |
| Trade-offs | Not included | 1 paragraph — what was given up, why acceptable |
| Result | 1 metric | 1 paragraph — metric + how measured + what it changed |

### Rule

- **Resume / CV**: state problem + solution in ~2 lines. The reader
  has ~30 seconds per item; compression is the goal.
- **Portfolio / Case study**: expand each problem to show the
  **reasoning process**. The reader is evaluating judgment, not just
  outcome. A portfolio that skips to the result looks no different from
  "we built X" — the differentiating content lives in the middle.

Rule of thumb: a portfolio paragraph about one problem should answer
all five of these questions: **What happened? Why did it matter? What
else could have been done? What did you do? What was the trade-off?**

### Medium-specific adaptation

| Medium | Adaptation |
|--------|-----------|
| **Notion page** | Full depth, heading per problem, callouts for metrics, image blocks |
| **Markdown README** | Full depth, fenced code for terminal output, images via relative paths |
| **Web portfolio** | Full depth with typography scale, embedded assets |
| **PDF resume** | Compressed: one bullet per problem, link to portfolio for detail |

The **content** depth is identical across portfolio/case study media;
only the presentation layer changes. Resumes are the exception — they
compress.

---

## Structural Convention for Single-Source Authoring (optional)

When a portfolio stack includes tooling that can parse a project page
to automatically render both a detailed portfolio view and a compressed
resume view, R11 recommends the following section convention. This is
**optional** — PAAR and the two-part narrative do not require it — but
it enables "edit one page, both views update" workflows.

### Three marker headings

Use three H1 headings as section markers inside a project page body:

```
# 문제해결        (Problem Solving)
# 구현            (Implementation)
# 크로스역량      (Cross-competency, optional)
```

All other H1 headings (overview, architecture, operational experience,
visual assets, tech stack, etc.) are treated as contextual content —
they render only in the portfolio view.

### Under `# 문제해결`

Each H2 under this marker is one problem-solving entry. Its title is
the compressed resume line. Its body (paragraphs, images, code blocks
until the next H2 or H1) is the portfolio-view expansion.

**H2 title format**: `[domain] problem + solution + result`
compressed into one sentence.

```markdown
# 문제해결

## [Construction CV] Florence-2 + SAM2 의 F1 52.56% 한계를 ResNet-50 few-shot filter 로 해결, F1 88.05% 달성

Why it mattered, what alternatives existed, what was built, how it was
validated — 2-3 paragraphs of PAAR narrative, plus an image or chart.

## [Label-cost automation] 수작업 7,776시간을 클래스당 5장 K-shot 으로 99% 절감

...
```

### Under `# 구현`

A bulleted list. Each bullet is one implementation signal line — a
concrete engineering decision or technical mechanism that demonstrates
depth. Bullets are shown verbatim in both resume and portfolio views.

```markdown
# 구현

- ResNet-50 2048-d embeddings + cosine similarity for K-way re-classification
- Threshold × shot grid search to quantify F1 / recall / retain-rate trade-offs
- Forked `autodistill` into `modified_packages/` as plugin-style classifier
```

### Under `# 크로스역량`

A single paragraph or bullet capturing one cross-domain or adjacent
capability that strengthens the project's signal (publication,
production deployment, adjacent ecosystem contribution). Optional.

```markdown
# 크로스역량

Submitted to *Automation in Construction* (under review); methodology
extended into master's thesis on LMM-based labeling framework.
```

### Graceful parsing

Implementations of this convention **MUST** be tolerant:

- Match marker names case-insensitively with common variants
  (e.g., `문제해결`, `문제 해결`, `Problem Solving`, `problem-solving`)
- Fall back to a simpler rendering (one-liner, legacy fields) when the
  markers are missing. Do not fail.
- Do not enforce heading levels rigidly — accept H1 or H2 markers if
  consistently used.

A strict parser that breaks when a heading is slightly reworded defeats
the purpose of the convention. The convention is a recommendation for
authors who want the auto-render benefit; it is not a wall.

### Why this works

- **Single edit surface**: the author writes one page; both views stay
  in sync
- **Narrative preserved**: H2 + paragraphs retain full PAAR flow
- **Resume is compression, not rewrite**: the compression is literally
  "extract titles + bullets"
- **Visual assets in place**: images live under the H2 they illustrate,
  so they appear in portfolio but are skipped in resume
- **Contextual sections unaffected**: `# Overview`, `# Architecture`,
  `# 운영경험`, `# 기술 스택` remain portfolio-only because they are
  not marker headings

### Reference implementation

The portfolio site at <https://github.com/tygwan/portfolio> uses this
convention. See `src/lib/notion.ts` for the `getProjectResumeSummary`
parser and `src/app/resume/page.tsx` for the dual-view rendering.

---

## Examples

### Good — Part 1 opening

> 정유 플랜트의 SP3D BIM 모델은 12,009개 객체와 110,173개 공간관계로
> 구성되는데, 기존 방식으로는 시공 순서를 자동 분석하거나 자연어로
> 설계를 질의할 수 없었다. 온톨로지 기반 지식그래프로 변환하면 SPARQL
> 질의, Neo4j 경로 탐색, LLM 에이전트 검색이 한 모델에서 가능해질 것이라
> 판단했고, 결과적으로 477K RDF 트리플과 261K Neo4j 엣지를 생성하여
> 33개 KPI와 12개 REST 엔드포인트로 노출했다.

Why it works: Plain language, specific numbers, problem→direction→result
all in one paragraph.

### Bad — jargon-heavy opening

> Leveraged cutting-edge ontology-driven paradigm to synergize BIM
> interoperability through next-gen graph-based AI workflows.

Why it fails: No concrete problem, no metrics, no domain grounding.

### Good — Part 2 implementation

> Medallion Architecture를 택한 이유는 각 단계를 독립적으로 테스트하고
> 롤백할 수 있기 때문이다. Bronze에서 원본을 그대로 보관하고, Silver에서
> 단위 변환(Imperial을 SI로)과 분류 정규화를 수행하며, Gold에서 신뢰도
> 플래그(HIGH/LOW/LIKELY_BUG)를 부여했다. 분류 오류 997건은 negative
> lookahead regex로 해결하여 DXTnavis 업스트림에 PR로 제출했다.

Why it works: Decision rationale first, then concrete technical detail,
then evidence of upstream contribution.

### Good — Task-centered (tech is secondary)

> 이력서 초안을 쓰다가 중단하면 로컬 상태가 날아가서 처음부터 다시 쓰는
> 문제가 있었다. 드래프트를 서버에 저장하도록 바꾸되, 오프라인 편집이
> 온라인 편집을 덮어쓰지 않도록 마지막 수정 시각을 비교하여 병합하는
> 정책을 택했다. 이 과정에서 Supabase Realtime을 썼지만, 핵심은 동시
> 편집 충돌을 사용자가 인지할 수 있게 만드는 것이었다.

Why it works: The task (preserving draft state) drives the story. The
technology (Supabase) is mentioned briefly in service of the solution,
not as the main point.

### Bad — Tech-centered

> Used Next.js for SSR, Supabase for auth and realtime, TailwindCSS
> for styling, Framer Motion for animations, and Claude API for
> generation. Deployed on Vercel with ISR.

Why it fails: No problem, no decision, no trade-off — just a stack
list. The reader learns what was used but not why anything mattered.

### Good — Operational experience

> 서비스 런칭 직후 API p95 응답시간이 2s에서 12s로 급등했다. 로그를
> 확인한 결과 LLM 호출마다 매번 시스템 프롬프트를 재전송하고 있었고,
> 프롬프트 캐싱을 적용하지 않아 매 요청이 전체 토큰을 소비했다. Claude
> API의 prompt caching을 적용하여 캐시 히트 시 토큰을 90% 절감하고 p95를
> 2.8s로 회복했다. 이후 캐시 히트율을 대시보드에 노출하여 회귀를
> 감시한다.

Why it works: Concrete symptom, diagnosis, fix, metric, and prevention.

### Good — Open source contribution

> DXTnavis의 InferClass 함수가 word boundary 없는 substring matching을
> 사용하여 "steel" 문자열 안의 "tee", "Pipe Rack" 안의 "pipe"를 오분류
> 하고 있었다. Piping 항목 997건이 잘못된 카테고리로 분류되었다. negative
> lookahead regex로 word boundary를 강제하는 패치를 작성하여 업스트림
> 에 PR #3로 제출했고, 내 프로젝트에서는 같은 로직을 적용한 후처리
> 스크립트로 즉시 대응했다.

Why it works: Names the repo, describes the bug concretely, shows both
the contribution and the local workaround.

---

## Integration with other rules

| Rule | Relationship |
|------|-------------|
| R1 (Documentation Architecture) | R11 draws source material from `PROJECT-JOURNAL.md` and findings |
| R4 (Decision Records) | Part 2's architectural rationale cites decisions recorded under R4 |
| R10 (Decision Validation) | A/B test results from R10 become the quantitative Result in PAAR |

R11 is **downstream** of R1–R10: internal documentation produced under
those rules is the raw material that R11 refines into external-facing
content.

---

## Anti-patterns

- **Feature lists without context**: "Built login, dashboard, and
  analytics" — describe what problems each feature solved, not just
  their existence.
- **Implementation-first structure**: Starting with tech stack before
  explaining the problem. The reader does not yet know why to care.
- **Metric-free claims**: "Significantly improved performance" without
  a number. R10 evidence exists for this reason.
- **Copy-paste from internal docs**: Internal `docs/findings/` entries
  are too detailed; `docs/analysis/` is too technical. R11 content is a
  *rewrite* for a different audience, not a copy.
- **Single "About" paragraph**: A one-paragraph summary lacks both
  narrative and evidence. Use the 3+3 default as a minimum.
