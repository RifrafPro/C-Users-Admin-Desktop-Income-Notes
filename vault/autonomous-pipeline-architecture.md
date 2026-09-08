# AUTONOMOUS PIPELINE — architecture, autonomy map, and build order (2026-09-07)

**Rich's ask:** *"100% autonomous start to finish… total coverage, workflow, from finding extremely
profitable properties to ready-to-buy strategies for quick turnaround."*

**Read this first, because it changes the plan:**

---

# 1. THE HONEST ANSWER — where the ceiling actually is

**We can get to roughly 85–90% autonomous. The remaining 10–15% cannot be automated, and the
blockers are legal, not technical.** Every one of them is a place where automating faster just
produces the violation faster. Naming them precisely is what lets everything *else* run free.

## 🔴 THE FIVE HARD GATES

| # | Gate | Why it cannot be automated | Consequence of ignoring it |
|---|---|---|---|
| **1** | **VA broker licensing** — Va. Code § 54.1-2100(iii) | 2+ assignments in a rolling 12 months, for compensation, = "real estate broker." Not limited to residential; **our vacant-lot deals are inside it.** The trigger includes *"offers to sell"* and *"negotiates"* | Unlicensed brokerage. **An autonomous machine doing this at volume is an enforcement exhibit, not a business** |
| **2** | **TCPA / A2P 10DLC** — automated calls & texts | $500–$1,500 **per message** statutory damages. This is exactly why we killed iCash X on 08-28 | The single largest liability in wholesaling, and autonomy multiplies it |
| **3** | **Contract signature** | A PSA binds **Rich personally** — there is still no LLC (`contracts/README.md`). An agent cannot sign, and cannot be given authority to bind him | Void or voidable contracts; personal exposure |
| **4** | **MD § 10-715 disclosures** | Statutorily *timed* written disclosures: one to the seller **before** contract, one to the assignee **before** assignment | Counterparty rescission without penalty up to closing, plus deposit refund |
| **5** | **Unauthorised practice of law** | Curative title strategy, probate advice, telling a seller what their legal options are | Real risk, and it is exactly the terrain our Fullmer-derived deals live on |

## ⚖️ The reframe that makes this workable
**Autonomy is not one switch. It is per-action.** The goal is not "no human." It is:

> **Every action that is legally permissible runs without Rich. Every action that legally requires a
> human stops at a gate and waits — and the gate takes him ten seconds, not ten minutes.**

The existing carve-out in `policies-ai-autonomy.md` already proves he's thought this way: full
authority to verbally agree **at or below MAO** once voice is live, with PSA-signing still gated.
**We extend that pattern to every step.**

## 🔑 THE SINGLE BIGGEST UNLOCK — inbound, not outbound
**TCPA risk collapses when the seller contacts us first.**
- **Cold** call/text from a tax list → maximum exposure, consent must be manufactured
- **Inbound inquiry** (seller submitted a form) → an existing enquiry relationship; far better footing

**iSpeedToLead and LeadZolo are inbound-inquiry leads.** That is why the **$200 in credits sitting in
those accounts right now is strategically more valuable than its face value** — it is the lead type
that lets the voice agent run closest to fully autonomous. **Build the autonomous loop on inbound
first, and treat cold outbound as the gated exception.**

---

# 2. THE AUTONOMY MAP

## 🟢 GREEN — 100% autonomous today or near-term (no human, no gate)
| Function | Skill | Status |
|---|---|---|
| Stale-listing sweeps (Redfin/Zillow, DOM, price cuts) | **S10** | ✅ working |
| Off-market teardown-owner stacks + 105 MLS keywords | **S11** | ⬜ needs Propwire account |
| County title recon — deed, liens, mortgages, probate clues | **S4** | ✅ **proved on Chain Bridge via Fairfax GIS + iCARE APIs, no browser needed** |
| Parcel/GIS/assessment/tax lookup | S4 | ✅ working |
| Desktop valuation + MAO from land residual | **S5** | ⬜ blocked on one builder land number |
| Buyer matching against buy-boxes | **S1** | ⬜ blocked on same |
| Deal Record creation + pipeline state | all | ✅ working |
| **Drafting** — offers, blasts, texts, emails, contracts | S6/S7/S8 | ✅ working |
| Comps cross-check (Land Insights ↔ Propwire ↔ county) | S5 | ⬜ |
| Follow-up scheduling, reminders, diarised dates | — | ⬜ needs CRM |
| Post-call transcript → Deal Record → next action | — | ⬜ needs voice |

## 🟡 AMBER — autonomous *within* a bounded authority
| Function | The bound |
|---|---|
| **Voice negotiation with sellers** | Carve-out #1: full authority to verbally agree **at/below MAO**. Above MAO → stop |
| **Inbound call/text answering** | Free to respond; consent posture is inbound |
| **Outbound to inbound-sourced leads** (iSpeedToLead/LeadZolo) | Permitted **after** A2P registration + DNC scrub + calling-window rules |
| **Follow-up cadence with an engaged seller** | Free until terms change |
| **Buyer-side comms with builders** | Business-to-business, far lower TCPA exposure — **this is where autonomy is cheapest to win** |

## 🔴 RED — always stops for Rich
- Signing or sending **any contract, PSA, assignment, or memorandum**
- **Cold** outbound to a person who has not enquired
- Agreeing a price **above MAO**
- Anything that reads as **legal advice** to a seller
- **Recording** an instrument against someone's title
- Spending money

---

# 3. THE ARCHITECTURE — seven layers

```
┌─ L1 SOURCING ────────── Propwire · S10 sweeps · tax lists · iSpeedToLead · LeadZolo
│                          → autonomous, continuous
├─ L2 ENRICHMENT ──────── county GIS/iCARE · Land Insights · skip trace
│                          → autonomous (S4 proven)
├─ L3 UNDERWRITING ────── as-is value · land residual · MAO · GO/NO-GO
│                          → autonomous once ONE builder number exists  🔴 BOTTLENECK
├─ L4 BUYER MATCH ─────── buy-box fit · rank builders · no-buyer = kill
│                          → autonomous once S1 captured
├─ L5 CONTACT ─────────── voice + SMS + email, inbound-first
│                          → AMBER: bounded by MAO carve-out + A2P
├─ L6 CONTRACT ────────── PSA · option · assignment · MD disclosures
│                          → RED: draft autonomously, Rich signs
└─ L7 CLOSE ───────────── title co · escrow · disbursement
                           → semi-auto: status polling autonomous, decisions gated
```

**The whole machine is currently stalled at L3 on a single missing input: one builder's land number.**
Everything upstream works. Everything downstream is blocked behind it. **That is the bottleneck, not
tooling.**

---

# 4. TOOL RECOMMENDATIONS — my input, before Rich shares his

> Standing rule respected: **buy nothing until free channels saturate.** These are ranked by
> necessity, with the free option always listed first.

## Hole 1 — VOICE (the biggest lift)
Researched 09-07. Current landscape:

| Platform | Cost | Latency | Best for | My read |
|---|---|---|---|---|
| **Retell AI** ⭐ | **$0.07/min**, pay-as-you-go, **no platform fee**, $10 free credit | **~700ms (fastest)** | Managed agent shipped in weeks | 🟢 **My pick to trial first.** Cheapest, fastest, no monthly floor — so a failed experiment costs ~$0. Handles inbound *and* outbound, qualifies, syncs to CRM |
| **Vapi** | $0.13–0.20/min + provider costs | ~750ms | BYO-model, engineering-heavy | 🟡 More control, more build. Consider later |
| **Bland** | **$299–499/mo** + $0.11–0.14/min | ~900ms | 1,000+ concurrent calls | 🔴 Wrong shape for us — monthly floor for volume we don't have |
| **Plivo** | chosen to trial 08-29 | — | telephony + AI | 🟡 Still worth the sales call; but **Retell's $0/floor makes it the cheaper first test** |
| **ElevenLabs Agents** | already on Rich's account | — | voice quality | 🟢 **Free to test right now** — already enabled as a skill |

**Recommendation: test ElevenLabs Agents (free, already have it) → then Retell ($0 floor).**
Revisit Plivo only if we need the carrier layer too.

## Hole 3 — SMS + A2P
⚠️ **Nothing sends until A2P 10DLC registration completes** — that is a hard prerequisite, not a
formality, and it takes weeks. **Start the registration now**, because it's the long pole and it
gates the whole L5 layer. Twilio or Plivo. Campaign type per `automation-stack.md`: **Customer Care**
(existing enquiry relationship), never marketing.

## Hole 4 — CRM
| Option | Cost | My read |
|---|---|---|
| **The vault itself** (git + markdown) | **$0** | 🟢 **Keep for now.** It already holds deal records, survives sessions, and I can read/write it natively. Do not replace what works |
| **REsimpli** | $99–699/mo | 🟡 All-in-one REI: list stacking, skip trace, dialer, KPI, accounting. **Revisit at deal volume 5+/mo**, not before |
| **GoHighLevel** | $97/mo | 🟡 Strong automation but **a blank slate** — no REI pipelines, no skip trace, no list stacking. More build for us, not less |
| **InvestorFuse** | $59–299/mo | 🟡 Mid/bottom funnel nurture. Narrower fit |

**Recommendation: stay on the vault until L5 exists.** A CRM only earns its cost once there are
inbound conversations to track. Adding one now is spend without a bottleneck to relieve.

## Hole 2 — E-SIGN ✅ ALREADY SOLVED
**SignNow is already connected as an MCP tool on this account.** Templates, embedded signing, invite
status. **This hole is closed — we just haven't used it.** ⬜ Load the PSA / Assignment / MD
disclosure templates in as SignNow templates and it becomes one-click at the L6 gate.

## Data — already decided, no spend
**Propwire (free)** for lists/comps/skip trace · **Land Insights (owned)** for $/acre ·
**county GIS + iCARE (free, API-accessible)** for title recon — **proven, and the single most
valuable autonomous capability we have.**

---

# 5. BUILD ORDER — dependency-correct

**Phase 0 — unblock the machine (this week, ~1 hour of Rich's time)**
1. 🔴 **One builder land number** (D1 calls). Unblocks L3 + L4 — i.e. most of the pipeline.
2. **Propwire account** → turns on S11.
3. **Verify the iSpeedToLead credit landed on the right email** (duplicate-account risk).
4. **Start A2P registration** — longest lead time, gates everything in L5.

**Phase 1 — close the loop on inbound (weeks 1–3)**
5. Test **ElevenLabs Agents** (free) on a mock inbound seller call.
6. Load **SignNow templates** — PSA, Assignment, MD disclosures, Memorandum.
7. Wire **iSpeedToLead + LeadZolo inbound → Deal Record → S4 recon → S5 MAO** end-to-end, autonomous.
8. Spend the **$200 credits** as the multi-market test (DC / S.FL / PHX).

**Phase 2 — autonomous inbound conversation (weeks 3–8)**
9. Retell trial once A2P clears; bound by MAO carve-out.
10. Transcript → Deal Record → next action, autonomous.
11. Builder-side (B2B) outbound autonomy — cheapest place to win.

**Phase 3 — resolve the VA structure** 🔴 *runs in parallel from day one*
12. **VA attorney on § 54.1-2100(iii).** Until answered, plan the VA exit around **taking title**,
    which needs capital or a JV — see Fullmer ch17/ch21.

---

# 6. WHAT'S BLOCKING ME RIGHT NOW
1. 🔴 **Chrome extension not connected** (checked again 09-07 — zero paired browsers). This blocks:
   the **King Closer portal download**, Fairfax PLUS/plat work, and Land Insights overlays.
2. 🔴 **No SMS capability exists in this session.** Hole 3 is unbuilt — I cannot text Rich, or anyone.
3. 🟡 **One builder land number** — the pipeline bottleneck.

---

# 7. 💰 THE CHEAPEST VIABLE STACK — real numbers
**Rich, 2026-09-07: "use the best and cheapest tools or skills to make this a real usable integration."**

## Already paid for or free — $0 marginal
| Layer | Tool | Cost | Status |
|---|---|---|---|
| Sourcing (on-market) | **S10 sweeps** via Firecrawl | **$0** | ✅ working |
| Sourcing (off-market) | **Propwire** — 157M properties, 105 MLS keywords, 17 lead types, free comps, 10 free skip traces/mo | **$0** | ⬜ needs account |
| Leads (inbound) | **iSpeedToLead + LeadZolo** | **$0** — $200 credits already granted | ⬜ verify email |
| Title recon | **County GIS + iCARE APIs** | **$0** | ✅ **proven on Chain Bridge** |
| Land comps | **Land Insights** | owned; $0.02–0.06/skip | ✅ |
| Underwriting / MAO | **This system** | **$0** | ⬜ needs builder number |
| CRM / pipeline | **The vault (git + markdown)** | **$0** | ✅ working |
| **E-signature** | **SignNow — ALREADY CONNECTED as an MCP tool** | **$0 marginal** | ⬜ just load templates |
| Voice (test) | **ElevenLabs Agents** — already on Rich's account | **$0** | ⬜ untested |

**→ Everything above L5 can be fully autonomous for $0/month.**

## The only real spend — L5 contact layer
| Item | Cost | Note |
|---|---|---|
| Phone number (Twilio/Plivo) | **~$1–2/mo** | |
| A2P 10DLC brand + campaign | **~$4 one-time + ~$10–15/mo** | ⚠️ **weeks of lead time — start now** |
| **Retell AI** voice | **$0.07/min, NO monthly floor**, $10 free credit | Fastest (~700ms) and cheapest tested |
| *Realistic usage:* 100 calls × 5 min | **~$35/mo** | |

## 🎯 **TOTAL TO A REAL, USABLE, MOSTLY-AUTONOMOUS INTEGRATION: ~$50/month**
And **$0 until A2P clears** — every layer except live contact runs free today.

**What we explicitly do NOT buy yet, and why:**
- ❌ **REsimpli / GoHighLevel / InvestorFuse ($59–699/mo)** — a CRM relieves a bottleneck we don't
  have. The vault already holds deal state. **Revisit at 5+ deals/month.**
- ❌ **Bland AI ($299–499/mo floor)** — built for 1,000+ concurrent calls. Wrong shape, real money.
- ❌ **PropStream / BatchLeads** — Propwire is free and covers it.
- ❌ **Vapi** — more control, more engineering. Only if Retell proves limiting.

**The principle: nothing with a monthly floor until it is relieving a real bottleneck.**
Retell's pay-as-you-go and ElevenLabs' inclusion mean a failed voice experiment costs ~$0.
