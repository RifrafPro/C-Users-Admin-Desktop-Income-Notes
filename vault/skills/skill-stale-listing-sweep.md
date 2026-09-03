# S10 — Stale-Listing Sweep ("low-hanging fruit") (agents: desktop Claude gathers · lead-intake processes)

**Added 2026-08-28 (Rich):** focus on EASY motivated sellers first — **100+ DOM on-market**,
all property types (land, teardowns, probate estates, traditional wholesale houses), and
NOT one geography — sweep wherever deals pencil. No RPA/problem-lot complexity unless the
discount screams. No price ceiling — only buyer fit (Rich's rule).

## Sweep spec (desktop Claude runs in Rich's browser, weekly or on demand)
1. Markets: McLean · Vienna · Great Falls · Falls Church · Arlington · Oakton · Bethesda/
   Chevy Chase/Potomac MD · + anywhere a buy-box points. Expand freely.
2. Redfin/Zillow filters per market: (a) LAND listings any DOM 60+; (b) HOUSES with
   100+ DOM; (c) price-cut flag on; (d) keyword pass: as-is, TLC, estate, fixer,
   investor, teardown, "sold as is", cash.
2b. **EXPIRED-LUXURY TIER (added 08-29, ex-Tyson Smith method):** in each market's premium
   zips, flag listings that had long DOM + price cuts and then DISAPPEARED with no sold
   event (Zillow price-history confirms). Expired = motivated seller, agent contract dead,
   direct-to-owner outreach, no listing-agent friction. Track one zip repeatedly so
   "disappeared" stands out. These outrank active stale listings.
3. For each hit capture: address, ask, DOM, cuts (dates+amounts), lot size, zoning if
   shown, Land Insights overlay data, listing agent+phone, listing URL.
4. Save to vault/deals/stale-sweep-YYYY-MM-DD.md → git add/commit/push.

## Cloud processing (lead-intake S3 + underwriter S4/S5 on each batch)
- Classify LAND vs HOUSE play → distress score (DOM + cuts + keywords + tenure)
- Title recon on A-rank · MAO once buy-box exists · agent-listed = NVAR forms via agent

## Motivation math (why 100+ DOM works)
Every month listed ≈ carrying cost + fatigue. 100+ DOM + price cut = seller who has already
accepted the market said no at their number. Our honest-lowball frame (S6) fits perfectly:
"I'm not your highest offer — I'm the one who closes."

## Resources (all owned — buy NOTHING new yet)
Browser+Land Insights (desktop Claude) · county records (free) · iSpeedToLead (inbound) ·
escalate to PropStream/BatchLeads/ListSource ONLY when free channels saturate.
❓ iCash X: unidentified (login-gated IG saves 08-07/08-15) — desktop Claude to open + report.

---

## 🔧 UPGRADE 2026-09-03 — add the Propwire keyword pass (fixes this skill's known blind spot)

The 08-28 run of this skill returned **zero** as-is / estate / TLC / fixer / teardown hits and could not
apply the 100+ DOM screen to houses at all. That was not a market finding — it was a **tool limit**:
Zillow does not expose listing-description keywords, and hides DOM on price-cut cards.

**Fix:** run **S11 (`skill-propwire-mining.md`) as step 2b of every sweep.** Propwire searches 105
motivated-seller keywords across MLS listing text and exposes expired listings + equity %, which is
exactly the cohort this skill was written to find. Redfin/Zillow stay the source for DOM, price-cut
dates and agent phones; Propwire supplies the keyword + off-market layer they cannot.

**Also learned on the 08-28 run — carry these forward:**
- **Cross-check DOM across both sources.** Zillow "days on Zillow" counts across relistings; Redfin
  "Listed X days" counts the current listing only. They disagreed by 361 days on one lead. Record both.
- **Read the full price history, not the cut badge.** The single biggest "price cut" in the sweep
  (1037 Springvale, −$3,000,888) was a listing typo corrected six days later. A cut only means
  motivation when the history shows a *pattern* — repeated cuts, a dead contract, a relist.
- **A dead contract is the strongest signal on the board.** Both A-rank finds had one, and neither
  would have surfaced from the DOM screen alone.
- **Zillow list pages lazy-load** — page 1 only unless you walk pagination. Header counts lie.
- **The house side of this sweep is structurally weak.** On-market price cuts in these zips are
  overwhelmingly builders trimming spec pricing. Move the house screen to S11's off-market
  inherited/absentee stacks and S2 tax lists; keep S10 focused on **LAND**, where it actually works.
