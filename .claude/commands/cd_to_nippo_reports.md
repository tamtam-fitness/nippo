---
title: "CD to Nippo Reports"
description: "日報レポートディレクトリに移動します"
---

# CD to Nippo Reports

日報レポートが保存されているディレクトリに移動し、過去のレポートを確認できるようにします。

## 実行内容

!# Load nippo configuration
!source ~/.nippo_config 2>/dev/null || NIPPO_HOME="$(pwd)"

!echo "📂 日報レポートディレクトリに移動します..."
!echo "cd \"${NIPPO_HOME}/reports\""
!echo ""
!echo "💡 ヒント: 以下のコマンドで実際に移動してください："
!echo "   cd ${NIPPO_HOME}/reports"
!echo ""
!echo "📋 最近のレポート："
!ls -lt "${NIPPO_HOME}/reports" 2>/dev/null | head -10 || echo "まだレポートがありません。"