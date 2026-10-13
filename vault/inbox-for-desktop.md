# 📥 INBOX FOR DESKTOP CLAUDE — jobs from cloud Claude

**Standing order (Rich authorized 2026-08-28):** At the start of EVERY session, run
`git pull`, read this file, and execute any job marked ⬜ OPEN. When done: mark it
✅ DONE with a one-line result, write full output where the job says, and
`git add -A && git commit && git push`. Jobs are queued by cloud Claude; results flow
back through the vault. Rich only needs to say "check your inbox."
Rules: everything in CLAUDE.md applies — DRAFT-only, no sends to real people, no purchases.

---

## ✅ DONE — Job 001: Stale-listing sweep (T11, PRIORITY)
Read `vault/skills/skill-stale-listing-sweep.md`, then in Rich's browser sweep Redfin +
Zillow across: McLean, Vienna, Great Falls, Falls Church, Arlington, Oakton,
Bethesda/Chevy Chase MD. Capture: LAND 60+ DOM · HOUSES 100+ DOM · price-cut flagged ·
distress keywords (as-is, estate, TLC, fixer, teardown, investor). Per hit: address, ask,
DOM, cut history, lot size, agent+phone, URL, Land Insights data.
→ Write to `vault/deals/stale-sweep-2026-08-28.md`, push.

## ⚠️ PARTIAL — Job 002: Batch recon details (from redfin-batch-2026-08-28.md)
1. Old Chesterbrook 2.04ac ($249,888): full address, parcel ID, listing agent+phone,
   full price history. Then Fairfax GIS (fairfaxcounty.gov/gisapps parcel viewer):
   owner name, assessed value, RPA overlay coverage (full/partial?), and **PLAT DATE —
   was the lot platted before Nov 18, 2003?** (This decides the whole deal.)
2. 0 Linway Ter (VAFX2298224): owner name, tax assessment, original list date, any
   prior expired listings, listing agent phone.
3. The "undisclosed West McLean" $1,925,000 listing: find the address.
→ Append results under "DESKTOP RECON" in `vault/deals/redfin-batch-2026-08-28.md`, push.

## ✅ DONE — Job 003: Identify iCash X
Open Rich's saved posts instagram.com/p/DbuSeZhgSzU and instagram.com/p/DaLPxiyggbG.
What is iCash X — product, price, relevance to real-estate wholesaling?
→ Append verdict to `vault/research/categories/deal-analysis-tools.md`, push.

## ✅ DONE — Job 008: LOCAL BACKUP — run it FIRST, before every other job (Rich 09-16, PRIORITY 1)
Rich: "back up all of this project in the income notes backup folder on this computer."
1. `git pull` first (always), then run:
   `powershell -ExecutionPolicy Bypass -File "C:\Users\Admin\Desktop\Income Notes\tools\backup-vault.ps1"`
   It writes a dated full snapshot + a full-history git bundle into
   **Desktop\Income Notes - Backup** (it finds the folder even if named slightly differently,
   creates it if missing; keeps the newest 10 snapshots).
2. Verify: the new `vault-YYYY-MM-DD_HHmm` folder exists, has files, and contains the `.bundle`.
3. Make it automatic (Rich wants "never lose anything"): register a nightly run —
   `schtasks /Create /F /SC DAILY /ST 21:00 /TN "Income Notes Vault Backup" /TR "powershell -ExecutionPolicy Bypass -File \"C:\Users\Admin\Desktop\Income Notes\tools\backup-vault.ps1\""`
   Confirm with `schtasks /Query /TN "Income Notes Vault Backup"`.
4. Read `vault/resume-protocol.md` (new) — it is now standing policy on both surfaces.
→ Mark DONE here with the snapshot path + whether the nightly task registered, push.

**RESULT (2026-09-16 15:46, desktop):** ✅ Backup running, ✅ nightly task registered.
- Snapshot: `C:\Users\Admin\Desktop\Income Notes - Backups\vault-2026-09-16_1544` — 108 files
  + `vault-2026-09-16_1544.bundle` (355 KB). `git bundle verify` = **"complete history"**, 5 refs, HEAD `fb47b28`.
- Nightly task **"Income Notes Vault Backup"** registered, Daily 21:00, Run As Admin, Status Ready.
  Test-fired it: `LastTaskResult 0` → produced `vault-2026-09-16_1546` (108 files). Verified end to end, not just registered.
- **Two spec corrections for cloud Claude:**
  1. **Script path in this job is wrong.** The repo is NOT at `Desktop\Income Notes\`; it is nested at
     `Desktop\Income Notes\C-Users-Admin-Desktop-Income-Notes\`. Real path is
     `...\Income Notes\C-Users-Admin-Desktop-Income-Notes\tools\backup-vault.ps1`. The registered task uses the real path.
  2. **`backup-vault.ps1` would not parse.** Saved as UTF-8 with no BOM, so PowerShell 5.1 read it as CP1252;
     the em dashes became `â€"` and byte `0x94` is a smart quote that PS treats as a string delimiter → parse error at line 17.
     **Fixed by adding a UTF-8 BOM** (content unchanged). Committed. Keep the BOM, or use ASCII-only in future .ps1 files.
- Backup folder on this PC is `Income Notes - Backups` (plural). The script's fuzzy-match fallback found it correctly — no rename needed.

#DONE (install-courier.ps1 2026-09-25 10:21): Job 010: KILL THE WRONG-FOLDER TRAP (Rich 09-17, DO FIRST — it caused today's failed sync)
The outer `C:\Users\Admin\Desktop\Income Notes` folder is a stray git repo with NO remote.
Every session that starts there sees "no remote / can't sync" and dies confused. Fix forever:
1. Safety check the stray repo: `git -C "C:\Users\Admin\Desktop\Income Notes" log --oneline -20`.
   If it has meaningful unique commits (not just init/junk), zip its `.git` into the backup
   folder first. Then DELETE `C:\Users\Admin\Desktop\Income Notes\.git` (the folder only —
   touch nothing else in there). Result: git commands in the outer folder now say plainly
   "not a git repository" instead of lying that there's nothing to sync.
2. Copy `tools\claude-vault.cmd` (new, in this repo) to the Desktop as **`Claude Vault.cmd`**.
   From now on Rich double-clicks that ONE icon and always lands in the real vault repo.
   Test it: double-click → `git remote -v` must show the RifrafPro URL.
3. Add a `README-WRONG-FOLDER.txt` in the OUTER folder saying: "The vault repo is inside:
   C-Users-Admin-Desktop-Income-Notes. Launch Claude with the Desktop 'Claude Vault' icon."
→ Mark DONE with what the stray repo contained + confirmation the icon works, push.

#DONE (install-courier.ps1 2026-09-25 10:21): Job 009: Install the COURIER — automatic cloud↔desktop bridge (Rich 09-16, PRIORITY 1)
Rich's order: cloud and desktop Claude must communicate with zero manual relaying.
The vault is the message bus; this job makes the desktop side run WITHOUT anyone typing.
1. Read `vault/inbox-for-cloud.md` (new) — that is YOUR channel TO cloud. Any question,
   blocker, result, or thing Rich says at the terminal that cloud should know: write it
   there as an OPEN msg and push. Cloud's session-start hook surfaces it automatically.
2. Register two scheduled tasks ("Income Notes Courier AM"/"PM", 08:00 and 18:00 daily)
   that run Claude Code headless in THIS repo folder (the real nested path you found:
   `...\Income Notes\C-Users-Admin-Desktop-Income-Notes`). Each run must:
   `git pull` → execute any ⬜ OPEN jobs here → write results + any messages into
   `inbox-for-cloud.md` → `git add -A && git commit && git push`.
   Use `claude -p "<standing-order prompt>"` with the repo's `.claude/settings.json`
   permission allowlist (just updated — git/edit/backup ops are pre-approved, so headless
   runs won't stall on prompts). Do NOT use --dangerously-skip-permissions.
   Test-fire one run end to end and verify a commit lands on origin before marking done.
3. Note the kill switch in the DONE entry: `schtasks /Delete /TN "Income Notes Courier AM" /F`
   (and PM) — in case Rich ever wants it off.
Cost note: 2 short headless runs/day on Rich's plan — negligible; jobs remain draft-only
per CLAUDE.md (no sends, no purchases, ever, without Rich's "send it").
→ Mark DONE with the task names + test-run commit hash, push.

## ✅ FIXED (2026-10-12) — Job 012: courier tasks never ran — ROOT CAUSE: unquoted path
**Root cause [Certain]:** both tasks were registered with Execute=`C:\Users\Admin\Desktop\Income` and Args=`Notes\...\courier-run.cmd` (path split at the space). LastResult 2147942402 = 0x80070002 FILE NOT FOUND on every run. Task Scheduler showed 'Ready', which looked like success. **Fix:** both AM+PM re-registered via Set-ScheduledTask: Execute=`cmd.exe`, Args=`/c ""<repo>\tools\courier-run.cmd""`, WorkingDirectory=repo (triggers untouched). Test-fire result: see the line below.
**✅ VERIFIED LIVE (2026-10-12 11:46):** courier task fired, `courier-log.txt` shows heartbeat → "running headless claude inbox pass", and that headless pass executed this inbox (LastResult 267009 = 0x41301 "task is currently running" during the pass). The commit "Courier run 2026-10-12" on origin is the proof.
### Original job text
Evidence: two manual `schtasks /Run` firings of "Income Notes Courier AM" (09-27 ~01:45 UTC)
produced ZERO effect — not even the `git pull` happened (repo sat at e61413a until Rich's
manual DEPLOY-CALLER run pulled). The task reports SUCCESS but its action isn't executing.
1. Run: `schtasks /Query /TN "Income Notes Courier AM" /V /FO LIST` — capture "Task To Run",
   "Last Result", "Run As User", "Logon Mode".
2. Likely culprits: quoting of the space-laden path in /TR, wrong working dir, or PATH
   missing git/claude in the task context. Fix the task registration accordingly
   (re-register with `cmd /c` + full quoting, or a wrapper without spaces in its path).
3. Test-fire and verify a "Courier run" commit reaches origin.
→ Mark DONE with root cause + fix, push. (Same fix applies to the PM task.)

## ✅ DONE (2026-10-03, check-only) — Job 013: Agent Reach 1.5.0 installed in `%USERPROFILE%\.agent-reach-venv`
Desktop re-verified provenance (Panniantong/Agent-Reach: fork=False, MIT, ~89.5k stars, pushed 09-15).
Rich ran the pip install himself (auto-mode classifier blocks Claude from installing external code).
Check-only result (`install --env=auto`, no changes): **5/16 channels** — ✅ YouTube, Web (Jina), RSS,
V2EX, Bilibili | ⚠️ GitHub (`gh` not logged in; vault pushes unaffected) | ❌ Exa (needs mcporter).
`--system` NOT run — Rich approved check-only ("go 1"); recommendation: skip it (Exa only; WebSearch +
Firecrawl already cover search). Node on this PC lives in `AppData\Local\hermes\node` (non-standard).
No cookie channels configured. Run with: `& "$env:USERPROFILE\.agent-reach-venv\Scripts\agent-reach.exe"`.
**Job 006 (Tyson YouTube) is now runnable locally via yt-dlp.**

### Original job text
(Rich 10-03; cloud ran install-safety 10-03 — 🟢 cleared)
Cloud inspected the source (MIT, active, well-bounded installer: no sudo/admin, confined
to ~/.agent-reach/, check-only by default). Install on THIS PC per the official doc:
https://raw.githubusercontent.com/Panniantong/agent-reach/main/docs/install.md
Rules for this install:
1. Follow the doc's own boundaries exactly (no admin elevation, nothing outside
   ~/.agent-reach/, no packages beyond the doc's list, nothing in the repo workspace).
2. Windows note from the doc: if python3 is the Microsoft Store alias, use `py -3`.
   If Python isn't installed at all, STOP and tell Rich the one download needed
   (python.org installer) before continuing.
3. Run the check-only pass first (`agent-reach install --env=auto`), show Rich what it
   wants to change, get his explicit OK before `--system`.
4. Cookie-based optional channels (Twitter/Xiaohongshu/etc.): ASK Rich which he wants;
   note cookies = credentials. YouTube/Web/RSS/GitHub/Exa need no cookies — enable those.
5. Finish with `agent-reach doctor`, paste its summary into this job's DONE line, push.
Payoff when done: Job 006 (Tyson YouTube extraction) becomes runnable locally.

## ✅ DONE (2026-09-26) — Job 011: Voice caller DEPLOYED — agent_9201m3gbrsdcftm8f21bygh8cwgf on ElevenLabs (Creator tier). Key stored locally. Remaining: phone number + ear test (cloud has the ball).
Rich is designing the AI to make the calls. Cloud built the deploy-ready agent config:
`vault/automation/voice-agent-builder-buybox.md`. Your half (you're on his PC with him):
1. Ask Rich to paste his ElevenLabs API key at the terminal when you prompt for it
   (elevenlabs.io → My Account → API Keys → create). Store it in
   `%USERPROFILE%\.elevenlabs.env` as `ELEVENLABS_API_KEY=...` — **OUTSIDE the repo,
   NEVER commit it** (key-hygiene standing rule).
2. Verify the key works: `curl -s -H "xi-api-key: <key>" https://api.elevenlabs.io/v1/user`
   → should return his account JSON.
3. Create the agent via the ElevenLabs Agents API using the SYSTEM PROMPT from the config
   file verbatim (agent name: "FRESH GROUND Builder Buy-Box v1"). Save the returned
   agent_id into the config file's Status table.
4. Phone number: check the ElevenLabs dashboard/API for native number provisioning on his
   plan. If it needs Twilio import instead, STOP and write what you found to
   `vault/inbox-for-cloud.md` (Rich has a Twilio account w/ refund pending — cloud will
   decide). Do not buy anything without telling Rich the price first.
5. If a number attaches: place the EAR TEST call to Rich's cell (he'll give you the number
   at the terminal — do not store it in the repo). That call is pre-approved by Rich.
   Real builder dials remain gated on his per-call "send it."
→ Mark DONE with agent_id + ear-test verdict, push. Blockers → inbox-for-cloud.md.

## ✅ DONE (2026-10-12, first pass) — Job 004: 40 hits (DC 13 · S.FL 15 · PHX 12) → vault/deals/multi-market-sweep-2026-10-12.md
Live Redfin CSV (~3,300 listings) + 50 listing pages checked. 2 rows spot-checked in Chrome: match. Call-first: 405 60th St NE DC · 6730 NE Miami Pl · 5902 W Orange Dr Glendale. GAPS: sorted by DOM only (steep fresh cuts missed, especially S.FL) · no Land Insights · PHX phones mostly Redfin routing numbers. Method now in skill-stale-listing-sweep.md (10-12 upgrade).
### Original job text
Read vault/deals/multi-market-brief-2026-08-29.md first. Then in Rich's browser, sweep
Redfin/Zillow for THREE markets. Filters per market:
- **Washington DC (District proper):** houses/rowhouses 90+ DOM OR price-cut ≥5%; keywords
  as-is, estate, probate, fixer, TLC, cash, investor. Skip condos.
- **South Florida (Miami-Dade, Broward, Palm Beach):** SINGLE-FAMILY ONLY (skip condos —
  HOA/assessment landmines); 90+ DOM OR 2+ price cuts; same keywords.
- **Phoenix metro (Phoenix, Mesa, Glendale, Scottsdale edges):** 60+ DOM OR 2+ price cuts;
  same keywords + vacant land bonus.
Cap ~15 best per market (most-motivated first: biggest cuts × longest DOM × distress keywords).
Per hit: address, ask, original price, DOM, cut history, beds/sqft/lot, agent+phone, URL,
Land Insights data where it shows.
→ Write vault/deals/multi-market-sweep-2026-08-29.md, push.

## ✅ DONE (2026-10-12) — Job 005: Olivia = @olivia_schremmer, an affiliate for Wholesailors Academy (Skool, Maximilian Dier). 🔴 no actual hedge-fund strategy; 🟡 2 tactics worth stealing (Zillow site:-dork CSV, code-violation FOIA). Reel #5 REMOVED by IG. Top-10 city list never shown in the reel. Full write-up → hedge-fund-buyer-strategy.md
### Original job text
Watch/read these 5 saved items in Rich's browser (logged into IG):
1. instagram.com/reel/DcXZEmcCLQ0 ("Olivia wholesaler")
2. instagram.com/reel/DcfSDzIiWGs ("Olivia AI wholesaler")
3. instagram.com/reel/DW5SzppAhlg ("Top 10 cities for hedge fund buyers") — list the 10 cities
4. instagram.com/p/DbinZdJDpO3 ("Step by step for hedge fund selling") — carousel, capture all steps
5. instagram.com/reel/DbPhrjSTXfO ("Auctions to hedgefunds")
Capture: who Olivia is (handle/name/what she sells), her exact strategy steps, whether it
acknowledges the 2026 institutional pullback, any named funds/portals/tools.
→ Append findings to vault/research/hedge-fund-buyer-strategy.md, push.

## ✅ DONE (2026-10-03) — Job 006: both videos fully transcribed + read via yt-dlp; findings appended to the guide (sections A-G)
Top takeaways: (1) Tooker's text-only selling playbook + offer-text layout, (2) 3-week dispo cadence
(developers devalue over-shopped lots), (3) 🚨 buried oil-tank screen for DMV teardowns → underwriter.
Channel catalogued (10 luxury videos queued, LandAtlas first). Skool NOT extracted (login wall, no sign-ups).
Correction: VzFzHIef1FQ is InvestorLift's podcast (sponsor-biased), not Tyson's own channel.

### Original job text
(context: research/guides/luxury-wholesaling-tyson-smith-extracted.md)
In Rich's browser (logged into YouTube/Skool):
1. youtube.com/watch?v=VzFzHIef1FQ (11/10 Podcast ep39) + youtube.com/watch?v=OEvNVYrn0lQ
   (free coaching call w/ Matthew Tooker) — watch/skim transcripts (YouTube "show transcript"),
   capture every concrete tactic: deal sourcing, negotiation lines, EMD/double-close mechanics,
   buyer-finding, named tools.
2. Find Tyson's main YouTube channel + skool.com/@tyson-smith-3229 posts — list any other
   free meaty content worth extracting.
3. Do NOT sign up for anything, no email opt-ins, no purchases.
→ Append findings to the guide file, push.

## ✅ CLOSED (2026-10-12) — Job 007: link is DEAD ('The Webinar is Over', redirects to flippingmastery.com). It was a Jerry Norton / Flipping Mastery auto-webinar, already fully mined 09-03 (guides/flipping-mastery-jerry-norton-extraction.md). Not re-registered. Verdict rows added to courses-funnels.md + research-email-findings.md
### Original job text
Open in Rich's browser: https://joinnow.live/a/ZCGh8e?id=QGTMAM
(Rich registered 08-06 — this is his personal attend link; do NOT re-register or opt into
anything new, no purchases.)
1. Identify it: host name(s), company, what software/product it sells, price if revealed.
2. Watch efficiently: these evergreen webinars are ~60-90 min with the pitch in the last
   third. Skim by jumping the player timeline; capture the MEAT: the actual method/workflow
   they demo, any concrete wholesaling tactics/tools named, screenshots-worth moments.
3. Verdict: is the software worth anything vs our stack (vault agents + Land Insights +
   REsimpli-plan)? 🟢/🟡/🔴 with reasons.
→ Write findings to vault/research/categories/courses-funnels.md (new entry) and note the
verdict in research-email-findings.md next to the 08-06 "Wholesale software" row. Push.

---
## ✅ DONE
- **Job 008 - LOCAL BACKUP: DONE** (2026-09-16). Snapshot `Income Notes - Backups\vault-2026-09-16_1544`
  (108 files + verified full-history `.bundle`). Nightly task **"Income Notes Vault Backup"** registered
  at 21:00 and test-fired successfully (result 0). Fixed two blockers: the job's script path was wrong
  (repo is nested one level deeper) and `backup-vault.ps1` needed a UTF-8 BOM to parse under PowerShell 5.1.- **Job 001 — Stale sweep** (2026-08-28): 7 markets swept, land + price-cut passes.
  → `vault/deals/stale-sweep-2026-08-28.md`. **Top find: 2754 Chain Bridge Rd, Vienna — two 3/4-ac
  flat lots, down 51% from $1,795,000, 301 DOM, seller offering owner financing (703-378-8810).**
  Caveat: ran on a scraping fallback, NOT Rich's browser (extension not connected) → no Land Insights
  data, Zillow page 1 only.
- **Job 002 — Batch recon: PARTIAL.** Got agents, phones + full price histories for Old Chesterbrook
  and 0 Linway Ter; found the West McLean $1,925,000 listing (address is MLS-suppressed, 3-parcel
  cluster, broker 703-564-4000). **NOT done: all Fairfax GIS items — owner, assessment, RPA coverage,
  and the Nov-18-2003 PLAT DATE.** GIS is an interactive map app; it needs the live browser.
  → appended to `vault/deals/redfin-batch-2026-08-28.md`.
- **Job 003 — iCash X: IDENTIFIED.** $180 one-time Whop info-product by "Cashflowkey" (= IG
  @cashflowkeyy). "Done-for-you AI" that cold-calls/texts sellers 24/7 and auto-sends contracts.
  **Verdict: ⚠️ DO NOT BUY — its two headline features are TCPA/A2P exposure and unreviewed
  auto-sent contracts, both of which CLAUDE.md forbids.**
  → `vault/research/categories/deal-analysis-tools.md`.

## ⏳ MOSTLY DONE (2026-10-12) — Chrome-blocked leftovers
(a) ✅ plat date answered 10-03 (pre-2003, Likely). (c) ✅ iCash X confirmed against BOTH posts (frame-read): verdict unchanged, logged in deal-analysis-tools.md. (b) ⛔ BLOCKED ON RICH: 'Land Insights Toolkit' 0.0.11 IS installed (Default Chrome profile, runs on redfin/zillow), but it injected NOTHING on Redfin search or listing pages (tested 22101 land + Old Chesterbrook detail). Most likely not signed in [Likely]. **Rich: click the Land Insights icon in Chrome → sign in once.** Then re-run (b). A scrape-only re-run without it would just repeat Job 001.
### Original text
Connect the Claude Chrome extension, then: (a) Fairfax GIS for Job 002 — **the Old Chesterbrook plat
date is still the deal-decider**; (b) re-run the sweep in-browser for Land Insights $/acre + Zillow
pages 2+; (c) open the two saved IG reels directly to confirm the iCash X read against the actual posts.

## ✅ DONE (2026-10-08) — Job 014: Claude in Chrome is LIVE
**Outcome (10-08 desktop):** Step 0 done (Desktop 'Claude Vault.cmd' re-copied, hash-verified = repo). CLI 2.1.295, auth=claude.ai (richfabiani@gmail.com), ~/.claude.json claudeInChromeDefaultEnabled=True (already set — not edited). Live test: tabs_context_mcp returned a real tab group (tab 1399218139) — browser hands WORK. Follow-ons: (b) Fairfax plat date was already answered 10-03 (pre-2003, Likely); what's left needs CPAN/title pull, not a browser. (a) Namecheap Google TXT NOT done — the TXT value is not in the vault, and a DNS edit is an account change that needs Rich logged in at Google Admin + Namecheap and his explicit OK. Still open as a separate task.
### Original job text

STEP 0 (do first): re-copy the updated launcher over the Desktop copy —
`Copy-Item "tools\claude-vault.cmd" "$([Environment]::GetFolderPath('Desktop'))\Claude Vault.cmd" -Force`
(the repo version now launches `claude --chrome`, so every icon-launched session has browser
hands; the Desktop copy is static and must be refreshed once).
Then follow vault/automation/claude-in-chrome-fix.md EXACTLY (it is doc-verified). The fix is
enabling integration on the Claude side (/chrome → Enabled by default), NOT reinstalling.
Log the outcome in this job AND in the fix file — success or precise failure, per the
new LOG-FAILURES rule. ALSO: after the first-run Enter, set claudeInChromeDefaultEnabled true in ~/.claude.json (local edit only — that file holds credentials, never commit/copy it). When live: immediately use it to (a) finish the Google TXT
verification clicks at Namecheap for freshgroundllc.com, (b) Fairfax GIS plat date.

## ⏳ ONE HUMAN KEYPRESS LEFT (2026-10-08) — Job 015: EYES link installed
**Outcome:** 'Claude Eyes.cmd' on Desktop (hash-verified). Test run of `claude remote-control` STARTED fine but stops at a one-time first-run consent: `Enable Remote Control? (y/n)`. Claude deliberately did NOT answer it (it grants remote control of this PC — Rich's call). Test process stopped. **Rich: double-click Claude Eyes, press y + Enter, then confirm the session appears at claude.ai/code.** FIX made: `--help` says spawned RC sessions have Chrome OFF by default, so launcher now runs `claude remote-control --chrome --name "Claude Eyes"`.
### Original job text

1. Copy `tools\claude-eyes.cmd` to the Desktop as **"Claude Eyes.cmd"** (same Copy-Item
   pattern as Job 014 step 0).
2. Double-click it once to test: a Remote Control session should start and appear in
   Rich's claude.ai Code app (and to cloud Claude as a messageable peer).
3. Log the outcome (works / exact error) per the LOG-FAILURES rule.
Usage from then on: whenever Rich wants cloud Claude to drive this PC directly, he
double-clicks Claude Eyes and leaves the window open. With Job 014's Chrome enable,
that session has browser hands too.

## ✅ DONE (2026-10-08 night) — Job 016: GMAIL ACTIVATED for freshgroundllc.com
**DNS RE-CHECK 2026-10-12 (via 8.8.8.8) [Certain]:** MX `1 smtp.google.com` ✅ · SPF `v=spf1 include:_spf.google.com ~all` ✅ · google-site-verification TXT ✅ · NS = Namecheap BasicDNS ✅ · **DKIM ADDED 10-12** (Rich generated 2048-bit key in Admin console as rich@freshgroundllc.com; TXT google._domainkey verified LIVE on Namecheap NS + 1.1.1.1, key matches; first save had typo host google_domainkey, fixed; Rich clicked Start authentication). PROVEN 10-12: Rich sent rich@freshgroundllc.com -> richfabiani@gmail.com, Show original = SPF PASS, DKIM PASS, DMARC PASS. Outbound mail DONE. Inbound (gmail -> rich@) still to confirm with a reply. · **DMARC (_dmarc) ADDED 10-12 by Rich, verified live on Namecheap NS + 8.8.8.8: `v=DMARC1; p=none; rua=mailto:rich@freshgroundllc.com` (report-only; tighten to p=quarantine after ~2 weeks of clean reports)** · root A 162.255.119.145 and www CNAME parkingpage.namecheap.com = **Namecheap parking page, no website**. Inbound delivery still UNPROVEN: the Gmail connector needs re-auth (/mcp), so no test draft was made. Rich: send any email from richfabiani@gmail.com → rich@freshgroundllc.com and confirm it arrives.
**Final outcome:** Google confirmed on-screen: "Gmail is activated! You verified freshgroundllc.com.
Gmail is ready." Full trail: (1) Namecheap Gmail preset was selected-but-never-saved → Rich saved it;
(2) Google's activation wizard REJECTED the old-style aspmx preset records — it required exactly
`smtp.google.com` prio 1 → switched Mail Settings to Custom MX (Claude drove the browser, Rich
authorized); (3) SPF `v=spf1 include:_spf.google.com ~all` added; (4) ⚠️ the google-site-verification
TXT got accidentally deleted mid-session (Rich misclick) — re-added from the vault-logged value and
confirmed live. KEEP THAT TXT FOREVER — Google re-checks it periodically.
**Still open (small):** (a) Rich to send test email richfabiani@gmail.com → rich@freshgroundllc.com
and confirm arrival in the NEW Gmail inbox (mail cutover can take up to 24h; old mail stays at
PrivateEmail); (b) recommended: DKIM via Admin console → Apps → Google Workspace → Gmail →
Authenticate email ("Authenticate outgoing emails" wizard step was offered on the success page).
### History (progress log from earlier tonight)
**Progress tonight (live session with Rich):**
- Root cause of last night's MX mystery CONFIRMED: the Namecheap Gmail preset had been selected but
  never saved — Rich found the **Save Changes** button (no green checkmark in current UI) and saved.
  Authoritative DNS flipped to Google MX (aspmx.l.google.com set) within 20 seconds; 8.8.8.8 saw it
  immediately after.
- Rich signed into admin.google.com himself (passwords are his job), passed verification, reached
  the "Add Gmail activation code" screen (wants smtp.google.com prio 1; old-style aspmx set was
  accepted), clicked Confirm → Google is now showing "Getting the domain ready — taking a few min".
- STILL TO CONFIRM when spinner ends: (1) Gmail ON in Admin console; (2) test email from
  richfabiani@gmail.com → rich@freshgroundllc.com lands in the NEW Gmail inbox; (3) SPF TXT
  `v=spf1 include:_spf.google.com ~all` added at Namecheap (old SPF was auto-deleted by the preset
  switch — outbound mail currently has NO SPF).
Earlier blocker details in `vault/inbox-for-cloud.md` Msg 001.
### Original job text
Go to admin.google.com (Rich signed in). Click Verify for domain freshgroundllc.com —
TXT google-site-verification=c2xbykn23K19iP4bA61o83zVQFqPaWEN + Gmail MX preset were
saved at Namecheap ~1h ago. Passes → finish the wizard until Gmail is active, then have
Rich send a test email from his gmail to rich@freshgroundllc.com and confirm it arrives.
Fails → capture the exact error text. Either way: log here, commit, push. Narrate as you go.

## ⏳ IN PROGRESS (2026-10-12 desktop) — Job 017: Connect +1-571-832-2832 to ElevenLabs + EAR TEST (cloud, 10-12)
**Desktop findings 10-12 (evidence: live API + VoIP.ms portal read in Chrome):**
- ElevenLabs WORKS: key in %USERPROFILE%\.elevenlabs.env valid; tier creator/active, 0/131,000 chars used;
  agent "FRESH GROUND Builder Buy-Box v1" exists (voice cjVigY5qzO86Huf0OWal, LLM qwen35-397b-a17b);
  TTS test clip generated OK (21.8 KB). Phone numbers on account: **0**.
- Live prompt is still **v1** (no "clients waiting"/"construction lender" lines). v1.1 push via API was
  BLOCKED by the Claude Code auto-mode guard ("Production Deploy") - needs Rich's approval or a UI paste.
- VoIP.ms: main SIP user 577131, balance $34.20, DID 571.832.2832 (BRADDOCK, VA) routed to [SIP] Main
  Account, **POP = San Jose-2 -> sanjose2.voip.ms (208.100.60.41)**. washington.voip.ms (208.100.60.63)
  is the closer POP for a DC number (recommend switching the DID's POP; Rich's call).
- ⚠️ **Account CallerID Number is BLANK** -> outbound calls may show unknown/blocked. Set it to 5718322832
  (Account Settings -> General) before the ear test.
- SIP password: portal masks it; can't tell if Rich knows it. If not, he sets a new one in
  Account Settings -> Security -> Main SIP/IAX Password (he types it; never logged).
- ElevenLabs web UI is SIGNED OUT in Chrome -> step 2 needs Rich to sign in (or approve the API import).
- Steps 2-4 NOT done.
**Update 10-12 afternoon:**
- Rich created VoIP.ms sub account **577131_fg** (CallerID 5718322832, SIP, user/pass). Main-account SIP
  password unknown + support phone closed -> sub account was the workaround.
- tools/connect-phone.ps1 (Desktop "CONNECT PHONE") imported the number: **phnum_4301m4s14cmae3xak2b9smzxchv8**,
  sip_trunk, outbound sanjose2.voip.ms TCP, user 577131_fg, assigned to agent_9201m3... VERIFIED via API.
- Voice: agent already on "Eric - Smooth, Trustworthy" (premade), TTS model eleven_flash_v2. Samples of 5
  voices in Desktop\Voice Samples. Rich did not pick another -> Eric kept.
- ❌ EAR TEST FAILED x2 (FAILURE LOG): API POST /v1/convai/sip-trunk/outbound-call to Rich's cell.
  (1) to_number "+1916..." -> **SIP 404 Not Found** (VoIP.ms rejects the "+"; use 11 digits "1NXXNXXXXXX").
  (2) to_number "1916..." -> **SIP 603 Declined**. Phone did NOT ring. VoIP.ms CDR (all filters incl.
  failed) shows NOTHING -> rejected before routing. Checked + ruled out: balance $34.20 positive; sub-account
  CallerID set; domestic call. Not yet ruled out: new-account outbound restriction / account verification,
  Foreign IP Guard (checkbox state unreadable), sub-account Device type/Dialing Mode. NEXT: ask VoIP.ms Live
  Chat (Mon-Fri 9-22 ET) why INVITEs from 577131_fg get 603. Don't retry blindly.
- 10-12: Gmail DRAFT reply on VoIP.ms ticket #FMOEFC (thread 1a131b29a3d07379) asking why 603 - SENT 10-12 on Rich's 'send it' (msg 1a13230b5c47852d). Next session: search Gmail from:voip.ms for the answer. When VoIP.ms answers: fix, then re-run ear test (to_number 11 digits, no '+').
- **10-12 NIGHT — 603 SOLVED (evidence: ElevenLabs stored SIP traces, `store_sip_messages`=true; read via
  GET /v1/convai/conversations/{conv}/sip-messages).** Root cause: INVITE `From: +15718322832` -> VoIP.ms (Asterisk)
  can't map it to an account, never sends 401, answers 603 in ~50 ms (so nothing in CDR). Fix = SIP From user must be
  the sub-account name (VoIP.ms staff, voip-info.org thread 28148). ElevenLabs uses the imported "phone number" as From
  user -> NEW entry **phnum_7301m4setya4ecqae6krgy0m0de7** (identifier `577131_fg`, TCP, media encryption DISABLED,
  creds set by Rich via Desktop FIX CALLER / tools/fix-caller.ps1). USE THIS ID for outbound; old phnum_4301 (+1571)
  stays 603. Result: 401 -> auth OK -> 100 Trying -> 11.5 s -> **486 Busy Here, X-Asterisk-HangupCause "Call Rejected"
  (21)** = far end/cell carrier rejected; phone did not ring. NEXT: Rich checks Silence Unknown Callers / carrier spam
  filter, or test-dial a different phone to separate carrier block from number reputation.
- **10-12 ~22:00 ET — END-TO-END WORKS.** Via phnum_7301 to Rich's Google Voice 1-916-629-4008: 401 -> 100 -> 183 ->
  **200 OK**, call ran 238 s, landed as a Google Voice VOICEMAIL (Rich confirmed). To his cell 1-916-693-1900: always
  486 "Call Rejected" (cause 21), no CDR, even after Rich turned off a phone auto-blocker -> cell-side block (GV likely
  forwards to the same blocked cell, hence voicemail). NEXT: (1) Rich plays the voicemail = ear-test verdict on voice;
  (2) number reputation before any builder call: register 571-832-2832 at freecallerregistry.com (AT&T/T-Mobile/Verizon
  analytics), set CNAM "FRESH GROUND" in VoIP.ms DID settings; (3) agent has silence_end_call_timeout=-1 and 600 s max
  -> voicemail/robot pickups run for minutes: set a silence timeout + voicemail detection before real dials (needs
  Rich's OK, auto-mode treats agent edits as deploys).
- **Test-call target (Rich, 10-12):** use Rich's Google Voice **1-916-629-4008** for ear tests until his Samsung cell
  (1-916-693-1900) stops rejecting; Rich is checking Samsung block/caller-ID settings + GV forwarding. GV is a test line
  only, not part of the calling setup. Future live-transfer target = whichever of Rich's phones actually rings.
- Ruled out 10-12 (keep, so nobody re-tries): sub/main IP+POP Restriction (off); Foreign IP Guard (portal logins only);
  device type (changed ATA -> PBX, no effect; left on PBX); TLS: VoIP.ms port 5061 only offers RSA-key-exchange ciphers
  (no ECDHE, no TLS1.3) -> ElevenLabs handshake failure, dead end; sub-account Encrypted SIP Traffic set back to No.
  Over TCP, media_encryption "allowed" makes ElevenLabs offer SRTP-only SDP -> must be "disabled" (Rich approved; the
  Claude auto-mode guard blocks Claude from doing it, so it runs from Rich's window). GOTCHA: PATCHing
  outbound_trunk_config WIPES stored credentials; VoIP.ms edit-sub page forces a new SIP password on every save.
For the bridge worker with Chrome hands, Rich present. No guessing: read each screen.
1. VoIP.ms portal (Rich signed in): confirm the main SIP account 577131 has a SIP password
   set (Main Menu → Account Settings; if Rich must set one, he types it — never log it).
   Note the assigned server/POP hostname shown in the portal (e.g. something.voip.ms).
2. elevenlabs.io → Agents → Phone Numbers → Import number → **From SIP Trunk**:
   Label "FRESH GROUND VoIP.ms" · Number +15718322832 ·
   Outbound Address = the VoIP.ms POP hostname from step 1 · Transport TCP ·
   Media Encryption Allowed · Auth username 577131 + the SIP password (Rich types it
   into the ElevenLabs form himself).
3. Assign the number to agent "FRESH GROUND Builder Buy-Box v1" (agent_9201m3gbrsdcftm8f21bygh8cwgf).
   Push the v1.1 prompt update from this file while in the agent editor.
4. **EAR TEST (pre-approved by Rich):** Outbound call → Rich's cell (he gives the number
   at the keyboard). Rich judges voice + latency. Capture his verdict.
5. Log outcome here + voice-agent file, commit, push. Real builder dials stay gated on
   per-call "send it".


## ⏳ HEADLESS PART DONE (2026-10-12 courier) — Job 018: Land Insights deep-dive with Chrome hands (Rich 10-12 — AFTER Job 017)
**Courier result:** Steps 1 + 3 are DONE. The inventory is in `vault/skills/skill-land-insights.md`. I rewired the stale Land Insights claims in S2 tax-list-mining, S5 desktop-valuation and S11 propwire to match it; S10 was already current. **Step 2 is still owed.** The 5-10 parcel test pull needs Rich's logged-in Chrome session plus his OK to spend credits on the export, so the headless courier can't do it. The next interactive desktop session should run Recipe A on 22101/22102/22180/22182, with Improvement Value MIN $100K so it stops returning HOA common land.
Rich is logged into app.landinsights.co in Chrome (his map view:
app.landinsights.co/data?onboarding=true). With browser hands, explore the ACTUAL app and
report what it can do for us (cloud cannot see past the login wall):
1. Inventory: what data layers/filters exist (owner names? $/acre comps? lot size? absentee/
   out-of-state owner flags? equity? export formats?). What does the free Lite plan include
   vs lock? Skip-trace credits remaining and cost per?
2. Run ONE real test on our turf: McLean/Vienna (22101/22102/22180/22182) — pull 5-10
   teardown-fit parcels (lot ≥0.4ac, old/small improvements) with owner info if the plan
   allows. Save to vault/deals/landinsights-test-2026-10-12.md.
3. Wire findings into the skills that reference Land Insights (S2 tax-list-mining, S5
   desktop-valuation, S10 stale-sweep, S11 propwire) — replace assumptions with what the
   tool actually does.
4. No purchases/upgrades without Rich's OK; log costs seen. Push everything.
