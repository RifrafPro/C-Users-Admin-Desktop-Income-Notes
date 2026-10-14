# Jev (claude-x-jev): FRESH GROUND listing triage

The live preset is at `~/.claude/jev-presets/fg-listing-triage.json`, and this folder holds a backup copy.
Model: `typesafe/jev-1.13` (pinned). Key: user env var `OPENROUTER_API_KEY`. Never install the gate hook.

## Smoke test, 2026-10-13: 5 listings from `deals/stale-sweep-2026-08-28.md`
Each Jev label is compared against Claude's rank from the sweep.

| Listing | Sweep rank | v1 (raw listing text) | v2 (precomputed signals) |
|---|---|---|---|
| 2754 Chain Bridge | A, so pursue | pursue 1.00 ✅ | pursue 1.00 ✅ |
| 9338 Campbell | A, so pursue | pursue 1.00 ✅ | pursue 1.00 ✅ |
| 0 Linway Ter | B, so watch | **pursue 0.88 ❌ (confident miss)** | watch 0.97 ✅ |
| 1037 Springvale | false positive, so skip | pursue 0.56 ❌ (flagged unsure) | skip 0.55 ✅ (unsure, goes to Claude) |
| 2106 Bobbyber | house, so skip | skip 1.00 ✅ | skip 1.00 ✅ |

Each run cost $0.0001 and took 0.6 s.

**Lesson:** Jev can't reliably do arithmetic on raw price history. v1 read Linway's 17% cut as 20% or more. v2 passes
precomputed numbers instead (`pct_below_original_ask`, `dead_contracts`, `seller_financing`, `dom_days`),
and Jev only judges. The script or Claude computes the numbers, and Jev picks the label.

**Caveat:** v2's criteria were adjusted using these same 5 listings, so the 5/5 result is not proof yet.
Next, run a held-out test on the ~20 B-rank rows in the sweep before trusting any automatic routing.
Jev also can't catch facts the listing hides. The county record later downgraded Chain Bridge, and only title/GIS checks catch that.

## Held-out test, prepared 10-13 but not run yet
Input: `heldout-items-2026-10-13.json` (19 B-rank rows, Linway excluded). Fields where the sweep has no data are set to `"unknown"`.
Expected labels come from the v2 rules applied by hand:
- **watch (9):** 9th-st-s, 5th-st-s, 28th-st-s, madrillon, knolewood-2, knolewood-5, 83rd-pl, finley, pine-ln. Each has DOM over 200 as its only signal.
- **skip (2):** anchorage (likely unbuildable) and blake-ln (remnant outlot), per the skip rule.
- **NO RULE MATCHES (8):** oakton-dr, w-ox, leesburg-pike, idylwood, patowmack, jeffery, golden-woods, old-reston. These are land with 0 signals, a gap in v2. Watch where Jev puts them: if it says pursue, that's a false positive. Fix the criteria (watch = "at most one signal") **before** running, or the gap rows only measure noise.

**Reality check (10-13 underwriting):** Jev said pursue at 1.00 on Campbell, but the county codes it non-buildable, and the listing text never said so.
Jev agreed with Claude's ranks; Claude's ranks were wrong too. Treat a Jev triage as "worth researching", never "worth offering".

## Held-out test RUN, 2026-10-14 (v2 unchanged): 19 items, $0.0005, 1.1 s
Output: `heldout-run-2026-10-13.jsonl`.
- **watch (9 expected): 9/9 correct**, confidence 0.94-0.98.
- **skip (2 expected): 1/2.** anchorage skip 0.85 ✅. blake-ln (remnant outlot) → watch 0.22 ❌, but a near coin-flip
  (watch 0.48 / skip 0.47), so it is low-confidence and routes to Claude anyway.
- **Gap rows (8, land with 0 signals): all → watch** at 0.46-0.62 confidence. **No false "pursue"** anywhere.
- Score on rows with a defined answer: **10/11**, and the one miss was flagged unsure.
- **New problem [Certain]:** only 1 of 19 came back `_sure`. Most action labels were confident; what made them "unsure"
  was `motivated_seller`, which landed in the 0.25-0.75 dead zone on almost every row. That question tells Jev to read
  `price_history`, a field the input doesn't send. As-is, the router would send 18/19 items to Claude, so it saves nothing.
- **v3 fixes (next):** (1) watch = "at most one signal"; (2) motivated_seller reads the precomputed fields, not `price_history`.
