# S1 — Buy-Box Capture (agent: buyer-matcher) — STAGE 0, runs continuously

**Goal:** know what each builder buys BEFORE we source anything. The buy-box IS the product spec.
**Sources:** vault/buyers.md (DB) · fresh-ground-scripts.md Script 01 · call-sheets/

## The buy-box fields to capture per builder (Script 01 intake call — Rich makes the call, agent preps + logs)
1. Target submarkets (specific neighborhoods/school clusters, e.g. Langley HS)
2. Lot criteria: min/max size, shape/slope/tree constraints, utilities
3. **Land price they underwrite to** (their max lot $ by submarket) ← the key number
4. Build cost $/sqft + target margin % (lets us reverse their math)
5. Deal terms: buy direct vs take assignment · assignment-fee tolerance · proof-of-funds
6. Volume: lots per year they'll take · current appetite
7. Decision-maker + preferred contact channel

## Agent tasks
- Prep a call sheet per builder (like paramount-call-script-LIVE.md) before Rich calls
- Log every answer into vault/buyers.md ("Buyer box" section) same day
- Rank builders by (a) territory overlap, (b) appetite, (c) responsiveness
- Flag box gaps blocking sourcing (no land-price number = can't underwrite to them)
- Refresh stale boxes quarterly; log which builders actually CLOSE

## Output: an always-current buy-box table that S2/S5 source and underwrite against.
