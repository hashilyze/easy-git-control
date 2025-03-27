#!/bin/bash

REPO_PATHS=(
  "pull하려는 로컬 리포지토리의 경로1"
  "pull하려는 로컬 리포지토리의 경로2"
)

echo "🚀 Git 저장소 갱신 시작: $(date)"

for repo in "${REPO_PATHS[@]}"; do
  if [ -d "$repo/.git" ]; then
    echo "➡️  $repo 업데이트 중..."
    git -C "$repo" pull
    echo "✅ 완료: $repo"
  else
    echo "⚠️  경고: $repo 은(는) git 저장소가 아닙니다."
  fi
done

echo "🏁 완료: 모든 저장소 갱신 완료"

# 사용자가 키를 누를 때까지 대기
read -n 1 -s -r -p "🔒 아무 키나 누르면 창이 닫힙니다..."