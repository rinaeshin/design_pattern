#!/usr/bin/env bash
set -euo pipefail

MODEL="${MODEL:-openai/gpt-4o-mini}"
SCOPE="${SCOPE:-.}"                      # 기본: 전체(README 포함)
ALLOW_DIRTY="${ALLOW_DIRTY:-0}"          # 1이면 작업트리 더러워도 진행
DRY_RUN="${DRY_RUN:-0}"                  # 1이면 opencode 실행 없이 규칙/검증만 출력

# 애니메이션 값/로직 보호 키워드(변경 감지)
ANIM_GREP_PATTERN="${ANIM_GREP_PATTERN:-Duration\\(|\\bduration\\s*:|Curves\\.|Interval\\(|Tween\\(|AnimationController|stageCount|autoPlay|repeat\\(|reverse\\(|forward\\(|vsync\\b}"

# 애니메이션 관련 파일 경로 보호(수정 금지)
PROTECTED_PATH_REGEX="${PROTECTED_PATH_REGEX:-^(lib/widgets/demo/|lib/widgets/.*circle|lib/.*animation)}"

# 문서/에셋 변경은 코드 변경 감시에서 제외
ALLOWED_NONCODE_REGEX="${ALLOWED_NONCODE_REGEX:-^(README\\.md|docs/|assets/|\\.github/)}"

TASK="${1:-}"
if [[ -z "${TASK}" ]]; then
  echo "Usage: ./opencode-safe.sh \"할 일\""
  echo "Env: MODEL=..., SCOPE=..., ALLOW_DIRTY=1, DRY_RUN=1"
  exit 1
fi

if ! command -v opencode >/dev/null 2>&1; then
  echo "ERROR: opencode 명령을 찾을 수 없습니다. (PATH 확인 필요)"
  exit 127
fi

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "ERROR: git 저장소가 아닙니다. 프로젝트 루트에서 실행하세요."
  exit 1
fi

if [[ "${ALLOW_DIRTY}" != "1" ]] && [[ -n "$(git status --porcelain)" ]]; then
  echo "ERROR: 작업트리가 깨끗하지 않습니다. 커밋/스태시 후 다시 실행하거나 ALLOW_DIRTY=1로 진행하세요."
  git status --porcelain
  exit 1
fi

BASE_REF="$(git rev-parse HEAD)"
echo "BASE: ${BASE_REF}"

LOCK_CTX=""
if [[ -f "ANIMATION_LOCK.md" ]]; then
  LOCK_CTX="$(cat ANIMATION_LOCK.md)"
fi

# 스코프 규칙
if [[ "${SCOPE}" == "." ]]; then
  SCOPE_RULE="수정은 프로젝트 루트에서 가능하나, 요구된 작업 범위만 최소 변경하라."
else
  SCOPE_RULE="수정은 ${SCOPE}/ 내부만 허용한다. 그 외 경로는 절대 수정하지 마라."
fi

# RULES는 단일
