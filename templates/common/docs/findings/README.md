# Findings Archive

데이터 이슈, 설계 문제, 품질 이슈 등 발견된 모든 사항을 이 디렉터리에
보관합니다. 상세: dev-standards R3 (Finding Archival).

## 기록 규칙 (요약)

각 이슈는 아래 구조로 저장됩니다:

```
docs/findings/YYYY-MM-DD-<severity>-<slug>/
├── README.md        # 5 섹션: Finding, Evidence, Analysis, Resolution, References
├── audit.<ext>      # 재현 가능한 진단 스크립트
├── data/            # CSV / JSON 증거 파일 (집계/샘플)
└── figures/         # 시각화 (최소 1개)
```

## Index

| Date | ID | Severity | Title | Status |
|------|----|:-:|-------|--------|
| — | — | — | (no findings yet) | — |

### Severity 정의 (R7)

- 🔴 **CRITICAL**: downstream phase 가 실행 불가 또는 완전 잘못된 결과
- 🟠 **MAJOR**: 부분적으로 틀리지만 기능은 유지. 수정 권장
- 🟡 **MINOR**: 표시/UX 문제, 희귀 엣지 케이스, 알려진 한계

### Status 정의 (R7)

- 🔄 **Open**: 조사 중 또는 결정 대기
- 🛠 **Fixing**: 해결 진행 중
- ✅ **Resolved**: 해결 완료 (resolution_commit 기재 필수)
- 📋 **Deferred**: 의도적으로 후속 Phase 로 연기
- 🔭 **Accepted**: 원천 한계로 수용
