# AM Install Checklist — The 4 Plugs (MCP servers) + skill backlog

Source: Rich's self-sent email **"Plug-ins"** → Google Doc *"The 4 Plugs"* (2026-08-08).
These are 4 official first-party **MCP servers** ("plugs") that give Claude real capabilities.

## What they unlock (and why they matter for FRESH GROUND)
- **Perplexity** — live web research with cited sources.
- **Firecrawl** — turn any website into clean text (JS pages, PDFs, whole-site crawl).
- **Playwright** — drive a real Chrome window (click/type/submit) for tools with no API.
- **Context7** — pull the *current* documentation for any tool ("use context7").

**Platform impact:** Firecrawl + Perplexity = the fix for our **P0 weak-comps / data-integrity**
gap (real listing/county/comp data + sourced market & builder buy-box research). Playwright =
automate MLS/Zillow/county lookups, e-sign UIs, and web forms. Context7 = keep tooling current.

⚠️ **This is a LOCAL Claude Code install** (`claude mcp add`, saved to `~/.claude.json` at user
scope). It fits the local-migration plan (SETUP-local.md). It will NOT persist in the ephemeral
cloud session — do it on the machine you'll run Claude Code on.

---

## ✅ YOUR AM STEPS (only you can do the account/key parts)

### Step 1 — Prereqs (2 min)
Open a terminal (Win: PowerShell · Mac: Terminal) and run:
- `claude --version`  → if missing, install from claude.com/product/claude-code
- `node --version`    → need **v18+** (Playwright needs it); if missing, install LTS from nodejs.org
Close & reopen the terminal after any install.

### Step 2 — Get 3 API keys (open 3 tabs)
1. **Perplexity (PAID — plan ~$5 credit):** console.perplexity.ai/group/keys → sign in → add
   payment → buy a little credit → generate key (starts `pplx-`). *Only paid one. Shown once — copy it.*
2. **Firecrawl (FREE):** firecrawl.dev/app/api-keys → sign up → copy key (`fc-`). 1,000 credits/mo, no card.
3. **Context7 (FREE):** context7.com/dashboard → sign up → copy key (`ctx7sk-`). 1,000 calls/mo.
4. **Playwright:** nothing — no account, no key.

### Step 3 — Install (1 min) — two ways
- **Option A (hand it to me):** once you're in **local** Claude Code, say "install the 4 plugs"
  and paste your keys **there** (local terminal, NOT this cloud chat). I'll run the 4 commands,
  verify, and report — showing only the last 4 chars of each key.
- **Option B (yourself):** paste the doc's one-prompt installer (or these 4 lines) into local
  Claude Code, swapping in real keys:
  ```
  claude mcp add --scope user --transport http perplexity https://api.perplexity.ai/mcp --header "Authorization: Bearer pplx-YOUR_KEY"
  claude mcp add --scope user --transport http firecrawl https://mcp.firecrawl.dev/v2/mcp --header "Authorization: Bearer fc-YOUR_KEY"
  claude mcp add --scope user playwright -- npx -y @playwright/mcp@latest
  claude mcp add --scope user --transport http context7 https://mcp.context7.com/mcp --header "Authorization: Bearer ctx7sk-YOUR_KEY"
  claude mcp list
  ```

### Step 4 — Restart + verify
**Fully quit and reopen** Claude Code (servers only load at session start). Then `claude mcp list`
→ want all 4 showing **Connected** (✅). "Needs authentication" = bad/space-in key;
"Failed to connect" = typo in address (or Node missing, for Playwright).

## 🔒 Security (do not skip)
- API keys = passwords. **NEVER paste them into this cloud chat / claude.ai.** Only in your local
  terminal or the vendor sites. `~/.claude.json` stores them as plain text — don't upload/screen-share it.
- If a key leaks, rotate it in the vendor dashboard (30 sec, kills the old one).

## 💵 Cost summary
Perplexity: prepaid, ~a few $/mo at normal use ($5 start). Firecrawl / Context7 / Playwright: free
tiers are fine to begin. Zero-cost start = install the 3 free ones, add Perplexity later.

---

## 📥 The rest of your skill/tool bookmarks (TO TRIAGE — I can't watch reels)
Self-sent items that look like tools/skills but are IG/FB reels or landing pages — I can see the
topic, not the content. Tell me which to pursue + send the real repo/site and I'll set them up:

**AI / Claude capability:** "7 skills part 1", "Claude tools", "Praison" (PraisonAI agents),
"Sandbox / agent isolation", "Claude mem +more", "Mempalace" (memory), "Omnilink",
"Qwen full autonomy agents", "Total automation", "Graphify", "Control Claude from my phone",
"Minimal (cheaper coding)", "Pedantic AI cleaner replies", "Konshus AI", "Polsia".

**Real-estate / data tools (relevant to comps + leads):** RentCast API, **Repliers (MLS API)**,
Serava (property analyzer), **PRYCD** (land comps), LandAtlas, PropertySource, REsimpli (dispo/CRM),
"Behind MLS — 21 off-market strategies", Homeflip.ai (probate).

_Prepared 2026-08-10 for AM review. Priority = the 4 Plugs (esp. Firecrawl + Perplexity for comps)._
