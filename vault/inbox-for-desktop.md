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
- **Job 001 — Stale sweep** (2026-08-28): 7 markets swept, land + price-cut passes.
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
