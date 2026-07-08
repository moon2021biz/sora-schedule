#!/bin/bash
# ============================================================
# SORA 公開予定表 — GitHub push → Cloudflare Pages 自動デプロイ
# 使い方: bash push.sh "更新メモ"
# ============================================================
set -e
REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$REPO_DIR"
MSG="${1:-update: $(date '+%Y-%m-%d %H:%M')}"

echo ""
echo "📁 対象: $REPO_DIR"
echo "📝 メモ: $MSG"
echo ""

if [ -n "$(git status --porcelain)" ]; then
  git add .
  git commit -m "$MSG"
  git push origin main
  echo "✅ GitHub push 完了（Cloudflare Pages が自動デプロイします・反映まで1〜2分）"
else
  echo "（変更なし）"
fi

echo ""
echo "🌐 URL: https://sora-schedule.pages.dev/"
echo ""
