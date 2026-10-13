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
