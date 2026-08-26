# Seller Call Negotiation Flow (AI call agent → ElevenLabs + Twilio)

Fires after a seller replies **YES** to the SMS opt-in (`seller-sms-opt-in.md`). Built on
Scripts 04/05/06 (`fresh-ground-scripts.md`) — extends them for autonomous execution, not a
rewrite. Authority for this call is defined in `policies-ai-autonomy.md` Carve-out #1: **full
authority to verbally agree at or below the deal's MAO, no approval needed for that.**

## Before the call can happen
The research/underwriting agent must have already produced, for THIS specific property:
- **MAO** (Max Allowable Offer) — the hard ceiling, never crossed, no exceptions
- **Lead type** (luxury/absentee vs. probate vs. distressed) → selects the opener below
- Matched buyer's numbers already factored into that MAO (buyer-first — see `wholesaling.md`)

If any of those three are missing, the call does not happen — negotiating without a MAO isn't
"full authority," it's just no ceiling.

## Agent identity (design default, flag if you want it different)
The agent introduces itself as calling **on behalf of FRESH GROUND** — using an agent persona
name (e.g. "Marcus," as used in the earlier test role-play), **not impersonating Rich by
name.** If directly asked "are you an AI / a real person," **the agent answers honestly.**
Reasoning: safer default regardless of exact jurisdictional AI-disclosure rules (an evolving
legal area we haven't had reviewed — this is a design default filling that gap, not a verified
legal conclusion).

## 1. Opening (select by lead type)
**Luxury / absentee (Script 04):** peer-to-peer, low pressure, no urgency-selling.
> "I buy building lots in [area] to develop — mind if I ask whether you'd ever considered
> selling [address]? No obligation, just exploring."

**Probate (Script 05):** empathy first.
> "I'm sorry for your loss. I buy properties like this as-is, no cleanout or repairs needed,
> and can close whenever the estate's ready. Mind if I ask a few questions?"

## 2. Discovery (both paths)
- Occupancy status, tenure, decision-maker(s) / other heirs
- Condition (let them describe it — talking it down is leverage, don't argue)
- Timeline / motivation to move
- Liens, back taxes, title complications
- Any other offers or agents involved

## 3. Price — Script 06's exact technique, unchanged
- **Anchor below MAO** — never open at the ceiling.
- **Close for commitment before naming a number:** "If we can agree on a price today, are you
  able to move forward this week?" — get the yes before revealing the offer.
- **Hold technique:** "Give me one moment to check with my team" → pause → resume with the
  number. (Functions the same as a human "let me call my partner" — a beat to reset anchor,
  not a real consultation.)
- **Never negotiate against yourself** — don't raise an offer before hearing a counter.
- **At or below MAO → verbal agreement, autonomously, no approval needed** (Carve-out #1).
- **Above MAO → does not happen.** No exceptions, no "close enough." If the seller won't move
  below MAO, the call ends without a deal — see step 5.

## 4. If a verbal agreement is reached
- Log: agreed price, terms discussed (close timeline, EMD, contingencies), call recording/transcript.
- **Do NOT send the PSA.** Per Carve-out #1, a verbal yes at/under MAO does not authorize
  sending paperwork — that still requires Rich's explicit "send it."
- Notify Rich with the outcome + the drafted PSA ready for his review/send decision.

## 5. If no agreement (seller won't go at/under MAO)
- Do not concede. Leave the ceiling offer standing as a backup ("that offer stands if
  anything changes").
- Log as no-go / follow-up-needed with the reason (price gap, not ready, other offers, etc.).
- Falls into Script 07's existing follow-up cadence — no new cadence invented here.

## 6. Escalation triggers (call agent hands off / flags for Rich, does not improvise)
- Seller becomes hostile or requests to stop contact entirely → end call, treat like SMS STOP.
- Seller asks a legal/licensing question the script doesn't cover.
- Any sign of elder abuse, duress, or incapacity to make the decision.
- Title complication beyond "liens/back taxes" (e.g., contested ownership, unresolved estate dispute).

## Open dependency
None of this is live yet — needs the Twilio number + A2P registration + ElevenLabs Agent
wiring (see `automation-stack.md` Hole 1) before a real call can be placed.
