# The 4 Plugs (saved copy — Rich's "Plug-ins" Google Doc, sent to self 2026-08-08)

> Source: docs.google.com/document/d/1MKXqHzTEXBUavsbLYoXINoixtm6jqKbco2DRCC2kkaA
> Origin: skool.com/viral-ads community guide.
> **This is THE "4 plugins" doc** Rich referenced repeatedly in August sessions.

## Vault status vs this guide (as of 2026-08-27)
| Plug | Guide says | Our status |
|---|---|---|
| Firecrawl | free key, mcp.firecrawl.dev/v2/mcp | ✅ CONNECTED (claude.ai connector, key attached 08-26) |
| Playwright | local browser automation, no key | ➖ cloud container already has Chromium; local install = for Rich's PC |
| Perplexity | PAID (~$5 credit to start), api.perplexity.ai/mcp | ❌ not installed — needs Rich to buy credit + key (pplx-) |
| Context7 | FREE key (ctx7sk-), mcp.context7.com/mcp | ❌ not installed — **easy free win** |

## What an MCP is (guide's framing)
Claude alone = smart person locked in a room, no phone, no window. MCP = a power outlet;
each server is a plug. Install once (user scope) → every future session has it.

## The four plugs
1. **Perplexity — live research.** AI search engine (Sonar) that reads dozens of live
   sources and returns answers + citations. Kills "as of my last update."
2. **Firecrawl — read any website.** Turns sites into clean text; handles JS, cookie
   walls, infinite scroll, PDFs. One page, a site map, or a full crawl.
3. **Playwright — drive a real browser.** Microsoft's official MCP; reads page structure,
   clicks, types, submits. The plug for tools with no integration.
4. **Context7 — current documentation.** Pulls live docs for any tool into the chat.
   Trigger by literally saying "use context7."

## Official-only rule (the guide's most important safety point)
Install ONLY the vendor's own server. Clones can be abandoned or route your API key
through a stranger's machine. First-party sources:
- Perplexity: api.perplexity.ai · github.com/perplexityai/modelcontextprotocol
- Firecrawl: mcp.firecrawl.dev · github.com/firecrawl/firecrawl-mcp-server
- Playwright: github.com/microsoft/playwright-mcp (runs locally)
- Context7: mcp.context7.com · github.com/upstash/context7

## Keys
- Perplexity: console.perplexity.ai/group/keys — PAID, prepaid credit (~$5 start; Sonar
  ≈ $1/M tokens + cents per search; normal use = a few $/mo). Key shown once. `pplx-`
- Firecrawl: firecrawl.dev/app/api-keys — FREE 1,000 scrape + 1,000 search credits/mo. `fc-`
- Context7: context7.com/dashboard — FREE 1,000 calls/mo (+20/day bonus); $10/mo = 5,000. `ctx7sk-`
- Playwright: no account, no key.

## Install commands (terminal, one at a time; swap real keys)
```
claude mcp add --scope user --transport http perplexity https://api.perplexity.ai/mcp --header "Authorization: Bearer pplx-YOUR_KEY"
claude mcp add --scope user --transport http firecrawl https://mcp.firecrawl.dev/v2/mcp --header "Authorization: Bearer fc-YOUR_KEY"
claude mcp add --scope user playwright -- npx -y @playwright/mcp@latest
claude mcp add --scope user --transport http context7 https://mcp.context7.com/mcp --header "Authorization: Bearer ctx7sk-YOUR_KEY"
claude mcp list
```
Prereqs: `claude --version` + `node --version` (Node ≥18 for Playwright).
Desktop-app config-file equivalent exists (mcpServers JSON block) — see original doc.

## Verify (never skip)
Restart Claude Code fully (servers load at session start), then `claude mcp list`:
- Connected = done · Needs authentication = key rejected (trailing space / copied the
  label not the value) · Failed to connect = typo in address, or Node missing (Playwright).
- `/mcp` inside a session shows the live panel.
- ⚠️ "Added" never validates the key — failure only appears at connect time.

## Security notes
- `~/.claude.json` stores keys as plain text — never upload/screenshare/paste it.
  Leaked key → delete in vendor dashboard, regenerate (30 seconds).
- Keys can only spend that vendor account's credit; none can see your computer.
- Playwright: most powerful (real browser, your logins). Say "isolated mode" for a
  clean profile; persistent profile stays signed in between runs.

## The four "first wins" (starter prompts, abridged)
1. Competitor teardown (Perplexity + Firecrawl): find 3 competitors, crawl their sites,
   table of promise/pricing/audience/objection + what we can say that they can't.
2. Honest site walkthrough (Playwright): behave like a first-time buyer, narrate every
   step, list dead links/confusing labels in visit order.
3. Brand-voice extraction (Firecrawl): crawl an admired site → one-page voice guide +
   3 headlines in that voice for your product.
4. Current answer (Context7): pull live docs for your main tool, answer only from them,
   list what changed recently that you're still doing the old way.

## Pro moves
- Chain plugs in one sentence (Perplexity find → Firecrawl read → Playwright test).
- Name the plug you want ("use Firecrawl", "use context7").
- Map before crawling (10 credits vs 400 on a big site).
- Perplexity tools: search (cheap) / ask / reason / research (expensive) — name "search"
  for small lookups.
- Session opener: "Before answering anything about a tool/product/company, check it live
  with my plugs instead of memory, and tell me which tool you used."

## Common mistakes
Not restarting · copying key label not value · Perplexity rejection = no credit on
account · expecting Playwright to be invisible (it opens a visible window; ask for
headless) · slow first Playwright run (downloads a browser once) · no scope = saved to
current folder only · project-scope .mcp.json can get shared with the project · clones.
