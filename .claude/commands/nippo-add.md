---
title: "Nippo Add"
description: "日報に追記する"
---

# 日報に追記する

現在の日報ファイル（/tmp/nippo.$(date +%Y-%m-%d).md）に以下の内容を追記してください。

## 追記する内容: $ARGUMENTS

- タイムスタンプ
- ユーザーが指定した内容

!NIPPO_FILE="/tmp/nippo.$(date +%Y-%m-%d).md" && echo -e "\n## $(date '+%Y-%m-%d %H:%M:%S')\n$ARGUMENTS" >> "$NIPPO_FILE" && echo "✅ 日報に追記しました: $NIPPO_FILE"