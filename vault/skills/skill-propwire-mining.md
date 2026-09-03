# S11 — Propwire Off-Market Mining (agents: lead-intake sources · underwriter comps)

**Added 2026-09-03.** Source: `vault/research/guides/flipping-mastery-jerry-norton-extraction.md`.
**Tool:** propwire.com — free Basic plan. Rich creates the account himself. Cost $0.
**Status: ⬜ NOT YET SET UP** — everything below is the runbook, waiting on the account.

## Why this skill exists
S10 (stale-listing sweep) only sees **on-market** inventory, and its 08-28 run proved the limit:
zero as-is / estate / TLC / fixer / teardown hits, because **Zillow does not expose listing keywords
or DOM on cut listings.** Propwire searches 105 motivated-seller keywords across MLS text AND gives us
17 off-market lead types. This is the channel that finds the seller *before* they list — which is the
only place a real wholesale spread lives in a market as efficient as McLean.

It also plugs the **weak-comps** hole flagged as the #1 upgrade path in `deal-analysis-tools.md`.

---

## 1. THE TEARDOWN-OWNER STACK (the highest-value thing in this skill)

Our buyer is a luxury builder who wants **dirt**. So our seller is someone who owns a **small, old
house on a big lot in a high-value zip**, owns it outright, and has no intention of renovating.
Propwire's stacked lists build that avatar directly. Run per target zip:

**Filters — the teardown avatar:**
- **Lot size:** ≥ 0.4 acre (raise to ≥ 0.75 ac for Great Falls / Oakton)
- **Year built:** ≤ 1975 — an old house on expensive dirt is a demolition candidate
- **Living area:** ≤ ~2,200 sqft — small house + big lot = the land is the value
- **Equity:** High equity / free-and-clear — no lender to negotiate around, seller can move fast
- **Stack any ONE of:** `Inherited` · `Absentee owner` · `Vacant` · `Preforeclosure` · `Tired landlord`

**Target zips (from S10):** 22101 · 22102 (McLean) · 22180 · 22181 · 22182 (Vienna) · 22066 (Great
Falls) · 22124 (Oakton) · 22205 · 22207 (N. Arlington) · 22043 · 22046 (Falls Church) ·
20816 · 20817 (Bethesda MD)

**Why `Inherited` is the top filter:** an heir who inherited a 1960s rambler on a 0.5-acre McLean lot
has no emotional attachment, often lives out of state, frequently has siblings who want cash, and does
NOT want to manage a renovation. That is the FRESH GROUND avatar exactly. This is also the probate
channel we previously had no source for — S2 tax lists were our only off-market feed.

## 2. THE KEYWORD PASS (runs alongside S10, fixes its documented gap)
On the MLS side, search listing text for the language that says *the house doesn't matter*:

> teardown · tear down · scrape · lot value · land value · build your dream home · as-is · sold as is ·
> estate · estate sale · probate · TLC · fixer · handyman special · investor special · needs work ·
> cash only · bring your builder · builder opportunity · rare opportunity · being sold for land

Combine with **Expired Listings + high equity** — an expired listing is a seller the market already
told "no," which is the same motivation signal as the 100+ DOM screen but *cheaper to reach*, because
they're between agents and not fielding 40 investor calls.

## 3. COMPS + SKIP TRACE (feeds S5 and S4)
- **Comps:** filter by **lot size** and year built, not just beds/baths — for a teardown play we want
  what *dirt* trades for, not what finished houses trade for. Cross-check against Land Insights
  $/acre. Two independent sources = the confidence upgrade S5 has been asking for.
- **Skip trace: 10 free/month.** Spend them only on **A-rank** leads after S4 title recon.
  ⚠️ **Deep Trace flags mobile vs landline — obey it.** Never SMS a landline, and every text still
  runs through the A2P/TCPA gate in `automation-stack.md`. Free data does not relax the send rule.

## 4. AGENT CHANNEL (from Norton's "Double Dip")
Norton names agents as one of only two lot-sourcing methods, and our 08-28 sweep already handed us a
list of stale-lot listing agents **with direct phone numbers**. Work them as a channel, not one-offs:
- Offer to let the listing agent **represent both sides** — they earn both commissions, which is the
  entire reason they'll call you first next time.
- Ask every agent the standing question: *"What lots do you have that haven't hit the MLS yet?"*
- An agent sitting on a 300-day listing (Chain Bridge) is the most receptive person in the market.

## 5. LEAD ALERTS — turn the sweep from pull to push
Create a **Saved Search per target zip** with the teardown stack, alerts on. Propwire's DB updates
daily. This converts S10 from a manual weekly sweep into an inbound feed, and gets us to sellers
before the investor crowd. **Set this up once; it pays every week after.**

---

## Standing rules (inherited from `skills/README.md` — none are relaxed here)
- Agents research/compute/DRAFT autonomously. **No call, text, mail or blast to a real person without
  Rich's "send it."** A free skip-trace number is still a real person's phone.
- Control-Before-Disclosure: no address to any buyer until PSA-signed or NCND.
- Every hit becomes a Deal Record in `vault/deals/` so state survives the session.
- **Buy nothing.** Propwire Basic is free; if it ever demands payment, stop and re-evaluate against
  PropStream/BatchLeads rather than auto-upgrading.

## Setup checklist (do once)
1. ⬜ Rich creates the free Propwire account at propwire.com (own credentials, not ours to make).
2. ⬜ Build + save the teardown stack for the 13 target zips; enable alerts.
3. ⬜ Run the keyword + expired-listing pass; write hits into `vault/deals/`.
4. ⬜ Spot-check Propwire comps against Land Insights on a known parcel (0 Linway Ter is a good
   control — we already have its full history) to calibrate how much to trust it.
5. ⬜ Log results back here with a "first run" note so we know the tool's real hit rate.
