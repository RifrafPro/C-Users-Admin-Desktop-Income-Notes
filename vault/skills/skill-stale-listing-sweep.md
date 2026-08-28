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
