---
title: "Set Goals"
description: "月次・週次目標を設定・更新します"
---

# Set Goals

月次・週次目標を設定・更新し、日報分析で参照できるようにします。

## 実行内容

!# Load nippo configuration
!source ~/.nippo_config 2>/dev/null || NIPPO_HOME="$(pwd)"

!echo "# Goals Settings" > "${NIPPO_HOME}/goals.txt"
!echo "MONTHLY_GOAL=$ARGUMENTS" >> "${NIPPO_HOME}/goals.txt"
!echo "WEEKLY_GOAL=" >> "${NIPPO_HOME}/goals.txt"
!echo "" >> "${NIPPO_HOME}/goals.txt"
!echo "目標を設定しました。週次目標も設定する場合は '/set_weekly_goal' を使用してください。"
!echo "現在の設定:"
!cat "${NIPPO_HOME}/goals.txt"

月次目標を設定しました。週次目標を設定する場合は、引き続き `/set_weekly_goal` を実行してください。
