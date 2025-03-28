#!/bin/bash

# 루트 디렉토리 
# 상대경로 사용 시 주석 처리
ROOT_PATH="/c/SSAFY"

# 저장소 리스트: ("URL" "로컬폴더") 순서쌍
REPOSITORIES=(
  "clone할 URL1" "로컬 폴더의 이름1"
  "clone할 URL2" "로컬 폴더의 이름2"
)

echo "🚀 Git 저장소 Clone 시작: $(date)"
echo "📂 루트 경로: $ROOT_PATH"

# 배열을 2개씩 순회 (URL, 디렉토리명)
for ((i=0; i<${#REPOSITORIES[@]}; i+=2)); do
  REPO_URL="${REPOSITORIES[i]}"
  DIR_NAME="${REPOSITORIES[i+1]}"

  # 루트 경로와 결합
  if [ -n "$ROOT_PATH" ]; then
    TARGET_DIR="$ROOT_PATH/$DIR_NAME"
  else
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    TARGET_DIR="$SCRIPT_DIR/$DIR_NAME"
  fi

  if [ -d "$TARGET_DIR/.git" ]; then
    echo "✅ 이미 존재: $TARGET_DIR → clone 생략"
  else
    echo "➡️  Cloning $REPO_URL → $TARGET_DIR"
    git clone "$REPO_URL" "$TARGET_DIR"
  fi
done

echo "🏁 모든 저장소 clone 완료"

# 창 닫힘 방지
read -n 1 -s -r -p "🔒 아무 키나 누르면 닫힙니다..."
