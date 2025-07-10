---
title: "Nippo Show"
description: "日報内容を確認する"
---

# 日報内容を確認する

現在の日報ファイル（/tmp/nippo.$(date +%Y-%m-%d).md）の内容を表示し、編集状況を確認できます。

## 実行内容:

1. **現在の日報ファイルの表示**
   - 本日の日報ファイルが存在する場合、全内容を表示
   - ファイルサイズと最終更新時刻も表示

2. **編集状況の要約**
   - 作業ログのエントリ数
   - 各セクションの記入状況
   - 未記入セクションの警告

3. **過去の日報一覧**
   - /tmp ディレクトリの過去の日報ファイル一覧（直近5日分）

!NIPPO_FILE="/tmp/nippo.$(date +%Y-%m-%d).md" && echo "📋 日報内容確認 - $(date +%Y年%m月%d日)" && echo "================================" && if [ -f "$NIPPO_FILE" ]; then
  echo "📂 ファイル: $NIPPO_FILE"
  echo "📏 サイズ: $(wc -c < "$NIPPO_FILE") bytes"
  echo "🕒 最終更新: $(stat -f "%Sm" -t "%Y-%m-%d %H:%M:%S" "$NIPPO_FILE")"
  echo ""
  echo "📝 内容:"
  echo "--------------------------------"
  cat "$NIPPO_FILE"
  echo ""
  echo "--------------------------------"
  echo ""

  # 簡単な統計情報
  LOG_COUNT=$(grep -c "^### [0-9]" "$NIPPO_FILE" 2>/dev/null || echo "0")
  echo "📊 統計情報:"
  echo "  - 作業ログエントリ: ${LOG_COUNT}件"

  # 未記入セクションのチェック
  echo ""
  echo "⚠️  未記入セクション:"
  grep -n "（後で記入）\|（セッション終了時に記入）\|（随時追記）\|（本日終了時に記入）" "$NIPPO_FILE" | sed 's/^/  - /' || echo "  - なし（全て記入済み）"

else
  echo "❌ 本日の日報ファイルが見つかりません: $NIPPO_FILE"
  echo ""
  echo "💡 /nippo-add で作業ログを開始してください。"
fi && echo "" && echo "📅 過去の日報一覧（直近5日分）:" && echo "--------------------------------" && ls -lt /tmp/nippo.*.md 2>/dev/null | head -5 | while read line; do
  filename=$(echo "$line" | awk '{print $NF}')
  date_part=$(basename "$filename" .md | sed 's/nippo\.//')
  size=$(echo "$line" | awk '{print $5}')
  echo "  📄 $date_part ($size bytes)"
done || echo "  過去の日報ファイルはありません"