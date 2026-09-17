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

## ⬜ OPEN — Job 010: KILL THE WRONG-FOLDER TRAP (Rich 09-17, DO FIRST — it caused today's failed sync)
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

## ⬜ OPEN — Job 009: Install the COURIER — automatic cloud↔desktop bridge (Rich 09-16, PRIORITY 1)
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

## ⬜ OPEN — Job 004: Multi-market motivated-seller sweep (PRIORITY — Rich 08-29)
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

## ⬜ OPEN — Job 005: Olivia + hedge-fund reel cluster (context: vault/research/hedge-fund-buyer-strategy.md)
Watch/read these 5 saved items in Rich's browser (logged into IG):
1. instagram.com/reel/DcXZEmcCLQ0 ("Olivia wholesaler")
2. instagram.com/reel/DcfSDzIiWGs ("Olivia AI wholesaler")
3. instagram.com/reel/DW5SzppAhlg ("Top 10 cities for hedge fund buyers") — list the 10 cities
4. instagram.com/p/DbinZdJDpO3 ("Step by step for hedge fund selling") — carousel, capture all steps
5. instagram.com/reel/DbPhrjSTXfO ("Auctions to hedgefunds")
Capture: who Olivia is (handle/name/what she sells), her exact strategy steps, whether it
acknowledges the 2026 institutional pullback, any named funds/portals/tools.
→ Append findings to vault/research/hedge-fund-buyer-strategy.md, push.

## ⬜ OPEN — Job 006: Tyson Smith free-content deep extraction (context: research/guides/luxury-wholesaling-tyson-smith-extracted.md)
In Rich's browser (logged into YouTube/Skool):
1. youtube.com/watch?v=VzFzHIef1FQ (11/10 Podcast ep39) + youtube.com/watch?v=OEvNVYrn0lQ
   (free coaching call w/ Matthew Tooker) — watch/skim transcripts (YouTube "show transcript"),
   capture every concrete tactic: deal sourcing, negotiation lines, EMD/double-close mechanics,
   buyer-finding, named tools.
2. Find Tyson's main YouTube channel + skool.com/@tyson-smith-3229 posts — list any other
   free meaty content worth extracting.
3. Do NOT sign up for anything, no email opt-ins, no purchases.
→ Append findings to the guide file, push.

## ⬜ OPEN — Job 007: Watch the "Wholesale software" webinar (Rich's attend link, already registered)
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

## ⏳ STILL OPEN (blocked on the Chrome extension)
Connect the Claude Chrome extension, then: (a) Fairfax GIS for Job 002 — **the Old Chesterbrook plat
date is still the deal-decider**; (b) re-run the sweep in-browser for Land Insights $/acre + Zillow
pages 2+; (c) open the two saved IG reels directly to confirm the iCash X read against the actual posts.
