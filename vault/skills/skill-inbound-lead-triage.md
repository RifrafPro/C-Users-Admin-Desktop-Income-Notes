# S3 — Inbound Lead Triage (agent: lead-intake) — STAGE 1, on arrival

**Goal:** every inbound lead (iSpeedToLead, replies, referrals, Rich-pasted address)
becomes a clean Deal Record within the hour it's seen.
**Source docs:** lead-gen-ispeedtolead.md · deals/_TEMPLATE.md

## Procedure
1. Capture raw lead → Deal Record (address, owner, source, asking price, motivation notes).
2. Classify play: LAND (teardown) vs HOUSE (flip) — run both exits per wholesaling.md
   §Core profit thesis; note the signals.
3. Distress screen: keywords (as-is, TLC, estate, must-sell…) + motivation flags (absentee,
   probate, tax-delinquent, pre-foreclosure, vacancy, 60+ DOM).
4. Quick box check: does ANY confirmed buyer box plausibly fit? If no box fits and it's a
   LAND play → flag "no buyer yet" (buyer-matcher decides whether to hunt a new builder).
5. Priority score (A/B/C) → queue for underwriter.
⚠️ Known gap: leads landing at anthorahproperties@gmail.com are INVISIBLE until the
multi-inbox bridge is done (multi-inbox-email-access.md). Flag any suspected miss.
