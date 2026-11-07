#!/bin/bash
# 健身房傳話員：Claude開始想 → 送 "start"；想完 → 送 "stop"。
# 只送這兩個字，不會送出任何程式碼或對話內容。
# 這個腳本絕對不能印出任何東西（UserPromptSubmit的輸出會被塞進Claude的對話裡）。

# ⬇️ 改成你的GitHub Pages網址（結尾要有 /）
PAGE_URL="https://znlin1112.github.io/claude-gym/"

DIR="$HOME/.claude/gym-buddy"
mkdir -p "$DIR" 2>/dev/null

# 第一次執行時產生一個隨機頻道名稱，之後都用同一個
if [ ! -s "$DIR/topic" ]; then
  TOPIC="claudegym-$(LC_ALL=C tr -dc 'a-z0-9' </dev/urandom 2>/dev/null | head -c 20)"
  echo "$TOPIC" > "$DIR/topic"
fi
TOPIC="$(cat "$DIR/topic")"
echo "${PAGE_URL}?t=${TOPIC}" > "$DIR/link.txt"

case "$1" in
  start|stop)
    # 放到背景送出，不拖慢Claude；失敗也沒關係
    ( curl -s -m 5 -d "$1" "https://ntfy.sh/${TOPIC}" >/dev/null 2>&1 & ) >/dev/null 2>&1
    ;;
esac

exit 0
