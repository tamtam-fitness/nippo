#!/bin/bash

# Nippo Installation Script
# This script sets up the nippo system globally for Claude Code

set -e

echo "🚀 Nippo Installation Script"
echo "==========================="

# Get the directory where the script is located (nippo repo)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
NIPPO_HOME="$SCRIPT_DIR"

echo "📍 Nippo home directory: $NIPPO_HOME"

# Create necessary directories
echo "📁 Creating directories..."
mkdir -p "$NIPPO_HOME/reports"
mkdir -p ~/.claude/commands

# Copy commands to global Claude directory
echo "📋 Installing commands..."
cp "$NIPPO_HOME/.claude/commands/"*.md ~/.claude/commands/

# Create or update nippo config file
echo "⚙️  Setting up configuration..."
cat > ~/.nippo_config <<EOF
# Nippo Configuration
NIPPO_HOME="$NIPPO_HOME"
EOF

# Update finalize_nippo.md to use NIPPO_HOME
echo "🔧 Configuring commands..."
sed -i.bak 's|mkdir -p reports|source ~/.nippo_config 2>/dev/null || true; mkdir -p "${NIPPO_HOME:-$(pwd)}/reports"|g' ~/.claude/commands/finalize_nippo.md
sed -i.bak 's|"reports/nippo_|"${NIPPO_HOME:-$(pwd)}/reports/nippo_|g' ~/.claude/commands/finalize_nippo.md
sed -i.bak 's|goals.txt|${NIPPO_HOME:-$(pwd)}/goals.txt|g' ~/.claude/commands/*.md
sed -i.bak 's|nippo_draft.txt|${NIPPO_HOME:-$(pwd)}/nippo_draft.txt|g' ~/.claude/commands/*.md

# Clean up backup files
rm -f ~/.claude/commands/*.bak

echo ""
echo "✅ Installation complete!"
echo ""
echo "📝 The following commands are now available globally in Claude Code:"
echo "   - /add_record_to_nippo    : Add tasks to daily report"
echo "   - /finalize_nippo         : Generate analysis report"
echo "   - /set_goals              : Set monthly goals"
echo "   - /set_weekly_goal        : Set weekly goals"
echo "   - /cd_to_nippo_reports    : Navigate to reports directory"
echo ""
echo "📂 Reports will be saved to: $NIPPO_HOME/reports/"
echo "📋 Goals and drafts will be saved to: $NIPPO_HOME/"
echo ""
echo "🎉 You can now use nippo commands in any project!"