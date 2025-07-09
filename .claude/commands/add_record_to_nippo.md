---
title: "Add Record to Nippo"
description: "日々のタスクを日報に記録します"
---

# Add Record to Nippo

ユーザーが指定したタスクを日報に追加します。

## 実行内容

!test -f nippo_draft.txt || echo "# 日報ドラフト" > nippo_draft.txt
!echo "" >> nippo_draft.txt
!echo "## $(date '+%Y-%m-%d %H:%M:%S')" >> nippo_draft.txt
!echo "$ARGUMENTS" >> nippo_draft.txt

日報のドラフトファイル（nippo_draft.txt）に以下の内容を追加しました：
- タイムスタンプ
- ユーザーが指定したタスク内容

ファイルが存在しない場合は新規作成されます。