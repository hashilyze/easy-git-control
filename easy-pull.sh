#!/bin/bash

# 루트 디렉토리 
# 상대경로 사용 시 주석 처리
ROOT_PATH="루트 디렉토리"

# 로컬 리포지토리 리스트: ("로컬폴더")
REPO_PATHS=(  
  "pull하려는 로컬 리포지토리의 경로1"
  "pull하려는 로컬 리포지토리의 경로2"
)

echo "🚀 Git 저장소 갱신 시작: $(date)"
echo "📂 루트 경로: $ROOT_PATH"

for path in "${REPO_PATHS[@]}"; do
  # 루트 경로 적용 여부
  if [ -n "$ROOT_PATH" ]; then
    repo="$ROOT_PATH/$path"
  else
    repo="$path"
  fi

  if [ -d "$repo/.git" ]; then
    echo "➡️  $path 업데이트 중..."
    git -C "$repo" pull
    echo "✅ 완료: $path"
  else
    echo "⚠️  경고: $path 은(는) git 저장소가 아닙니다."
  fi
done

echo "🏁 완료: 모든 저장소 갱신 완료"

# 창 닫힘 방지
read -n 1 -s -r -p "🔒 아무 키나 누르면 창이 닫힙니다..."
