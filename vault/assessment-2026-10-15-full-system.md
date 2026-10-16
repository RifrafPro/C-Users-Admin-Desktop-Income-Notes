# FULL SYSTEM ASSESSMENT — 2026-10-15 (Rich asked: "total honesty", every process, every gap, everything Claude needs)

## 0. The uncomfortable answer first
**The system is built far ahead of the business. In ~10 weeks: 0 builder conversations, 0 seller conversations,
0 contracts sent, 0 offers.** [Certain] (vault: `road-to-deal-one.md` D1 "three builder calls" was the bottleneck on
2026-08-29 and is still open today.) Every tool we add before the first send is polish on an engine that has never
turned over. The single biggest flaw is not a missing tool. **Nothing has gone out the door.**
The fix is not more building. It is three sends this week (section 9), then autonomy grows from real reps.

Second hard truth: **autonomy is earned per step, not switched on.** Each step below gets a "graduation rule":
Rich approves N real reps with zero corrections → that step becomes autonomous. That is how we get to hands-off
without one bad email, contract or call burning a builder relationship or hurting a distressed seller.

---

## 1. Process-by-process audit (start → finish)

| # | Step | What exists | Flaw | Fix | Who gates now | Graduates to autonomous when |
|---|---|---|---|---|---|---|
| 1 | **Lead gen: listings** | Redfin/MLS sweeps, Jev triage (preset v4), 6-check gate | Manual trigger; "<30 days = skip" rule fails | Script pre-filter, then scheduled courier sweep (Rich allows) | Rich turns on schedule | 2 weeks of sweeps with no bad "pursue" |
| 2 | **Lead gen: off-market** | Letter template, tax-delinquent idea, Land Insights (5,000 cr) | **Letters never mailed.** Tax-delinquent lists never pulled | Pull Arlington/Fairfax delinquent lists; 100-letter batch | Rich approves list + letter | After 3 batches |
| 3 | **Lead gen: iSpeedToLead** | Account under anthorahproperties email | **Lead forward never wired** → leads invisible to Claude | Connect that Gmail to claude.ai, or set the forward | Rich (one-time setup) | Immediately after wiring (read-only) |
| 4 | **Inbound calls** | AI agent live on 571-832-2832, auto Deal Brief | v1.1 untested; Samsung blocks the number | One test call; fix phone block | — | Already autonomous (qualify only) |
| 5 | **Listing-agent info calls** | Outbound agent v0.1, carve-out #2 | Preview was weak; v0.1 untested; Claude Code blocks Claude from placing calls | Morning retest; see §7 on the call block | Rich "send it" per batch | 5 clean calls scored ≥ pass |
| 6 | **Underwriting** | Underwriter agent + deal-killer gate | **Every MAO is a guess** — no builder has ever given a land price | Builder email/calls (step 7) | — | Autonomous now; *accurate* only after step 7 |
| 7 | **Buyer list** | 14+ named builders, emails for 5 | **0 confirmed buy-boxes, 0 relationships.** List built from websites (who markets), not sales (who buys) | §2 below | Rich "send it" on emails | After 10 sends with no complaint/bounce issue |
| 8 | **Seller offer / negotiation** | Scripts 04-06, carve-out #1 policy | No negotiation agent built; carve-out paused by Rich's 09-07 ruling (AI qualifies, Rich negotiates) | Keep Rich negotiating until MAOs are builder-calibrated | Rich | After 3 real deals + calibrated MAOs |
| 9 | **Contracts / e-sign** | PSA, Assignment, NCND, MD disclosures (md + PDF). SignNow connected | **Only the NCND is in SignNow, and it has NO signer roles → it cannot be sent as-is** [Certain, checked live today]. PSA/Assignment not uploaded. Attorney-unreviewed | §3 below | Rich "send it" every contract | **Never fully** — signature-bearing docs stay Rich-approved (1 click) |
| 10 | **Title / escrow** | Eastern Title researched (Rachel Carter, investor team) | **Never contacted.** No intake, no fee sheet, no EMD wiring process | §4 below | Rich "send it" on intro | Opening a file per deal can be autonomous after first close |
| 11 | **Proof of funds** | Rich may have a letter | Not stored anywhere Claude can find; unclear when used | §5 below | Rich every time | Stays gated (it's a financial document) |
| 12 | **Disposition** | Disposition agent, blind teaser, NCND-before-address rule | Never run | Works once 7 + 9 exist | Rich "send it" | After 2 deals |
| 13 | **Close / fee** | Assignment flow through title | Never run | Title company process (§4) | Rich | — |
| 14 | **CRM / tracking** | Mission Control (live), vault deal records | OK for now; no buyer-relationship timeline | Add `buyers` collection to Mission Control with last-touch dates | — | Autonomous |
| 15 | **Email sending** | Gmail connector = richfabiani@gmail only | **freshgroundllc.com not connected**; no mailing address → CAN-SPAM footer incomplete | Rich connects it + gives address | Rich | — |
| 16 | **Backups** | GitHub (works), Drive mirror | **Drive mirror broken** (connector auth error) | Reconnect Drive at claude.ai | Rich (one click) | — |

---

## 2. Buyer list + relationships (Rich's item 1) — the #1 build
**Why it matters most:** builders only trust a wholesaler who (a) knows their box, (b) sends few deals, all of which fit, and
(c) shows up with control (signed PSA) and clean diligence. That trust is built **before** the first deal, by touches.

**The fix, in order:**
1. **Find who actually BUYS, from public sales data (Claude can do this now, free).** Arlington's open data API and Fairfax's open
   GIS sales layers list recent sales of land and teardowns with buyer names. Every LLC that bought a lot in our ZIPs in the last 12
   months = a proven buyer at a known price. That also gives *real land prices*, the thing every MAO is missing. [Likely] (APIs are
   already mapped in `.claude/agents/underwriter.md`; whether the buyer-name field is populated for every sale is unverified.)
2. **Builder intro email** (drafted, `call-sheets/builder-intro-email-2026-10-14.md`): asks where they buy, what they pay, how they buy.
3. **Relationship cadence** (new — build a script for each):
   - Day 0 intro email → Day 4 bump → Day 8 one phone call (Rich or, later, AI with consent).
   - On reply: 10-min buy-box call → log in `buyers.md` + Mission Control `buyers` collection.
   - **Monthly "market note"** to every buyer: 3 recent lot sales near their box + one sentence on what we're working. Keeps us known
     without pitching. Claude drafts from sales data automatically.
   - **First deal to a builder = over-prepared:** zoning letter or status, survey/plat, title commitment status, utilities, photos.
     A "Deal Package" PDF template (Claude builds it) — this is what makes them trust "we have a solid deal."
4. **Tiering:** A = gave us a number + said yes to assignments · B = replied · C = no reply. Deals go to A first, 24-hour exclusive.

---

## 3. Contracts + e-sign (Rich's item 2)
**Platform: stay on SignNow** — already connected, Claude can create from template, send, and watch status. Switching costs time for no gain. [Certain]
**Fix list:**
1. Add **signer roles** to the NCND template (it currently has none). Either Rich opens it in SignNow and adds roles "Builder" + "FRESH GROUND"
   (3 minutes, baby steps provided), or Claude re-uploads the PDF with role/field tags. Claude can do the second with Rich's OK.
2. Upload **PSA** and **Assignment of Contract** as SignNow templates with roles (Seller / Buyer; Assignor / Assignee) and fill-in fields
   (price, EMD, feasibility days, close date, fee). Then any deal = "create from template → fill fields → Rich clicks approve → send."
3. **Agent-listed lots don't use our PSA** — the listing agent uses NVAR forms. Our PSA is for off-market sellers only. [Certain]
4. ⚠️ **New information, so raising it (not re-arguing the 08-26 attorney decision):** the vision now targets **distressed homeowners**
   (pre-foreclosure, people losing their way of life). That is a legally different category from teardown lots:
   - **Maryland PHIFA** (Protection of Homeowners in Foreclosure Act, Md. Real Prop. §7-301+) puts strict rules on buying a home in
     default from its owner: specific contract wording, rescission rights, limits on what you can take. Violations can void the deal
     and carry penalties. [Certain it exists and targets this; Likely it covers wholesale assignments of a homeowner's residence]
   - Virginia and DC have their own foreclosure-rescue / consumer-protection rules. [Likely; specifics unverified]
   - **Recommendation:** before the first pre-foreclosure homeowner contract, one flat-fee attorney review of the PSA for that use
     (~$300-800). Teardown lots from estates/absentee owners can proceed on the current drafts as Rich decided.

## 4. Title / escrow (Rich's item 3)
**Default: Eastern Title, Arlington investor team** (Rachel Carter, 240-833-3085, investor@easterntitle.com). They advertise wholesale
assignment closings, double closes and novations. [Certain — verified page content 08-26]
**The flow Rich described works:** builder can bring their own title company OR we already have the file open at Eastern, so the builder
only wires funds. Opening escrow at signing makes our deals look more "solid" to builders.
**Fix:**
1. Intro email to Eastern (Claude drafts; Rich "send it"): ask their wholesale intake, fees, how the assignment fee is shown on the
   settlement statement, EMD holding, and whether they'll open a file on a signed PSA with no buyer yet.
2. Get their **order form / intake** so Claude can open a file per deal (autonomous after the first close).
3. **Wire-fraud rule (new, permanent):** wiring instructions are only ever confirmed by phone to a number from Eastern's website,
   never from an email. Claude never relays wiring instructions. This is the #1 way real-estate money gets stolen.
4. Line up a **backup**: District Title (has a VA/MD wholesale article). For a builder who insists on their own company, our Assignment
   says the fee is paid at settlement by whichever title company closes — fine either way.

## 5. Proof of funds (Rich's item 4)
Agreed: only when required (e.g. listing says "POF required with offers", as some of ours did). Rules:
- Rich sends Claude the letter once. **It is stored outside GitHub** (local folder or Drive), never committed. It may show bank info.
- Claude attaches it only when the listing or agent requires it, and only on an offer Rich already approved.
- Note: a wholesaler's POF can be questioned if the buyer will be a builder via assignment. Honest wording in the offer protects Rich.

---

## 6. Website — buyers + sellers post, look and collaborate (next goal)
**Honest assessment: a full two-sided marketplace is a 2-3 month software project, and part of it conflicts with our own rule.**
- Our **Control-Before-Disclosure** rule says no address is shown until we have a contract or an NCND. A public "post and browse
  properties" board shows addresses to everyone. So the public side must show **blind listings** (area, lot size, price band); details
  unlock after login + e-signed NCND (SignNow embedded signing can do this). [Certain the conflict exists; the design solves it]
- Facilitating other people's deals for a cut on a public platform looks more like brokerage than our own assignments do.
  The 09-07 licensing ruling covers *our* assignments; it was not about a marketplace. Design the site so we are always the
  contract buyer, never a middleman taking a commission on strangers' deals. [Likely]

**Phased build (Claude can build all the code; Rich provides accounts):**
| Phase | What | Claude needs |
|---|---|---|
| A (1-2 weeks) | **freshgroundllc.com** landing site: "Sell your property / Facing a hard situation?" seller page with intake form → Deal Brief; "Builders & investors: join our buyer list" buy-box form → buyers list; phone 571-832-2832; honest, helpful tone | A free **Cloudflare Pages or Netlify** account (Rich signs up), and Rich updating **Namecheap DNS** (baby steps). Form backend: the same host or a free Supabase project |
| B | Buyer portal: login, blind deal feed matched to their buy-box, NCND e-sign unlocks details | Supabase (auth + database), SignNow embedded signing |
| C | Seller portal: seller sees their deal's status, documents, timeline; resources page for distressed situations (foreclosure options, probate help, tax relief, HUD counselor links) | Same |
| D | Open "collaborate" features (other wholesalers/agents posting) | Attorney check first (licensing) |

Phase A is the real win: it gives the social media something to point to, and every form fills our lists automatically.

## 7. Facebook + Instagram
**What I can't do today:** I have **no connection to Rich's Facebook or Instagram.** No Meta connector exists in this setup. [Certain]
Options, best first:
1. **Meta Business Suite + Zapier** (the Zapier connector is installed but not signed in): Rich connects his Facebook Page and
   Instagram Business account to Zapier once → Claude can draft and schedule posts, with Rich approving each one at first.
2. **Claude in Chrome** in Rich's logged-in browser: Claude can audit the profiles today and prepare posts; Rich clicks Publish.
3. Meta Graph API with a developer app: most powerful, most setup. Later.
**Required facts:**
- Real-estate ads to homeowners fall under Meta's **"Housing" Special Ad Category**: no targeting by age, gender or ZIP, a 15-mile
  minimum radius. [Certain] Organic posts aren't affected.
- Content plan (Claude drafts): educational posts on options for people in distress (probate, tax sale, foreclosure timelines,
  inherited property), local market notes, and done-deal stories with permission. Helpful first, "we buy" second.
- **What I need from Rich:** the Page name + IG handle, and admin access via one of the options above.

## 8. The mission — helping people, profits and charity
This changes how we build, not just what we say:
- **Pre-foreclosure homeowners** get a "save your home first" path before any purchase talk: loan-modification/HUD counselor
  referrals, reinstatement, short sale, listing with an agent if that nets more. Sometimes the right answer is "don't sell to us."
  This is also the legal protection (§3.4) and the reputation that makes social media work.
- **Seller-first disclosures on every call and contract:** we are investors, we may assign the contract, you can get another opinion.
- **Charity:** pick a fixed % of each fee now (e.g. 5-10%) and a vehicle (a donor-advised fund costs nothing to open at
  Fidelity/Schwab Charitable). A public pledge also builds trust on social. Rich's call on the % and cause.
- **Entity (raising once more because the scope changed):** a public website + ads + distressed homeowners + charity under
  Rich personally is real exposure. A Virginia LLC is ~$100 at the SCC and fixes the A2P/EIN issue too. Strongly recommended
  before the website goes live. Rich's call.

---

## 9. What I can't do / need from Rich — the complete list
**Access (one-time, Rich clicks):**
1. Connect **rich@freshgroundllc.com** Gmail at claude.ai → Connectors (sends from the business address).
2. A **mailing address** for email footers (a UPS Store mailbox keeps the home private; Rich already uses #1132).
3. Reconnect **Google Drive** (backup mirror broken).
4. Connect the **anthorahproperties** Gmail (iSpeedToLead leads), or set the forward.
5. **Zapier** sign-in + Facebook Page/Instagram link (or a Chrome session for audits).
6. **Cloudflare Pages/Netlify** account + Namecheap DNS (website). Later: Supabase.
7. **Outbound calls:** Claude Code's safety classifier blocks me from placing calls. I will not work around it. Rich can (a) keep
   running `! bash tools/place-call.sh` himself (one line per batch), or (b) add a permission allow-rule for that one script.
   Option (a) is fine until calls are proven.
**Decisions:**
8. LLC yes/no. 9. Attorney review for the distressed-homeowner PSA (before targeting pre-foreclosure). 10. Charity % + vehicle.
11. Monthly budget (letters ~$70/100, ElevenLabs credits, website ~$0-25/mo, Supabase free tier).
12. Where the POF letter lives.
**Limits Claude can't remove:**
- I can't work overnight unless a session or scheduled run is active. This assessment was done tonight, in-session.
- I can't sign contracts, wire money, hold escrow, or enter bank/SSN data. Those stay with Rich and the title company.
- Legal conclusions are [Likely] at best. An attorney is the only [Certain].

## 10. This week, in order (the sends that start the engine)
1. **Morning:** Boris roleplay retest (5 min) → if it passes, Boris info call (Rich "send it").
2. **Builder intro email** to 5 builders — needs only the mailing address + FG Gmail connected.
3. **Eastern Title intro email** (Claude drafts today; Rich "send it").
4. Claude (no gate): pull Arlington + Fairfax lot sales → proven-buyer list + real land prices → re-run Monroe MAO.
5. Claude (no gate, Rich OK to upload): SignNow roles on NCND, upload PSA + Assignment as templates.
6. Rich: LLC decision; FB/IG access path; website accounts.
