#!/usr/bin/env bash
set -euo pipefail

MODEL="${MODEL:-openai/gpt-4o-mini}"
SCOPE="${SCOPE:-.}"                      # 기본: 전체(README 포함)
ALLOW_DIRTY="${ALLOW_DIRTY:-0}"          # 1이면 작업트리 더러워도 진행
DRY_RUN="${DRY_RUN:-0}"                  # 1이면 opencode 실행 없이 규칙/검증만 출력

ANIM_GREP_PATTERN="${ANIM_GREP_PATTERN:-Duration\\(|\\bduration\\s*:|Curves\\.|Interval\\(|Tween\\(|AnimationController|stageCount|autoPlay|repeat\\(|reverse\\(|forward\\(|vsync\\b}"
PROTECTED_PATH_REGEX="${PROTECTED_PATH_REGEX:-^(lib/widgets/demo/|lib/widgets/.*circle|lib/.*animation)}"
ALLOWED_NONCODE_REGEX="${ALLOWED_NONCODE_REGEX:-^(README\\.md|docs/|assets/|\\.github/)}"

TASK="${1:-}"
if [[ -z "${TASK}" ]]; then
  echo "Usage:"
  echo "  MODEL=openai/gpt-4o-mini SCOPE=. ./${0##*/} \"할 일\""
  echo ""
  echo "Env:"
  echo "  SCOPE=lib           (수정 허용 범위)"
  echo "  ALLOW_DIRTY=1       (git status 더러워도 진행)"
  echo "  DRY_RUN=1           (opencode 실행 없이 검증만)"
  exit 1
fi

if ! command -v opencode >/dev/null 2>&1; then
  echo "ERROR: opencode 명령을 찾을 수 없습니다. (PATH 확인 필요)"
  exit 127
fi

# Git 저장소 확인
if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "ERROR: git 저장소가 아닙니다. 프로젝트 루트에서 실행하세요."
  exit 1
fi

# 작업트리 더러움 검사
if [[ "${ALLOW_DIRTY}" != "1" ]]; then
  if [[ -n "$(git status --porcelain)" ]]; then
    echo "ERROR: 작업트리가 깨끗하지 않습니다."
    echo "  - 커밋/스태시 후 다시 실행하거나, ALLOW_DIRTY=1로 진행하세요."
    git status --porcelain
    exit 1
  fi
fi

BASE_REF="$(git rev-parse HEAD)"
echo "BASE: ${BASE_REF}"

# 잠금 문서(있으면 강하게 주입)
LOCK_CTX=""
if [[ -f "ANIMATION_LOCK.md" ]]; then
  LOCK_CTX="$(cat ANIMATION_LOCK.md)"
fi

# 스코프 규칙(경로 제한)
SCOPE_RULE="수정은 ${SCOPE}/ 내부만 허용한다. 그 외 경로는 절대 수정하지 마라."
if [[ "${SCOPE}" == "." ]]; then
  SCOPE_RULE="수정은 프로젝트 루트에서 가능하나, 코드 변경은 최소화하고 요구된 작업 범위만 수정하라."
fi

# 하드 룰: 애니메이션 파라미터/로직 불변
RULES=$(cat <<EOF
[HARD RULES - VIOLATION = FAIL]
1) 애니메이션 관련 값/로직은 절대 변경하지 마라.
   - Duration/Curve/Tween/Interval/AnimationController duration/reverseDuration
   - stageCount/autoPlay/period/interval 등 데모 단계 제어 값
   - forward/reverse/repeat 트리거 로직
2) 애니메이션 관련 파일 경로는 절대 수정하지 마라.
   - 정규식: ${PROTECTED_PATH_REGEX}
3) ${SCOPE_RULE}
4) 요구된 작업과 무관한 리팩터링/포맷팅/정렬 금지.
5) 변경 후: 수정 파일 목록 + 변경 요약 + "애니메이션 불변" 확인 문장을 포함하라.
EOF
)

PROMPT=$(cat <<EOF
당신은 Flutter 프로젝트 유지보수자다.

${RULES}

[LOCK CONTEXT]
${LOCK_CTX}

[TASK]
${TASK}

[OUTPUT FORMAT]
- Changed files:
- Summary:
- Animation untouched: YES/NO (YES만 허용)
EOF
)

echo "MODEL=${MODEL}"
echo "SCOPE=${SCOPE}"
echo "----"

if [[ "${DRY_RUN}" == "1" ]]; then
  echo "[DRY_RUN] opencode 실행 생략"
else
  opencode run -m "${MODEL}" "${PROMPT}"
fi

# ====== 변경 검증 ======

# 1) 스코프 밖 수정 금지
if [[ "${SCOPE}" != "." ]]; then
  OUT_OF_SCOPE="$(git diff --name-only "${BASE_REF}" -- | grep -v "^${SCOPE}/" || true)"
  if [[ -n "${OUT_OF_SCOPE}" ]]; then
    echo "ERROR: SCOPE 밖 파일이 수정되었습니다:"
    echo "${OUT_OF_SCOPE}"
    exit 2
  fi
fi

# 2) 보호 경로 수정 금지
PROTECTED_TOUCHED="$(git diff --name-only "${BASE_REF}" -- | egrep "${PROTECTED_PATH_REGEX}" || true)"
if [[ -n "${PROTECTED_TOUCHED}" ]]; then
  echo "ERROR: 보호된 애니메이션 경로가 수정되었습니다:"
  echo "${PROTECTED_TOUCHED}"
  exit 3
fi

# 3) 애니메이션 키워드 변경 감지(README/docs만 바뀐 경우는 제외)
CHANGED_FILES="$(git diff --name-only "${BASE_REF}" --)"
CODE_CHANGED="$(echo "${CHANGED_FILES}" | egrep -v "${ALLOWED_NONCODE_REGEX}" || true)"

if [[ -n "${CODE_CHANGED}" ]]; then
  # 코드 변경이 있을 때만 키워드 감시를 강하게 적용
  if git diff -U0 "${BASE_REF}" -- | egrep -n "${ANIM_GREP_PATTERN}" >/dev/null 2>&1; then
    echo "ERROR: 애니메이션 관련 키워드/값 변경이 감지되었습니다."
    echo "---- Matches ----"
    git diff -U0 "${BASE_REF}" -- | egrep -n "${ANIM_GREP_PATTERN}" || true
    exit 4
  fi
fi

echo "OK: 규칙 위반 없이 완료"
