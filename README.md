# dev-standards

> 활성 프로젝트의 **문서 작성, 이슈 기록, 논의, 결정, 해결 과정** 에 대한
> 일관된 규칙 모음. 언어/도메인/플랫폼 중립.

**현재 버전**: `0.1.0`
**라이선스**: 개인 저장소, 필요 시 추후 라이선스 결정

---

## 이 저장소는 무엇인가

개발 프로젝트를 진행할 때 다음 질문에 일관되게 답하고 싶어서 만들었습니다:

- "이 프로젝트에서 **어떤 문제에 부딫혔나?**"
- "이 결정은 **왜 내려졌나?**"
- "이 Phase 에서 **무엇을 어떻게 했나?**"
- "외부 의존성의 상태는?"
- "아직 해결 안 된 건 무엇인가?"

프로젝트마다 매번 다른 포맷으로 기록하면 3개월 후 자기 자신도 읽기 어렵습니다.
**하나의 표준을 정하고, 모든 프로젝트에서 동일하게 적용** 하자는 것이 이 저장소의 목적입니다.

## 누가 읽을 것인가

- **본인** — 미래의 자기 자신이 프로젝트 상황을 복원 가능
- **협력자 / 팀원** — 신규 참여자가 프로젝트 진행 상황을 빠르게 파악
- **AI 도구 (Claude Code 등)** — LLM 이 일관된 규칙을 바탕으로 작업 지원
- **이해관계자** — 의사결정 이력과 근거를 감사

## 구조

```
dev-standards/
├── README.md                  # 이 문서
├── STANDARDS.md               # 9 규칙의 총괄 개요 + 철학
├── CHANGELOG.md               # 버전 이력
│
├── rules/                     # 각 규칙의 상세 문서
│   ├── R1-documentation-architecture.md
│   ├── R2-task-logging.md
│   ├── R3-finding-archival.md
│   ├── R4-decision-records.md
│   ├── R5-git-workflow.md
│   ├── R6-external-dependency-management.md
│   ├── R7-issue-classification.md
│   ├── R8-human-ai-collaboration.md
│   └── R9-provenance-reproducibility.md
│
├── templates/                 # 새 프로젝트에 복사할 skeleton
│   └── common/                # 언어 무관 파일들
│       ├── CLAUDE.md
│       ├── README.md
│       ├── .gitignore
│       └── docs/
│           ├── README.md
│           ├── PROJECT-JOURNAL.md
│           ├── plan/.gitkeep
│           ├── analysis/.gitkeep
│           ├── tasklog/
│           │   ├── README.md
│           │   └── TEMPLATE.md
│           ├── findings/
│           │   ├── README.md
│           │   └── TEMPLATE.md
│           └── reference/.gitkeep
│
├── memory/                    # Claude Code 메모리 규칙 파일
│   ├── MEMORY.md
│   ├── feedback_task_logging.md
│   ├── feedback_finding_archive.md
│   └── feedback_portal_update.md
│
├── scripts/                   # 자동화 스크립트
│   └── init-project.sh        # 새 프로젝트 bootstrap
│
└── examples/                  # 이 규칙을 따르는 실제 프로젝트
    └── first-ontology-project.md
```

## 사용 방법

### 새 프로젝트를 이 규칙으로 시작하기

```bash
# 1. dev-standards 최신 가져오기
cd ~/dev/dev-standards && git pull

# 2. 새 프로젝트 생성 + bootstrap
bash ~/dev/dev-standards/scripts/init-project.sh ~/dev/my-new-project my-new-project

# 3. 새 프로젝트로 이동
cd ~/dev/my-new-project

# 4. git remote 추가 (원하는 경우)
git remote add origin git@github.com:<you>/my-new-project.git
git push -u origin main
```

이 과정에서 다음이 자동 수행됩니다:
- `docs/{plan,analysis,tasklog,findings,reference}/` 구조 생성
- `PROJECT-JOURNAL.md` 템플릿 복사
- `CLAUDE.md` 에 `dev-standards@<version>` 참조 기록
- Claude Code 메모리 규칙 파일 설치 (`~/.claude/projects/.../memory/`)

### 기존 프로젝트에 규칙 적용하기 (retrofit)

기존 프로젝트는 수동 복사로 시작:

1. `dev-standards/templates/common/docs/` 를 프로젝트 `docs/` 로 복사
2. 누락된 파일 (PROJECT-JOURNAL, finding TEMPLATE, tasklog TEMPLATE) 확인
3. `dev-standards/memory/*.md` 를 해당 Claude Code 메모리 디렉터리로 복사
4. 프로젝트 루트에 `CLAUDE.md` 추가하여 `dev-standards` 버전 명시
5. 과거 이슈를 findings/ 에 소급 기록 (선택)

## 버전 업데이트 시 동기화

`dev-standards` 가 업데이트되면 기존 프로젝트는 자동으로 갱신되지 않습니다.
각 프로젝트의 `CLAUDE.md` 에 사용 중인 버전이 명시되어 있으므로,
필요 시 **수동 동기화** 하세요.

```bash
# 어떤 규칙이 바뀌었는지 확인
cd ~/dev/dev-standards && git log --oneline v0.1.0..HEAD

# 프로젝트에 적용 (선별적으로)
cp memory/feedback_new_rule.md ~/.claude/projects/<project-slug>/memory/
```

## 라이센스와 기여

이 저장소는 현재 tygwan 개인 표준입니다. 다른 사람들도 참고 가능하지만,
자기 환경에 맞게 fork 해서 사용하는 것을 권장합니다.

규칙에 대한 개선 제안은 PR 이나 Issue 로 환영합니다.

## 관련 문서

- [`STANDARDS.md`](STANDARDS.md) — 9 규칙의 총괄 개요 + 철학
- [`rules/`](rules/) — 각 규칙의 상세
- [`examples/first-ontology-project.md`](examples/first-ontology-project.md) — 이 규칙의 첫 실제 적용 사례
