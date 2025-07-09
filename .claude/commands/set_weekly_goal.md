---
title: "Set Weekly Goal"
description: "週次目標を設定・更新します"
---

# Set Weekly Goal

月次目標を設定・更新します。

## 実行内容

!if [ -f goals.txt ]; then
    sed -i '' 's/WEEKLY_GOAL=.*/WEEKLY_GOAL='"$ARGUMENTS"'/' goals.txt
    echo "週次目標を更新しました。"
    echo "現在の設定:"
    cat goals.txt
else
    echo "goals.txtが見つかりません。まず '/set_goals' で月次目標を設定してください。"
fi

週次目標を設定しました。
