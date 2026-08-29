# FRESH GROUND Task Board — agents × skills × stages

Created 2026-08-28. Mirrors the live session task list (survives container resets — THIS
file is the durable copy; re-create session tasks from it if needed).
Skills live in `vault/skills/` (S1–S9). Every outbound send is gated by Rich's "send it".

## Pipeline tasks
| # | Task | Agent | Skill | Blocked by | Status |
|---|---|---|---|---|---|
| T1 | Capture Paramount + Zimmermann buy-boxes (call sheets ready; Rich makes contact, agent logs) | buyer-matcher | S1 | — | PENDING |
| T2 | Fill remaining Tier-1 buy-box gaps (Botero, Paradigm, Classic Cottages, BeaconCrest, Whitestone) | buyer-matcher | S1 | T1 | PENDING |
| T3 | Pull + filter Fairfax/Arlington/Falls Church delinquent tax lists (≥2yr, tenure, absentee) | lead-intake | S2 | — (needs web/Firecrawl session) | PENDING |
| T4 | Cross-ref tax parcels vs buy-boxes → skip trace (**Land Insights ext — Rich runs export**) → Deal Records | lead-intake | S2 | T1+T3 | PENDING |
| T5 | Title recon + underwrite the batch → GO/NO-GO + MAO per deal | underwriter | S4+S5 | T4 | PENDING |
| T6 | Draft offers + structures (option vs PSA, heir silos) for GO deals | seller-negotiator | S6+S7 | T5 | PENDING |
| T7 | Blind teaser + NCND flow for first controlled deal (SignNow roles sub-task open) | disposition | S8 | T6 | PENDING |
| T8 | Eastern Title onboarding + escrow checklist (curative-work question) | deal-orchestrator | S9 | — parallel | PENDING |
| **T11** | **Stale-listing sweep (100+ DOM, all types, multi-market) — desktop Claude gathers, cloud processes. PRIORITY per Rich 08-28: "low-hanging fruit first"** | desktop Claude + lead-intake | S10 | — READY NOW | PENDING |

## Infrastructure tasks (unblock automation)
| # | Task | Owner | Status |
|---|---|---|---|
| T9 | Voice pipeline: **PLIVO-FIRST plan (08-29)** — Rich: Twilio refund + Plivo sales call/demo (call sheet: vault/call-sheets/plivo-sales-call.md, dealbreaker Qs + ear-test). Pass → Claude builds negotiation agent (MAO ceiling, escalate rules, Rich-first test call). Fail → Retell trial same week. Activates Carve-out #1 | Rich call · Claude build | IN MOTION |
| T10 | Multi-inbox bridge (anthorahproperties → richfabiani), runbook ready | Rich (~10 min browser) | PENDING |

## Critical path
T1 → T4 → T5 → T6 → T7 (first assignment fee). T3 runs parallel to T1. T8 parallel anytime.
T9/T10 unblock automation but don't block the first manual-gated deal.

## Rules reminder
- Draft-only outbound; "send it" gates every send/call/text (Carve-out #1 pending T9).
- Control-Before-Disclosure on every buyer touch.
- MAO is a ceiling, never a target to hit.
