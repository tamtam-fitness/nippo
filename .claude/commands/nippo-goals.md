---
title: "Nippo Goals"
description: "日報の目標を設定・管理する"
---

# 日報の目標を設定・管理する

日報用の目標ファイル（/tmp/nippo-goals.txt）に目標を設定します。

## 設定する目標: $ARGUMENTS

- 月次目標
- 週次目標
- プロジェクト目標など

!GOALS_FILE="/tmp/nippo-goals.txt" && echo "## $(date '+%Y-%m-%d %H:%M:%S') - 目標設定" > "$GOALS_FILE" && echo "$ARGUMENTS" >> "$GOALS_FILE" && echo "✅ 目標を設定しました: $GOALS_FILE" && echo "" && echo "📋 現在の目標:" && cat "$GOALS_FILE"