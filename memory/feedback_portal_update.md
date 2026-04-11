---
name: Project journal portal update rule
description: The PROJECT-JOURNAL.md single portal must be kept current — every finding, decision, timeline event, and dependency change triggers an immediate update
type: feedback
---

`docs/PROJECT-JOURNAL.md` 는 프로젝트의 **단일 포털** 이다. 아래 이벤트마다 즉시 업데이트한다:

### 새 이슈/finding 발견 시
- §1 Quick Problem Index 테이블에 1행 추가 (ID, Date, Severity, Title, Status, Archive link)
- §2 Timeline 에 1줄 추가
- §3 Findings 상세 섹션에 1 소섹션 추가 (1 문단 요약 + 증거 링크)

### 구조적 결정 시 (R4)
- §1 Quick Problem Index 의 Decisions 테이블에 1행 추가 (D<next-id>)
- §4 Decisions 에 full record 작성 (Context / Decision / Rationale / Alternatives / Impact / Related)

### 새 Phase 완료 시
- §2 Timeline 에 1줄 추가 (날짜 + 설명 + 커밋 해시)
- §3 또는 §4 에 영향 사항 반영

### 외부 dependency 변화 시
- §5 External Dependencies 섹션 업데이트
- 버전 변경, 상태 변화, 새 의존성 추가 모두 포함

### Open Question 해결 시
- §6 Open Questions 에서 삭제
- §4 Decisions 에 Decision Record 로 이동 (새 D<id> 부여)

**Why**: 사용자의 원칙은 "단일 문서 하나만 읽으면 프로젝트 스토리 전체가 파악되어야 함". 이것이 달성되지 않으면 포털의 가치가 사라진다.

**How to apply**:
- **시점**: 위 이벤트 발생 즉시, 코드/아카이브 작성과 동일한 세션/커밋
- **형식**: 기존 섹션의 형식을 유지 (새 행은 기존 테이블과 동일 컬럼, 새 섹션은 기존 소섹션 헤더 스타일)
- **커밋**: 포털 업데이트는 이벤트를 일으킨 변경 (코드/finding/task) 과 **동일한 커밋** 에 포함
- **검증**: 매 커밋 후 PROJECT-JOURNAL.md 의 §1 테이블을 한 번 스캔해서 최신 상태인지 확인

**Anti-pattern**:
- "나중에 한 번에 정리하지 뭐" — 쌓이면 못 한다. 이벤트 즉시 업데이트.
- 부분 업데이트 — §1 에만 추가하고 §2/§3 는 빠뜨리면 포털의 일관성이 깨짐. 5 개 섹션 모두 체크.
