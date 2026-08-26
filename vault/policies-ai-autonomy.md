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

## Still open (Rich's call, not yet decided)
- **Voice/SMS platform** — Bland.ai / Vapi / Retell AI / ElevenLabs Agents+Twilio. None
  connected yet; needed before this carve-out can do anything.
- **Title company** — existing relationship to use, or should Claude research options?
- **Attorney review** of PSA / Assignment / NCND — hard gate before ANY real send/call, or
  build & test the pipeline now and get review lined up before the first real send?

## Log
- 2026-08-26 — Carve-out #1 (seller negotiation, full authority within MAO) decided.
