# Master Development Framework

이 환경은 3개 프레임워크의 베스트 프랙티스를 통합한 개발 환경입니다:
- **Oh My OpenCode** (28.6k stars) - 멀티모델 오케스트레이션
- **SuperClaude** (20.7k stars) - 구조화된 워크플로우 커맨드
- **Superpowers** (45.5k stars) - TDD 강제 & 체계적 개발

---

## 자동 활성화 규칙

### 코드 작성 시 (MANDATORY)
**트리거**: 새 기능 구현, 버그 수정, 리팩토링 요청

```
ALWAYS ACTIVATE:
1. test-driven-development 스킬
   - 테스트 먼저 작성 → 실패 확인 → 최소 구현 → 통과 확인
   - 테스트 없이 코드 작성하면 삭제하고 다시 시작

2. verification-before-completion 스킬
   - "완료됐어요" 주장 전 반드시 테스트 실행
   - 증거 없는 완료 주장 금지
```

### 버그/에러 발생 시 (MANDATORY)
**트리거**: 테스트 실패, 에러 발생, 예상치 못한 동작

```
ALWAYS ACTIVATE:
1. systematic-debugging 스킬
   - Phase 1: 근본 원인 조사 (수정 제안 전 필수)
   - Phase 2: 패턴 분석
   - Phase 3: 가설 및 테스트
   - Phase 4: 구현

2. 3회 이상 수정 실패 시 → Oracle 에이전트 상담
```

### 새 기능 개발 시작 시
**트리거**: "새 기능", "구현해줘", "만들어줘"

```
ACTIVATE IN ORDER:
1. /brainstorm 커맨드 - 요구사항 정제
2. /design 커맨드 - 시스템 설계
3. using-git-worktrees 스킬 - 격리된 작업 환경 생성
4. test-driven-development 스킬 - TDD로 구현
```

### 리서치/조사 요청 시
**트리거**: "조사해줘", "찾아봐", "비교해줘", "분석해줘"

```
ACTIVATE:
1. /research 커맨드 - 딥 웹 리서치
2. 병렬 백그라운드 에이전트:
   - explore: 코드베이스 탐색
   - librarian: 공식 문서 조회
```

### 프로젝트 관리 요청 시
**트리거**: "계획", "일정", "태스크", "스프린트"

```
ACTIVATE:
1. /pm 커맨드 - 프로젝트 관리 워크플로우
2. Todo 시스템 - 작업 추적
```

### 테스트 관련 요청 시
**트리거**: "테스트", "커버리지", "검증"

```
ACTIVATE:
1. /test 커맨드 - 테스트 생성/실행
2. test-driven-development 스킬
```

---

## 사용 가능한 에이전트

| 에이전트 | 모델 | 용도 | 활성화 조건 |
|---------|------|------|-------------|
| **Sisyphus** | Claude Opus 4.5 | 메인 오케스트레이터 | 항상 |
| **Oracle** | Claude Opus 4.5 | 아키텍처, 디버깅 상담 | 복잡한 문제, 3회+ 실패 |
| **Explore** | Claude Haiku 4.5 | 코드베이스 탐색 | 검색/조사 시 |
| **Librarian** | GLM 4.7 | 공식 문서 조회 | 외부 라이브러리 관련 |
| **Frontend UI/UX** | Gemini 3 Pro | 프론트엔드 전문 | UI 작업 시 |

---

## 사용 가능한 커맨드

| 커맨드 | 용도 | 자동 트리거 |
|--------|------|-------------|
| `/research` | 딥 웹 리서치 | "조사", "찾아", "비교" |
| `/brainstorm` | 아이디어 도출 | "아이디어", "어떻게" |
| `/design` | 시스템 설계 | "설계", "아키텍처" |
| `/pm` | 프로젝트 관리 | "계획", "일정" |
| `/test` | 테스트 워크플로우 | "테스트", "검증" |

---

## 사용 가능한 스킬

| 스킬 | 용도 | 자동 트리거 |
|------|------|-------------|
| `test-driven-development` | TDD 강제 | 모든 코드 작성 |
| `systematic-debugging` | 체계적 디버깅 | 버그/에러 발생 |
| `using-git-worktrees` | 격리된 작업 환경 | 새 기능 개발 |
| `verification-before-completion` | 완료 전 검증 | 작업 완료 시 |
| `playwright` | 브라우저 자동화 | 웹 테스트/스크래핑 |
| `frontend-ui-ux` | UI/UX 전문 | 프론트엔드 작업 |
| `git-master` | Git 작업 | 커밋/리베이스/히스토리 |

---

## 워크플로우 매직 키워드

| 키워드 | 효과 |
|--------|------|
| `ultrawork` / `ulw` | 모든 기능 최대 활성화, 완료까지 지속 |
| `ultrathink` | Extended thinking 활성화 (32k 토큰) |

---

## 핵심 원칙 (IRON LAWS)

### 1. TDD는 선택이 아닌 필수
```
NO PRODUCTION CODE WITHOUT A FAILING TEST FIRST
테스트 없이 코드 작성 → 삭제하고 다시 시작
```

### 2. 근본 원인 먼저
```
NO FIXES WITHOUT ROOT CAUSE INVESTIGATION
수정 제안 전 반드시 원인 분석
```

### 3. 증거 기반 완료
```
NO COMPLETION CLAIMS WITHOUT VERIFICATION EVIDENCE
"됐어요" 주장 전 테스트 실행 결과 제시
```

### 4. 위임 우선
```
DELEGATE WHEN SPECIALIST AVAILABLE
혼자 고민하지 말고 전문 에이전트에게 위임
```

---

## Git Worktree 설정

프로젝트 로컬 worktree 디렉토리: `.worktrees/`
반드시 .gitignore에 추가되어야 함

---

## 프로젝트별 오버라이드

프로젝트 루트에 `AGENTS.md` 파일이 있으면 해당 설정이 우선 적용됨
