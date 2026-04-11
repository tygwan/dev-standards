---
name: Finding archive rule
description: Every data or design issue discovered must be immediately archived to docs/findings/YYYY-MM-DD-ID-slug/ with audit script, CSV evidence, matplotlib figures, a 5-section README, portal update, and a single atomic commit
type: feedback
---

데이터 이슈 또는 분석 과정의 발견 사항이 나올 때마다 아래 6단계를 **즉시** 수행한다:

1. **보관 (preserve)**: 재현 가능한 audit script + 증거 데이터(CSV/JSON)를 `docs/findings/YYYY-MM-DD-<severity>-<slug>/` 폴더에 저장
2. **정리 (organize)**: 하위 구조 `{README.md, audit.<ext>, data/, figures/}` 로 일관되게 배치
3. **시각화 (visualize)**: matplotlib 또는 동등 도구로 최소 1개 이상의 차트 생성 (`figures/NN_name.png`). 숫자 표가 아닌 그림으로 직관적 이해 가능하게
4. **기록 (record)**: `README.md` 에 5-section 포맷으로 작성 — Finding / Evidence / Analysis / Resolution / References
5. **포털 업데이트 (portal update)**: `docs/PROJECT-JOURNAL.md` 에 아래를 업데이트
   - §1 Quick Problem Index 테이블에 1행 추가
   - §2 Timeline 에 1줄 추가
   - §3 Findings 상세 섹션에 1 소섹션 추가
   - 필요 시 §4 Decisions, §6 Open Questions 업데이트
6. **커밋 (commit)**: 위 산출물 전체를 하나의 커밋으로 git 에 기록 + remote 푸시

**Why**: 사용자는 "나중에 어떤 문제에 부딫혔었는지, 어떻게 해결했는지에 대한 근거" 로 사용할 계획. 이 아카이브는 technical decision journal 역할을 함. 감사, 회고, 이해관계자 설명 시 정량적 근거로 활용.

**How to apply**:
- **언제**: 데이터 품질 감사 중 이슈 발견 즉시 / 예상과 다른 숫자 발견 시 / 도메인 지식과 충돌 발견 시
- **어디서**: 프로젝트 내 `docs/findings/` 디렉터리. 날짜 + severity + slug 로 명명
- **무엇을**:
  - `README.md` 5 섹션 (Finding, Evidence, Analysis, Resolution, References)
  - `audit.<ext>` 재현 가능한 진단 스크립트
  - `data/*.csv` 핵심 증거 테이블
  - `figures/*.png` 최소 1개 차트
- **항상 커밋**: "찾았는데 기록 안 함" 금지. 발견과 기록은 한 번의 호흡으로 처리
- **인덱스 유지**: `docs/findings/README.md` 에 모든 issue 목록을 날짜순으로 유지

**Exceptions**:
- Trivial 한 typo, 1분 내 수정 가능한 건은 archive 대상이 아님
- 이미 테스트가 실패하여 바로 수정되는 case 는 commit message 에 문제+해결을 함께 기록하면 충분
- archive 대상: 수용/보류/재설계 판단이 필요한 semantic 이슈, 다운스트림 영향이 있는 data quality 이슈, 외부 원천 의존 이슈
