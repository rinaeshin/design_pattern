#!/usr/bin/env bash
set -euo pipefail

PHASE1="${PHASE1:?PHASE1 commit hash required}"
PHASE2="${PHASE2:?PHASE2 commit hash required}"
BRANCH="${BRANCH:-release/design-pattern}"
MODEL="${MODEL:-openai/gpt-4o}"

# 애니메이션 보호(경로/키워드)
PROTECTED_PATH_REGEX="${PROTECTED_PATH_REGEX:-^(lib/widgets/demo/|lib/widgets/.*circle|lib/.*animation)}"
ANIM_GREP_PATTERN="${ANIM_GREP_PATTERN:-Duration\\(|\\bduration\\s*:|Curves\\.|Interval\\(|Tween\\(|AnimationController|stageCount|autoPlay|repeat\\(|reverse\\(|forward\\(|vsync\\b}"

# docs-only 허용 범위
ALLOW_REGEX="${ALLOW_REGEX:-^(README\\.md|docs/|assets/|\\.github/)}"

require_cmd() { command -v "$1" >/dev/null 2>&1 || { echo "ERROR: missing command: $1"; exit 127; }; }
require_cmd git
require_cmd opencode

git rev-parse --is-inside-work-tree >/dev/null 2>&1 || { echo "ERROR: not a git repo"; exit 1; }

# 커밋 해시 유효성(짧은 해시도 허용)
git rev-parse --verify "${PHASE1}^{commit}" >/dev/null 2>&1 || { echo "ERROR: PHASE1 not a commit: ${PHASE1}"; exit 1; }
git rev-parse --verify "${PHASE2}^{commit}" >/dev/null 2>&1 || { echo "ERROR: PHASE2 not a commit: ${PHASE2}"; exit 1; }

# 브랜치로 이동/생성
CURRENT_BRANCH="$(git rev-parse --abbrev-ref HEAD)"
if [[ "${CURRENT_BRANCH}" != "${BRANCH}" ]]; then
  if git show-ref --verify --quiet "refs/heads/${BRANCH}"; then
    git checkout "${BRANCH}"
  else
    git checkout -b "${BRANCH}"
  fi
fi

echo "BRANCH: ${BRANCH}"
echo "PHASE1: ${PHASE1}"
echo "PHASE2: ${PHASE2}"
echo "BASE:   $(git rev-parse HEAD)"
echo "---- git status (before) ----"
git status --porcelain || true

# 선제 차단: 이미 애니메이션 파일/키워드가 touched면 자동 원복 + 실패
touched_protected_paths="$(git diff --name-only -- | egrep "${PROTECTED_PATH_REGEX}" || true)"
if [[ -n "${touched_protected_paths}" ]]; then
  echo "ERROR: protected animation paths were modified. Auto-reset and fail."
  echo "${touched_protected_paths}"
  git restore --staged .
  git restore .
  exit 20
fi

if git diff -U0 -- | egrep -n "${ANIM_GREP_PATTERN}" >/dev/null 2>&1; then
  echo "ERROR: animation keyword/value changes detected. Auto-reset and fail."
  git diff -U0 -- | egrep -n "${ANIM_GREP_PATTERN}" || true
  git restore --staged .
  git restore .
  exit 21
fi

LOCK_CTX=""
if [[ -f "ANIMATION_LOCK.md" ]]; then
  LOCK_CTX="$(cat ANIMATION_LOCK.md)"
fi

PROMPT=$(cat <<EOF
당신은 Flutter 프로젝트 메인터이너다.

[BASELINE LOCK]
- 애니메이션 기준 커밋(절대 변경 금지):
  - Phase 1: ${PHASE1}
  - Phase 2: ${PHASE2}
- Phase 1/2에서 확정된 애니메이션 로직/파라미터/구조는 동결(baseline)이다.

[BRANCH]
- 작업 브랜치: ${BRANCH}
- 이 브랜치에서만 commit/push 하라.

[HARD RULES - VIOLATION = RESET + FAIL]
1) 애니메이션 관련 파일 경로는 절대 수정하지 마라.
   - 보호 경로 정규식: ${PROTECTED_PATH_REGEX}
2) 애니메이션 관련 키워드/값은 절대 변경하지 마라.
   - 탐지 키워드 정규식: ${ANIM_GREP_PATTERN}
3) 허용 변경 범위는 docs-only 이다:
   - 허용 정규식: ${ALLOW_REGEX}
4) 위반 감지 시 즉시:
   - git restore --staged . ; git restore .
   - 위반 파일/라인 출력 후 실패 종료

[LOCK CONTEXT]
${LOCK_CTX}

[TASK]
- README.md를 다음을 포함하도록 개선하라:
  1) Flutter 프로젝트 구조 요약(예: tree/find 출력 기반)
  2) 시연 URL: https://rinaeshin.github.io/design_pattern/
  3) QR 코드 이미지: docs/qr.png (가능하면 생성. 생성이 어렵다면 생성 방법을 README에 안내)
  4) 실행 방법(flutter pub get / flutter run / build web 등)
- lib/ 등 코드 파일은 절대 변경하지 마라.

[EXECUTION STEPS - 반드시 지켜라]
1) git status / git diff로 현재 변경을 확인
2) 보호 경로/키워드 위반 여부 검사(위반 시 즉시 원복+실패)
3) 허용 파일만 git add (정규식: ${ALLOW_REGEX})
4) 커밋 메시지(그대로 사용):
   docs: update README and demo link (post-animation baseline)
5) git push origin ${BRANCH}

[OUTPUT]
- Phase 1/2 해시 재확인
- 커밋에 포함된 파일 목록
- push 결과 요약
EOF
)

opencode run -m "${MODEL}" "${PROMPT}"

# ====== 사후 강제 검증(로컬) ======

# (A) 보호 경로 touched 시 자동 원복 + 실패
touched_protected_paths="$(git diff --name-only HEAD -- | egrep "${PROTECTED_PATH_REGEX}" || true)"
if [[ -n "${touched_protected_paths}" ]]; then
  echo "ERROR: protected animation paths modified after opencode. Auto-reset and fail."
  echo "${touched_protected_paths}"
  git restore --staged .
  git restore .
  exit 30
fi

# (B) 키워드 변경 감지 시 자동 원복 + 실패
if git diff -U0 HEAD -- | egrep -n "${ANIM_GREP_PATTERN}" >/dev/null 2>&1; then
  echo "ERROR: animation keyword/value changes detected after opencode. Auto-reset and fail."
  git diff -U0 HEAD -- | egrep -n "${ANIM_GREP_PATTERN}" || true
  git restore --staged .
  git restore .
  exit 31
fi

# (C) docs-only 외 파일 변경 시 자동 원복 + 실패
changed_not_allowed="$(git diff --name-only HEAD -- | egrep -v "${ALLOW_REGEX}" || true)"
if [[ -n "${changed_not_allowed}" ]]; then
  echo "ERROR: non-doc files were changed. Auto-reset and fail."
  echo "${changed_not_allowed}"
  git restore --staged .
  git restore .
  exit 32
fi

echo "OK: phase baseline preserved, docs-only enforced."
