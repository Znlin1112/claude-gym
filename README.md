# Claude健身房 🏋️

Claude一思考，健身房裡的小傢伙就開始舉重。想越久，練越壯，最後壯到擠爆畫面。

## 給收禮的人

1. 在Claude Code輸入：
   ```
   /plugin marketplace add Znlin1112/claude-gym
   /plugin install gym-buddy@claude-gym
   ```
2. 重開Claude Code
3. 輸入 `/gym-buddy:gym`，打開它給你的網址（建議用一個分頁一直開著）
4. 去叫Claude做事，然後看它練

## 原理

- `UserPromptSubmit` hook → 送出 `start`
- `Stop` hook → 送出 `stop`
- 訊號經由 [ntfy.sh](https://ntfy.sh) 的隨機頻道傳到網頁（只有這兩個字，沒有任何對話內容）
- 網頁依累積的思考時間升級；ntfy會暫存12小時內的訊息，所以網頁沒開的時候練的也會補算

角色動畫：ZN手繪 🎨
