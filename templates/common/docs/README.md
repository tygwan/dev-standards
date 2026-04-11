# Documentation Index

이 디렉터리는 {{PROJECT_NAME}} 의 모든 문서를 담고 있습니다.
`dev-standards` R1 규칙에 따라 역할별로 분류됩니다.

> **🗂 프로젝트 전체 스토리를 한 번에 보고 싶다면**:
> [`PROJECT-JOURNAL.md`](PROJECT-JOURNAL.md) — 문제, 결정, 타임라인을 한 문서에서 내비게이션.

## 언제 무엇을 읽어야 하나

| 상황 | 읽을 문서 |
|------|----------|
| **"어떤 문제를 마주했었지?"** | [`PROJECT-JOURNAL.md`](PROJECT-JOURNAL.md) ← 단일 포털 |
| 프로젝트를 처음 접할 때 | [../README.md](../README.md) |
| 계획 문서 | [plan/](plan/) |
| 설계 결정 근거 | [analysis/](analysis/) |
| 작업 기록 | [tasklog/](tasklog/) |
| 발견된 이슈 | [findings/](findings/) |
| 외부 참조 자료 | [reference/](reference/) |

## 디렉터리 구조

```
docs/
├── PROJECT-JOURNAL.md       단일 포털: 문제/결정/타임라인
├── README.md                (이 문서)
│
├── plan/                    계획 문서 — "앞으로 무엇을 할 것인가"
│
├── analysis/                설계 결정 — "왜 이렇게 정했는가"
│
├── tasklog/                 작업 기록 — "무엇을 했는가"
│   ├── README.md
│   └── TEMPLATE.md
│
├── findings/                이슈 아카이브 — "무슨 문제에 부딫혔는가"
│   ├── README.md
│   └── TEMPLATE.md
│
└── reference/               외부 참조 — "사전 자료는 무엇이 있었는가"
```

## 규칙 참조

- **R1**: Documentation architecture — 이 구조 자체
- **R2**: Task logging — `tasklog/` 작성 방법
- **R3**: Finding archival — `findings/` 작성 방법
- **R4**: Decision records — `PROJECT-JOURNAL.md §4` 결정 기록
- 전체: https://github.com/tygwan/dev-standards/tree/main/rules
