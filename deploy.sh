#!/bin/bash

set -euo pipefail

cd "$(dirname "$0")"

commit_message="${1:-update}"

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "❌ 当前目录不是 Git 仓库"
  exit 1
fi

if [ -z "$(git status --porcelain)" ]; then
  echo "✅ 没有需要上传的变更"
  exit 0
fi

echo "📋 准备提交以下变更："
git status --short
echo ""
printf "是否继续提交并上传到 GitHub？[y/N] "
read -r answer

case "$answer" in
  y|Y|yes|YES)
    ;;
  *)
    echo "已取消，没有提交或上传任何内容。"
    exit 0
    ;;
esac

git add -A

if git diff --cached --quiet; then
  echo "✅ 没有可提交的变更"
  exit 0
fi

echo "📝 提交说明：$commit_message"
git commit -m "$commit_message"

echo "⬆️ 上传到 GitHub..."
git push

echo "✅ 上传完成"
