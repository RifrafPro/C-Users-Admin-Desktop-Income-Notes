# Filling the Holes — Automation Stack for FRESH GROUND

The 4 holes between "deal desk" (what Claude does now) and "hands-off agency," and the
REAL tools that plug into THIS Claude system. Researched 2026-08-07.

Legend: 🔌 = native claude.ai connector (one-click, I can use its tools directly) ·
🛠️ = needs a bridge I build (I have the `mcp-builder` skill) or Zapier · 🧠 = I already do this.

## Hole 1 — VOICE: call sellers & negotiate; call title co.
- 🧠 Already enabled as SKILLS on this account: **ElevenLabs `agents`** (build real-time
  voice AI agents), **`text-to-speech`**, **`speech-to-text`**. ElevenLabs Agents can run
  outbound phone negotiations (pairs with a Twilio number).
- 🛠️ Turnkey AI callers (API-first, built for outbound REI volume):
  - **Bland.ai** — outbound at scale, API-first. ~$299–499/mo, ~$0.11–0.14/min.
  - **Vapi** — dev-grade, low latency. ~$0.05/min base (~$0.13–0.31 all-in).
  - **Retell AI** — REI-focused alternative.
  Integration: their API → I wrap it as an MCP tool (mcp-builder) so my agents trigger
  calls + read transcripts, OR bridge via Zapier.
- ⚠️ Requires: an account + a phone number + A2P registration. Biggest lift of the four.

## Hole 2 — E-SIGNATURE: send the contract, get it signed  ← EASIEST WIN
- 🔌 Native connectors (connect once at claude.ai, then contract-prep sends + tracks):
  - **DocuSign** — industry standard; buyers/title trust it. (getAgreements, workflows)
  - **SignNow** — send_invite, create_from_template, embedded signing. Cheaper.
  - **PandaDoc** — create-from-markdown, send, track signature status. Great for templates.
  - **DocuSeal** — low-cost, create_template / send_documents.
- Recommendation: **DocuSign** (trust) or **SignNow/PandaDoc** (cost). Pick one, connect it,
  and I can send the Assignment of Contract and watch for the signed-back status.

## Hole 3 — SMS: seller text cadence (Script 07), A2P-compliant
- 🔌 **Twilio** connector (note: the native tools are docs-only; real send needs Twilio
  API via a bridge) · 🔌 **OneSignal** (messaging/templates).
- 🛠️ REI-specific (A2P-registered, drip built-in): **REsimpli** (you already emailed
  yourself this), **Launch Control**, **Smrtphone** — bridge via Zapier.
- ⚠️ A2P 10DLC registration required no matter which (federal compliance, honor STOP).

## Hole 4 — CRM / transaction coordination / escrow timing
- 🧠 Knowing WHEN to act (inspection deadline, when to open escrow, close date) + tracking
  it — I do this natively in the Deal Record. No tool needed for the "knowing."
- 🛠️ **REsimpli** = all-in-one REI CRM (dialer + SMS + drip + pipeline) — could cover
  Holes 1+3+4 in ONE platform. Bridge via Zapier.
- 🔌 **Zapier** connector = universal glue to REsimpli / dialers / anything without a
  native MCP.

## What I can do TODAY with zero new tools
- 🧠 Parse leads, comps, the land-math, buyer matching, draft every message/offer/contract,
  track all deadlines. 🔌 Send **email** (buyer blasts to builders) via Gmail on your OK.

## Recommended minimal stack to a first automated deal
1. **E-sign (now):** connect DocuSign or SignNow → contracts send + track automatically.
2. **Voice+SMS+CRM (one platform):** REsimpli (you already looked at it) → Zapier bridge,
   or ElevenLabs Agents + Twilio number if you want custom.
3. **I build** the MCP wrappers (mcp-builder) so my agents drive them directly.

## Sources
- Bland.ai (real estate voice agents); Vapi (outbound); Retell AI; CloudTalk/Lindy 2026 reviews.
