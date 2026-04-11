---
name: Task logging rule
description: Every completed task must be recorded with a 5-section log (language/content, problem, analysis, solution, result) in docs/tasklog/
type: feedback
---

매 task 완료 시 아래 5개 섹션으로 작업 로그를 기록한다:

1. **언어/내용**: 어떤 언어로 어떤 내용(파일명, 기능)을 작성했는지
2. **문제**: 작업 중 발생한 문제 (없으면 "없음"으로 명시)
3. **분석**: 문제의 근본 원인
4. **해결방안**: 제안/적용한 해결책
5. **결과**: 해결 후 검증 결과 (테스트 통과, 커밋 해시 등)

**Why**: 사용자가 각 작업의 맥락·의사결정·재현 방법을 한눈에 파악하기 위함. 3개월 후 자기 자신이 돌아와서도 프로젝트 상황을 복원할 수 있어야 함.

**How to apply**:
- 위치: `docs/tasklog/` 디렉터리에 Phase별 또는 task별 파일로 저장 (예: `phase-1a-ingest.md`)
- 시점: 각 task 를 completed 로 마킹하기 직전, 그리고 같은 커밋에 포함
- 포맷: 5개 섹션 헤더를 반드시 포함. 문제가 없었을 경우 "없음" 으로 명시 (생략 금지)
- 대화 응답에서도 task 완료 시 이 5개 섹션을 요약 보고
- 코드 변경과 **동일한 커밋**에 task log 포함
