---
title: "Set Weekly Goal"
description: "週次目標を設定・更新します"
---

# Set Weekly Goal

月次目標を設定・更新します。

## 実行内容

!# Load nippo configuration
!source ~/.nippo_config 2>/dev/null || NIPPO_HOME="$(pwd)"

!if [ -f "${NIPPO_HOME}/goals.txt" ]; then
    sed -i '' 's/WEEKLY_GOAL=.*/WEEKLY_GOAL='"$ARGUMENTS"'/' "${NIPPO_HOME}/goals.txt"
    echo "週次目標を更新しました。"
    echo "現在の設定:"
    cat "${NIPPO_HOME}/goals.txt"
else
    echo "goals.txtが見つかりません。まず '/set_goals' で月次目標を設定してください。"
fi

週次目標を設定しました。
