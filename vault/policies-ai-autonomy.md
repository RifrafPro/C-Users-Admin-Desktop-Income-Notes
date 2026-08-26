# AI Autonomy Policies — what agents can do without a human "send it"

The standing default (CLAUDE.md) is: agents research/compute/DRAFT autonomously, but
**NEVER** send a contract/offer/blast, or place a call/text to a real person, without Rich's
explicit "send it." Carve-outs to that default are decided one at a time, precisely, and
logged here — nothing is ever assumed broader than what was actually agreed.

## Carve-out #1 — Seller negotiation calls (decided 2026-08-26, Rich)

**Once the voice-call pipeline actually exists and is live** (platform chosen + connected,
phone number provisioned, A2P 10DLC registered, SMS opt-in flow built — see
`automation-stack.md` "Hole 1 — VOICE" for current status), the call agent is authorized to:
- Text a seller lead an opt-in (e.g. "reply YES to receive a call about your property at
  [address]")
- Place the call once the seller opts in
- **Negotiate live and verbally agree to a price, autonomously, as long as it is AT OR BELOW
  the pre-computed MAO (Max Allowable Offer) for that specific deal.**
- No human review or approval is required before that verbal agreement.

### This carve-out does NOT extend to:
- **Sending the PSA for signature.** Even after a verbal yes at or under MAO, the actual
  contract still requires Rich's explicit "send it" before it goes out for real signature.
  Verbal agreement ≠ authorization to execute paperwork.
- **Any price above the computed MAO.** That goes back to Rich — no exceptions, no "close
  enough."
- **The buyer side.** Disclosure to a matched buyer and sending the Assignment of Contract
  are separate steps, still under the standard rule unless/until decided otherwise.

### ⚠️ Not yet active
This is **documented policy for when the infrastructure is built**, not live capability
today. Nothing changes about what any agent can currently do — there is no voice platform
connected, no phone number, no A2P registration, no opt-in text flow. Until all of that
exists (see `automation-stack.md`), this carve-out has nothing to attach to.

## Decided (2026-08-26, Rich)
- **Voice/SMS platform: ElevenLabs Agents + Twilio.** ElevenLabs Agents already enabled as a
  skill on this account (no new signup); Twilio number + A2P 10DLC registration still needed
  before any real call/text can go out. See `automation-stack.md` Hole 1 for build status.
- **Title company: more research needed.** Rich has no existing relationship to default to —
  Claude is researching real options (see `automation-stack.md` for findings). Nothing gets
  contacted without Rich's explicit "send it," same as any other real-person outreach.
- **Attorney review: NOT required at this point.** Rich's explicit call — no hard gate.
  ⚠️ Honest flag, stated once: PSA / Assignment / NCND remain attorney-*unreviewed* drafts;
  proceeding without that review is a real legal-exposure tradeoff Rich has knowingly accepted
  to move faster. Not re-litigating this — it's his call, logged so it's not silently assumed.

## Log
- 2026-08-26 — Carve-out #1 (seller negotiation, full authority within MAO) decided.
- 2026-08-26 — Platform = ElevenLabs+Twilio; attorney review not required; title co. research in progress.
