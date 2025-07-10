#!/bin/bash

# 日報システムのインストールスクリプト

set -e

echo "🚀 日報システムをインストールしています..."

# ホームディレクトリのClaude設定にコマンドをコピー
CLAUDE_HOME="$HOME/.claude"
COMMANDS_DIR="$CLAUDE_HOME/commands"

echo "📁 Claude設定ディレクトリ: $CLAUDE_HOME"

# ディレクトリ作成
mkdir -p "$COMMANDS_DIR"

# コマンドファイルのコピー
if [ -d ".claude/commands" ]; then
    echo "📋 日報コマンドをコピーしています..."
    cp .claude/commands/nippo-*.md "$COMMANDS_DIR/"
    echo "✅ コマンドファイルをコピーしました:"
    ls -1 "$COMMANDS_DIR"/nippo-*.md | sed 's/^/  - /'
else
    echo "❌ .claude/commandsディレクトリが見つかりません"
    exit 1
fi

echo ""
echo "✅ インストール完了!"
echo ""
echo "🎯 使用可能なコマンド:"
echo "- /nippo-goals \"今月は新機能3つリリース\""
echo "- /nippo-add \"バグ#123修正完了\""
echo "- /nippo-show"
echo "- /nippo-finalize"
echo ""
echo "📂 作業ファイルは /tmp に作成されます:"
echo "- /tmp/nippo-goals.txt (目標)"
echo "- /tmp/nippo-YYYY-MM-DD.md (日報)"
echo "- /tmp/nippo-report_タイムスタンプ.md (レポート)"
echo ""
echo "💡 使い方:"
echo "1. /nippo-goals で目標設定"
echo "2. 作業中に /nippo-add でタスク記録"
echo "3. 終業時に /nippo-finalize でAI分析レポート生成"