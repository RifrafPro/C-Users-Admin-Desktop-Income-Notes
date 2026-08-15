# TONIGHT — Install local Claude Code (Windows), then the 4 Plugs

**Why:** the `claude mcp add` commands need the LOCAL Claude Code CLI. Rich's error
("claude is not recognized...") = the CLI isn't installed on his Windows machine yet (he'd been
using the web/cloud version). Installing local Claude Code = "installing Claude on the computer,"
which then runs the plug installs itself. Not a new OS — runs on top of Windows.

## Step A — Check Node (PowerShell)
    node --version
- Number like v20.x → go to B.
- "not recognized" → nodejs.org → green LTS button → run installer (Next/Next/Install/Finish) →
  CLOSE & REOPEN PowerShell → re-run `node --version`.

## Step B — Install Claude Code
    npm install -g @anthropic-ai/claude-code
Then CLOSE & REOPEN PowerShell and test:
    claude --version
(version number = installed)

## Step C — First login
    claude
Log into the Anthropic account when prompted. Now local Claude can run the rest itself.

## Step D — Install the 4 Plugs (local Claude can do these on approval)
    claude mcp add --scope user --transport http firecrawl https://mcp.firecrawl.dev/v2/mcp --header "Authorization: Bearer <FIRECRAWL_KEY>"
    claude mcp add --scope user playwright -- npx -y @playwright/mcp@latest
    claude mcp add --scope user --transport http context7 https://mcp.context7.com/mcp --header "Authorization: Bearer <CONTEXT7_KEY>"
    claude mcp add --scope user --transport http perplexity https://api.perplexity.ai/mcp --header "Authorization: Bearer <PERPLEXITY_KEY>"   # paid; add when ready
    claude mcp list
Then FULLY quit & reopen Claude Code → `claude mcp list` → want all Connected (✅).

## Keys status
- Firecrawl: HAVE (free). ⚠️ ROTATE IT — the key was pasted into the cloud chat, so treat as
  exposed: firecrawl.dev/app/api-keys → delete old → generate new → use the new one in Step D.
- Context7: HAVE (free, ctx7sk-).
- Perplexity: NOT YET (paid, ~$5 to start) — optional for launch.

## Bridge the memory to local
Local Claude boots fresh — the VAULT is the memory. Get the vault onto the machine:
- Preferred: fix GitHub write (grant Contents:write) so `git clone` works, OR
- Pull the vault files from Google Drive "Income Notes Vault".
Then the SessionStart hook loads context and local-me resumes exactly here.

## WHERE WE LEFT OFF (resume state 2026-08-10)
- Strategy locked: **BUYER-FIRST (reverse wholesaling)** + **Control-Before-Disclosure** rule
  (see wholesaling.md). Buyers' buy-boxes first → source to fit → tie up (PSA) → then disclose.
- Arnold Ln (3412, Falls Church): underwritten, GO (test), **parked** — don't disclose address
  to any buyer until under contract / non-circumvent signed.
- Rob (Zimmermann) email: rewritten to a SAFE BLIND version (no address), parked in richfabiani
  Drafts. Do NOT send the address version.
- Upgrades queued: multi-account + SEND-capable email; e-sign; non-circumvent; the 4 plugs.
- Open blockers for Rich: (1) GitHub Contents:write grant, (2) email bridge (forward + send-as),
  (3) local Claude Code install (this file).

_Saved 2026-08-10. Parking here — resume tonight._
