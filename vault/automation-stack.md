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

## DISPOSITION — "multiple buyers on one deal" platform (decided 2026-08-08)
Rich's saved platform (Gmail, emails-to-self) = **InvestorLift** (`get.investorlift.com`).
Verified: **$6k–$36k+/yr, for volume teams** → premature at 0 deals. Shelf it; take free demo.
- 🔌 **START:** **REsimpli** (`resimpli.com`) — dispo built in (buyer list/tag/blast + AI
  voice callout) AND covers voice+SMS+CRM. One signup, ≈$99–299/mo.
- 🛠️ **REsimpli-alt for pure reach:** **Deal Run** (`dealrun.ai`) — address → ranked cash
  buyers + email/SMS blast, ≈$99/mo (InvestorLift function, 60× cheaper).
- Rich is setting up accounts (2026-08-08). When live → import buyers to `vault/buyers.md`,
  wire disposition step to blast through it.

## CONTRACTS — templates drafted (2026-08-08)  ← Stage 5b DONE
Live in repo `vault/contracts/` + mirrored to Drive:
- **PSA** (Seller → FRESH GROUND): assignable "and/or assigns", 10-day feasibility exit,
  as-is, low EMD, wholesaler disclosure.
- **Assignment of Contract** (FRESH GROUND → builder): assignment fee, non-refundable deposit,
  fee paid on settlement statement, direct seller→assignee title.
- ⚠️ Get a **VA real-estate attorney** to review both once (~$300–500) before first real use.
  Off-market → custom PSA; agent-listed → NVAR/Virginia REALTORS® forms.

## What I can do TODAY with zero new tools
- 🧠 Parse leads, comps, the land-math, buyer matching, draft every message/offer/contract,
  track all deadlines. 🔌 Send **email** (buyer blasts to builders) via Gmail on your OK.

## E-SIGN — phased decision (2026-08-22, Rich)
**Phase 1 (now):** connect the CHEAPEST option just to send **non-circumvention agreements**
to builders (fits buyer-first + Control-Before-Disclosure — builder signs before any address
is shown). Low stakes, no attorney review needed to start.
**Phase 2 (when negotiating real deals — PSA/Assignment, attorney-reviewed):** SHOP AROUND for
the most efficient/cheapest platform at that volume — don't assume Phase 1's pick is the final
answer. Revisit DocuSign (trust, pricier) vs SignNow/PandaDoc/DocuSeal (cheaper) once real
seller-contract volume is known.

## E-SIGN — ✅ CONNECTED 2026-08-22: SignNow
Connected + verified live (list_documents/list_all_templates both returned successfully,
empty account as expected). Tools available: upload_document, create_template, send_invite,
create_embedded_invite/editor/sending, get_invite_status, get_signing_link, etc.
Next: draft + upload the non-circumvention agreement as a reusable SignNow template, then
send_invite to Tier-1 builders (Paramount, Zimmermann, Sekas, LUKA) before disclosing any address.

## E-SIGN — chosen + connect steps  (STATUS: awaiting Rich to connect at claude.ai)
Recommended: **DocuSign** (title cos + builders trust it) — or SignNow/PandaDoc for cost.
Claude CANNOT self-connect a connector (it's an OAuth login only Rich can do). Steps:
1. claude.ai → profile/settings → **Connectors** (a.k.a. "Directory"/"Add connectors").
2. Search **DocuSign** → **Connect** → log into DocuSign → approve access.
3. Make sure it's **enabled for this chat** (connector toggle in the chat's tools).
4. Tell Claude "DocuSign is connected" → Claude verifies its tools load, then wires it
   into the contract step (send Assignment of Contract + track signed status).
Once connected, the disposition/contract flow can: create from template → send for
signature → watch status → notify Rich when signed.

## Recommended minimal stack to a first automated deal
1. **E-sign (now):** connect DocuSign or SignNow → contracts send + track automatically.
2. **Voice+SMS+CRM (one platform):** REsimpli (you already looked at it) → Zapier bridge,
   or ElevenLabs Agents + Twilio number if you want custom.
3. **I build** the MCP wrappers (mcp-builder) so my agents drive them directly.

## TITLE COMPANY — research started 2026-08-26 (Rich: "more research needed", nothing contacted)
Candidates found via web search (snippets only — direct site fetch blocked by network egress,
NOT independently verified beyond what's below):
- **Eastern Title** (easterntitle.com/virginia/arlington/investors) — dedicated Arlington
  investor page; explicitly markets wholesale assignments, double closings, distressed
  properties/clouded titles, same-day/next-day closings for assignment contracts. Strongest
  fit on paper.
- **District Title** (districttitle.com) — has a blog post specifically on VA/MD wholesale
  transactions; suggests real experience with our exact deal structure.
- **Federal Title** (Arlington office, 20+ yrs) — general practice, not investor-specific.
- **Northern VA Title & Escrow** — positive reviews from McLean closings, general practice.
- ⚠️ VA-specific legal fact surfaced: simultaneous "dry" double-closings (funding the first
  close with the END BUYER's money) are treated as illegal in Virginia. Our model uses
  ASSIGNMENT (not double-close) as primary method, which sidesteps this — relevant only if a
  deal ever forces a double-close instead.
- Next step (when Rich is ready): call/email 1-2 of these to confirm they work with new
  wholesalers, ask their process + fees — still requires Rich's explicit "send it" per standing rule.

## VOICE PLATFORM — DECIDED 2026-08-26: ElevenLabs Agents + Twilio
Already enabled as a skill on this account (no new signup for ElevenLabs). Still needed before
any real call/text: Twilio phone number provisioned, A2P 10DLC registration (federal SMS
compliance, required regardless of platform), the SMS opt-in script, and wiring the call
agent's negotiation logic to pull each deal's live MAO from underwriting. See
`vault/policies-ai-autonomy.md` for the exact authority the call agent has once this is live
(full authority to verbally agree at/below MAO; PSA-sending still requires "send it").

## Sources
- Bland.ai (real estate voice agents); Vapi (outbound); Retell AI; CloudTalk/Lindy 2026 reviews.
