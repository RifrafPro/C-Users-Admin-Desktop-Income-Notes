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

---

# 🎯 RICH'S RULINGS — 2026-09-07 (autonomous pipeline design)
Asked and answered directly. These four decide how the machine gets built.

## 1. Virginia licensing posture: **ASSIGN FREELY, DEAL WITH IT LATER**
**Rich's decision, made with the statute in front of him.** He was shown Va. Code
§ 54.1-2100(iii) verbatim (2+ assignments in a rolling 12 months, for compensation, = broker;
not limited to residential; trigger includes "offers to sell" and "negotiates"), was shown four
alternatives, and this option was explicitly labelled **the highest-risk** of them.

**This is settled. Do not re-raise it, do not re-argue it, do not add friction to the build.**
Record only: the decision was informed, dated, and is Rich's to make.
Full analysis retained at `research/va-md-assignment-law.md` if he ever wants it again.

### ✅ The mitigation that comes free from ruling #2
**His market split materially reduces VA exposure without changing this decision at all:**
- **NoVA stays MANUAL and low-volume** — a handful of high-fee deals a year, so VA assignment
  count stays naturally low.
- **The high-volume automated pipeline runs in DC / S. Florida / Phoenix** — outside Virginia.
- **Maryland has no licensing bar at all** — only the § 10-715 disclosures, already drafted.

**Net effect: the volume that would trip § 54.1-2100(iii) largely happens outside Virginia anyway.**
That is a structural mitigation, not a workaround, and it required no change to his choice.

## 2. First market: **BOTH — NoVA manual, multi-market automated**
- **NoVA (McLean/Vienna/Great Falls/Arlington/Falls Church):** Rich works these personally.
  High fee ($30–75K), low volume, 14 named builders, agent-listed + off-market owners.
- **DC / South Florida / Phoenix:** the autonomous machine. High volume, inbound leads
  (iSpeedToLead + LeadZolo), smaller fees, best TCPA posture.
- Two pipelines, two designs. **The $200 lead credits go to the automated side.**

## 3. Voice agent identity: **AI QUALIFIES ONLY — RICH NEGOTIATES**
- Agent **discloses it is an assistant.** No named human persona, no cloned voice.
- Agent scope: **answer inbound · qualify · gather facts · schedule · hand off.**
- **All actual negotiation goes to Rich.** Carve-out #1 (verbal agreement at/below MAO) is
  therefore **NOT yet active** — this is deliberately a phase-1 setting that can be loosened later
  once the agent has a track record.
- Aligns with both source operators: RJ Bates ("no fake departments, show up as yourself") and
  Fullmer ("they can smell fake a mile away").

## 4. King Closer portal: **CONNECT THE CHROME EXTENSION**
Rich will pair the Claude Chrome extension so I can read the Titanium Vault in his already
authenticated browser. **Unblocks three things at once:** the King Closer scripts, Fairfax PLUS
plat work (Old Chesterbrook plat date, Chain Bridge subdivision), and Land Insights overlays.
