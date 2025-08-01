#!/bin/bash

# 停止腳本遇到錯誤時立即退出
set -e

# 你的 GitHub Pages 網址 (修改成你的使用者名稱與 repo 名稱)
SITE_URL="https://sianglin0528.github.io/resume"

echo "-----------------------------------"
echo "🚀 開始部署網站到 GitHub Pages..."
echo "-----------------------------------"

# 檢查是否有變動
if git diff --quiet && git diff --cached --quiet; then
    echo "⚠️ 沒有檔案變動，無需部署。"
    exit 0
fi

# 加入所有變動
git add .

# 自動生成含時間的 commit 訊息
COMMIT_MSG="update site $(date '+%Y-%m-%d %H:%M:%S')"
git commit -m "$COMMIT_MSG"

# 推送到 main 分支
echo "📤 推送到 GitHub..."
git push origin main

echo "-----------------------------------"
echo "✅ 部署完成！等待 GitHub Pages 更新 (約 1~3 分鐘)"
echo "-----------------------------------"

# 自動打開網站 (Mac)
open $SIT
