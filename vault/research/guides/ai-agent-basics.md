# Build an AI Agent That Never Sleeps (saved copy — Rich's "Agents AI" Google Doc, sent 2026-08-01)

> Source: docs.google.com/document/d/1sUdKMdatcbcvvgQsdAKr0IhPdil5-pT1jNB8o8ajZIo
> Origin: Instagram creator @seb.ai ("comment AGENT") lead magnet.
> **Vault verdict: already surpassed.** Everything this guide teaches is implemented and
> exceeded in this repo (memory = the vault; agents = .claude/agents/ six-agent deal
> agency; tools = MCP connectors; schedule = Routines/hooks). Archived for reference only.

## The guide in one page
- **Agent vs chat:** a chat answers; an agent takes a goal and does the steps (research,
  tools, memory, output).
- **Stack:** Claude (brain) + a memory file it reads at start/updates at end + MCP servers
  for tools + optional scheduler.
- **Build loop:** pick ONE job → role+rules prompt → run → review → refine → only then add
  memory, tools, schedule.
- **Memory pattern:** "Read my memory file at start; at the end tell me exactly what to
  add so you remember next time." (Our vault-load hook + /vault-save is the grown-up
  version of this.)
- **Golden rule:** anything sent/published = agent DRAFTS, human approves. (= our standing
  FRESH GROUND hard rule.)
- **Model matching:** hardest reasoning → most capable model; everyday drafting → mid-tier;
  high-volume simple → lightest. (= our Sonnet-default/Opus-when-hard policy.)
- **Mistakes list:** vague goals · auto-send without review · no memory · too many tools at
  once · keys in prompts · trusting output blindly.
- **Master prompt pattern:** role + read memory + do task with named tools + draft-only +
  flag uncertainty + end-of-day memory update + honesty rules.
