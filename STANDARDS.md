# STANDARDS — dev-standards v0.3.0

> 이 문서는 `dev-standards` 의 **총괄 개요** 입니다.
> 각 규칙의 상세는 [`rules/`](rules/) 디렉터리의 개별 문서를 참조하세요.

---

## 철학 — 왜 이 규칙들이 필요한가

### 문제 인식

개발 프로젝트는 기간이 길어질수록 **자기 자신에게 낯설어집니다**:

- 3개월 전 결정의 맥락을 잊어버림
- 어느 커밋이 어느 결정과 관련있는지 추적 불가
- 외부 repo/이슈 와의 상호작용 이력이 흩어짐
- 새 협력자가 프로젝트를 이해하는 데 수일 소요
- AI 도구에게 매번 프로젝트 맥락을 설명해야 함

### 해결 원칙

1. **명시적 > 암묵적** — 모든 결정은 문서로. "기억하고 있다" 는 믿을 수 없음
2. **재현 가능 > 일회적** — audit script 와 테스트로 주장의 근거 제공
3. **비파괴 > 삭제** — 데이터/결정을 삭제 대신 플래그로 표시
4. **단일 진입점 > 분산** — "한 문서만 열면" 프로젝트 전체 상황 파악
5. **도구 중립 > 특정 종속** — 파이썬 / Rust / Node.js / 어느 도구든 적용 가능

### 목표

이 규칙을 따르는 프로젝트는 **완료 1년 후** 에 돌아와서도:
- 어떤 문제가 있었는지 5분 내 파악
- 어떤 결정이 어떤 근거로 내려졌는지 추적
- 각 Phase 의 작업 내역을 재현
- 외부 의존성의 상태를 확인
- 새 협력자가 하루 내 기여 가능

---

## 11 Rules Catalog

| ID | 제목 | 강도 | 한 줄 요약 |
|:-:|------|:-:|-----------|
| **R1** | [Documentation architecture](rules/R1-documentation-architecture.md) | 🔴 MUST | `docs/` 하위 5 디렉터리 + 단일 포털 `PROJECT-JOURNAL.md` |
| **R2** | [Task logging](rules/R2-task-logging.md) | 🔴 MUST | 작업 완료 시 5-section 기록 (언어/내용, 문제, 분석, 해결, 결과) |
| **R3** | [Finding archival](rules/R3-finding-archival.md) | 🔴 MUST | 이슈 발견 시 6-step 아카이브 (보관→정리→시각화→기록→포털→커밋) |
| **R4** | [Decision records](rules/R4-decision-records.md) | 🔴 MUST | 구조적 결정은 ID + Context + Decision + Rationale + Impact 로 기록 |
| **R5** | [Git workflow](rules/R5-git-workflow.md) | 🟡 SHOULD | Atomic commit, imperative 제목, commit+push 쌍, never destroy |
| **R6** | [External dependency management](rules/R6-external-dependency-management.md) | 🟡 SHOULD | 외부 repo 와 action 은 draft → submit → track 절차 |
| **R7** | [Issue classification](rules/R7-issue-classification.md) | 🟡 SHOULD | Severity/Status vocabulary 통일 |
| **R8** | [Human-AI collaboration](rules/R8-human-ai-collaboration.md) | 🟡 SHOULD | Trade-off 분석, escalation, Claude Code 메모리 규칙 |
| **R9** | [Provenance and reproducibility](rules/R9-provenance-reproducibility.md) | 🟡 SHOULD | 외부 의존성 버전 고정, 재현 가능한 audit |
| **R10** | [Decision validation (A/B testing)](rules/R10-decision-validation.md) | 🟡 SHOULD | 측정 가능한 결정은 A/B 실험으로 검증 후 채택 |
| **R11** | [Portfolio / External writing](rules/R11-portfolio-writing.md) | 🟢 MAY | 외부 발표용 글은 PAAR + 2-part narrative + 시각 자료 체크리스트 |

### 강도 (Rule Strength)

- 🔴 **MUST** — 이 규칙을 따르지 않으면 dev-standards 준수가 아님. 포기 불가.
- 🟡 **SHOULD** — 강력 권장. 예외가 있을 수 있지만 대부분 경우에 적용.
- 🟢 **MAY** — 선택 사항. 프로젝트 상황에 따라.

v0.3.0 에서 최초의 MAY 규칙(R11) 추가. 프로젝트를 외부 독자에게 전달하는
글쓰기 규칙이며, 내부 개발에는 적용되지 않음.

---

## Meta Rule — 규칙 사이의 관계

각 규칙은 독립적이지 않고 서로 연결됩니다:

```
R1 Architecture
  └── 디렉터리 구조와 포털 정의
        ↓
        ├── R2 Task logging 이 docs/tasklog/ 에 살고
        ├── R3 Finding archival 이 docs/findings/ 에 살고
        ├── R4 Decision records 가 docs/PROJECT-JOURNAL.md §4 에 살고
        └── R6 External deps 가 docs/PROJECT-JOURNAL.md §5 에 삼

R3 Finding archival
  └── 발견 즉시 R5 Git workflow 에 따라 커밋
        ↓
        └── R9 Provenance 로 재현 보장

R4 Decision records + R8 Human-AI collab
  └── 구조적 결정은 trade-off 분석 후 기록
        ↓
        └── R10 측정 가능하면 A/B 검증 → 노트북 증거 보존

R6 External deps + R7 Issue classification
  └── 외부 repo 이슈에 severity 부여

R1 + R4 + R10
  └── 내부 문서화 산출물이 R11 외부 글쓰기의 raw material
        ↓
        └── R11 이 PAAR + 2-part narrative 로 재구성
```

**단일 진입점** (R1 `PROJECT-JOURNAL.md`) 은 다른 10 규칙의 **내비게이션 허브** 입니다.

---

## Out of scope — 이 규칙이 다루지 않는 것

### 명시적으로 제외

- **프로그래밍 언어** — Python/Rust/TS/Go 등 어느 것도 강제하지 않음
- **테스트 프레임워크** — pytest/jest/cargo test 등 선택은 프로젝트 자율
- **빌드 도구** — make/cargo/npm/poetry 등 선택 자유
- **아키텍처 패턴** — MVC/event-driven/microservice/monolith 등 자유
- **플랫폼** — AWS/GCP/Azure/on-premise 등 자유
- **데이터베이스 종류** — SQL/NoSQL/그래프 등 자유
- **도메인** — 어떤 산업/도메인이든 적용 가능

### 미래 버전에서 추가 예정 (아직 없음)

- **언어별 `templates/language-specific/`** — Python/TypeScript/Rust 등 skeleton
- **CI/CD templates** — GitHub Actions, GitLab CI 기본 설정
- **Pre-commit hooks** — 공통 lint/format 설정
- **Language-specific README sections** — 각 언어 생태계의 conventions
- **Issue templates** — GitHub issue template 예시

---

## 적용 대상

이 규칙이 적용되는 **두 가지 케이스**:

### Case 1: 기존 프로젝트 retrofit

이미 존재하는 프로젝트에 이 규칙을 나중에 적용:

1. `docs/` 디렉터리 구조 생성 또는 기존 문서 재정리
2. `PROJECT-JOURNAL.md` 추가 (Timeline 을 git log 에서 복원)
3. 과거 이슈를 `docs/findings/` 에 소급 기록 (할 수 있는 범위에서)
4. `CLAUDE.md` 추가하여 버전 명시
5. 향후 작업부터 R2/R3/R4 규칙 적용

### Case 2: 새 프로젝트 greenfield

완전히 새 프로젝트를 이 규칙과 함께 시작:

1. `scripts/init-project.sh` 로 자동 bootstrap
2. 첫 커밋 부터 모든 규칙 적용
3. 일관된 메타데이터 누적

---

## 버전 관리

`dev-standards` 자체는 **semver-like** 버전 관리:

- **Major** (1.0.0 → 2.0.0): 기존 규칙이 파괴적으로 변경됨 (예: 섹션 구조 변경)
- **Minor** (0.1.0 → 0.2.0): 새 규칙 추가 또는 기존 규칙의 확장 (backward compatible)
- **Patch** (0.1.0 → 0.1.1): 문서 수정, typo, 예시 추가 등

각 프로젝트의 `CLAUDE.md` 에는 현재 사용 중인 버전이 명시됩니다:

```markdown
standards_source: https://github.com/<org>/dev-standards
standards_version: 0.2.0
```

---

## 기여 및 피드백

규칙의 불명확함, 누락된 영역, 개선 제안이 있으면:

- **Issue**: 토론이 필요한 사항
- **PR**: 명확한 개선 제안

각 PR 은 다음을 포함해야 함:
- 어느 규칙 (R1–R10) 이 영향 받는지
- CHANGELOG 업데이트
- 영향받는 프로젝트에 대한 migration 가이드 (breaking change 시)

---

## 관련 문서

- [README.md](README.md) — 이 저장소 소개와 사용법
- [CHANGELOG.md](CHANGELOG.md) — 버전 이력
- [rules/](rules/) — 10 규칙의 개별 상세
- [templates/](templates/) — 프로젝트 scaffolding
- [memory/](memory/) — Claude Code 메모리 규칙
- [scripts/init-project.sh](scripts/init-project.sh) — 자동 bootstrap
- [examples/first-ontology-project.md](examples/first-ontology-project.md) — 첫 실제 적용 사례
