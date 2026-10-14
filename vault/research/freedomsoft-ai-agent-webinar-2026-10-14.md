> Source: FreedomSoft live webinar "How To Use AI To Get Pre-Negotiated Leads Every Day" (Rob Swanson), 2026-10-14 11:00-12:30 PDT.
> Captured by Claude (local audio transcript + slide screenshots). Verdict: **buy nothing**; copy the method (see 'Fit' lines).

# FreedomSoft webinar 2026-10-14, running notes (Claude)
## 00-05 min
- Thesis: software covers every step except the negotiation. Now an AI agent answers seller calls 24/7, uncovers motivation, and pre-frames price and terms.
- Old flow: list → direct mail → inbound calls → you answer. Leak = missed or late answers.
- **Fit for us:** D3 letters → INBOUND calls. An AI that answers inbound calls is the low-TCPA-risk entry point (the seller calls us). It is the inbound half of Carve-out #1.
- Pipeline slide: CRM, pick mailers, send mail, capture leads, analyze, negotiate, offer, repeat.
## 05-10 min
- **"Wake up to deals" lead card (worth copying as a schema).** After the AI call, each lead shows:
  - what the seller will accept
  - what they owe
  - condition
  - value
  - cash vs terms
  - AI offer with a range (example: accept $76K, worth $154K, offer $81K, range $73-85K)
- **Fit:** add these fields to our Deal Record (`_TEMPLATE.md`) and to the lead-intake agent's output: seller_accept_price, owed, condition, deal_type, offer_low/high. Our underwriter already outputs the MAO.
## 10-15 min
- **Post-call outcome labels: CASH DEAL / TERMS DEAL / NO DEAL.** "No deal" is valuable because it saves the follow-up time.
  **Fit:** add a `call_outcome` field. It could be a second Jev question (choice: cash / terms / no_deal) run on call transcripts.
- **Pitch preview:** "stay to the end for a link to get FreedomSoft free". They bundle the CRM free with the paid AI agents (price TBD).
- **"Dig tool":** from any one lead/property, it auto-finds up to 8 related opportunities (mechanism TBD, probably same owner or nearby).
  **Fit for teardowns:** from one lot, check the adjacent parcels and the owner's other parcels. Land Insights can do this. Builders want assemblages.
## Slides seen 11:16-11:19
- "Who this is for: you buy or wholesale VACANT LAND; you already generate leads (mail, MLS...)". Land is in scope for his AI.
- Deal Negotiation lead card fields (screenshot): Interested Seller · Owner Info · Occupancy & Condition · Seller Repair Cost · Seller Value ·
  Seller Owes · Seller's Payment · Other Liens · Seller Will Accept (Lowest) · Listed For Sale · Selling Timeline · Length of Owner Occupancy ·
  Repairs By · Mortgage Info · Lender Name · Payment Status · Seller Will Accept (Absolute Lowest). Header: "Based on the seller's asking price and their options, … NO DEAL".
- "20 years of solved problems": #1 lists (county data, MLS feeds, list stacking) · #2 contacting agents · #3 marketing to sellers
  (direct mail, Deal Score, motivated sellers) · #4 more leads (CRM, automation, follow-up) · #5 offers (doc generators, e-sign, calculators).
  **Our coverage:** #1 Land Insights/Propwire ✅, #2 call sheets ✅, #3 letters (D3) ⚠️ not sent, #4 Mission Control ✅/CRM ⚠️, #5 PSA templates + SignNow ✅.
  The gap he's selling is the same as ours: the conversation with the seller.
## 15-20 min
- Dig tool = predictive analytics plus motivation targeting in the same geography. It finds 8 likely-to-close lookalikes per lead.
  **Fit:** "lookalike sweep". When a lead converts, sweep the same zip for the same lot profile. Jev can score them.
- **"NOT a cold blast list with a robot"**: his AI is not cold robocalling. It works on leads that came in (inbound mail/MLS responses + uncalled pipeline).
  Matches our consent-first rule.
- Pitch component: built-in proof-of-funds letters + "access to the money" (transactional funding). Note: we assign contracts,
  so we rarely need POF. Builders close.
- Framing slides only ("Nobody ever solved talking to sellers"; "every deal started with you on the phone").
## 20-25 min: THE AGENT JOB SPEC (copy this)
Slide: "One AI agent solves this 24/7". It does 9 things:
1. answers the phone
2. qualifies the seller
3. uncovers motivation
4. pre-negotiates price and terms
5. updates the CRM
6. hands off hot leads
7. schedules appointments
8. creates and assigns follow-up tasks
9. writes a **Deal Brief after every call**
**Fit:** this is the spec for our inbound voice agent (Carve-out #1). Deal Brief = Deal Record auto-filled. Hand-off = text Rich or open a Mission Control task.
- "Speed to lead": the gap between the seller raising a hand and the call decides the deal. The agent answers instantly.
- Slide "Count the leads nobody ever spoke to": leads in CRM vs leads actually talked to = THE GAP. "Isn't dead leads, it's unworked leads."
  **Ours:** 12 deal files, 0 seller conversations. Our gap is 100%.
- Slide "Follow the money": Lists, Email & Mail, Calls cost money; Talking to Sellers MAKES money; Offers = key to success.
## 25-32 min: THE 5-STEP SYSTEM (core of the webinar)
1. Build the list → 2. Make the phone ring → **3. AI answers & qualifies** → 4. Run the numbers → 5. Make the offer.
- **Step 1, two lists:** ON-MARKET = MLS-listed **land**, target the LISTING AGENT. OFF-MARKET = public records, target the OWNER.
  The list builder has Seller/Buyer leads × Houses/**Land** toggles.
- **Step 2, both channels produce INBOUND calls:**
  - On-market → **EMAIL the listing agent** → the agent calls in.
  - Off-market → **DIRECT MAIL to owners** → the seller calls in.
  - **Fit [Certain]:** both are TCPA-safe. No cold calls or texts by us; the AI only answers calls people make to us.
    We already have the pieces: today's sweep has 24 listing agents + emails, the domain freshgroundllc.com is live in Gmail, and the letter template (D3) exists.
    **New for us:** an *agent-email* channel for on-market lots. Email isn't covered by the TCPA; CAN-SPAM rules apply instead (real address + opt-out).
- "You don't need more leads, you need more and better conversations."
## 30-37 min
- List filters: absentee, owner-occupied, vacant, distressed landlords, on/off market. Marketing has ONE job: make the phone ring.
- "Two reasons the call never happens: you don't know what to say, or you don't feel like it" (skill vs effort). The lead cools by the hour.
- **BENCHMARK FUNNEL (his full-time team, 2 weeks, outbound calling)**: worth logging as KPI targets.
  - 782 calls → 330 good numbers (42%)
  - 244 voicemails → 94 live answers (28%)
  - script intro 1: 4 / script intro 2: 9
  - **12 interested (13% of live answers)**
  - **9 contracts sent → 5 signed (5% of live answers)**
  - **Rule of thumb:** about 19 live seller conversations per signed contract, and about 156 dials per deal.
  - **Fit:** add to road-to-deal-one as the reality check. Inbound mail/email responders should convert higher; measure ours against this.
- Slide: "Better calls GET better deals".
## 37-42 min
- **Second 2 weeks, after script training:** 767 calls · 91 live (29%) · script followed 14% (was 4%) · **26 interested (29%)** · 20 contracts sent · **11 signed (12% of live)**.
  The effort was the same; script adherence went 4→14% and deals went 5→11 ("220%").
  **Lesson [Likely]:** script adherence is the lever, so an AI that follows the script 100% beats humans. It also means **our scripts must be good**: the 10-script playbook becomes the agent's brain.
  Updated rule of thumb with a good script: **about 8 live conversations per signed contract.**
- **Agent config screen (FreedomSoft "New Voice Agent")**, fields to mirror in ours:
  Name ("Live Answer Agent - Denver") · Voice (Female/Male) · Agent Name ("Alex") · Role = Live Answer (locked) ·
  Skill = "Houses (talking to Seller)" (a land skill presumably exists) · Script modules (checkboxes):
  [x] Qualify Seller & Uncover Motivation · [x] Ask detailed property & financial questions · [x] Introduce the possibility of a Terms offer.
- Live Answer Agent: answers 100% of inbound **agent & seller** calls live 24/7, runs the full conversation, and handles objections the same way every time.
## 42-47 min
- The agent is **trained on house AND land investor conversations**. It loops/leads the seller back to the script after an objection
  ("loop and lead"), takes 9 pm calls, and runs the 400th call the same as the first.
- Persuasion section (DIY vs VA vs cold-call room vs acquisitions manager, "keep hiring people → next 3 years"). Nothing new to adopt.
- **"Loop and lead"** is worth adding to our objection-handling script (Script 05): acknowledge → answer briefly → loop back to the next qualifying question.
## 47-52 min: STEP 4 DEAL BRIEF + STEP 5 OFFERS
- **AI Deal Brief format (copy it):** a timestamped log per lead, one entry per call attempt ("No conversation (no answer)" is logged too).
  Each conversation entry is one paragraph covering:
  - decision maker confirmed
  - why selling / deadline (foreclosure in 3 days; downsized; spouse to nursing home; bankruptcy)
  - property facts + condition + repair estimate
  - mortgage payment / amount owed / taxes current or behind / liens
  - seller's as-is and fixed-up value
  - **the price they hope for**
  - open to terms?
  - timeline
  - contact
  Sidebar promise: "Owner confirmed · Motivation captured · Price they'll take · Terms they'll accept · One block in your CRM · **Yes or no in 90 seconds**."
  **Fit:** this is our lead-intake output spec. Our underwriter then adds the MAO, so Rich decides in 90 s.
- Example briefs: foreclosure in 3 days, owes $67K, repairs $35K, ARV $220K, wants a $3-4K net to relocate; no mortgage + taxes behind,
  value $300K, open to payments (terms); will take $15K quick sale, worth $22K as-is / $79K fixed.
- **Step 5:** one-click Proof of Funds letter (from "Freedom Funding, LLC", their private-money lender = pitch).
  **Note:** "agents ask for POF on every on-market offer." That's relevant to our on-market lot offers through listing agents.
  **For us:** a POF from the builder-buyer, or an EMD-only option contract. Flag for the disposition/contract README.
## 52-57 min: PITCH BEGINS (~11:55)
- One more brief: vacant, owes $340K, $3,800/mo, values $850K as-is / $1M fixed, **wants $550K cash** ("55 cents on the dollar").
  After the brief: generate a purchase agreement + POF, send by email/text.
- Summary slide: LIST (you) → RING (system) → **AI TALKS + GETS NUMBERS (agent)** → OFFER (you, 1 click). "You touch two boxes."
- PITCH: "FreedomSoft Live Answer Agent, Rob Swanson Signature Edition" + "hint: FREE CRM". Price TBD.
## 57-62 min: pitch
- The Live Answer Agent comes inside the "Rob Swanson Signature Edition" of FreedomSoft. A free solo FreedomSoft subscription is bundled.
  **Integrates with other CRMs**, so no lock-in.
- Testimonials: the agent answered a listing AGENT's call within 30 min of activation and got the seller's real bottom price "way below list".
  That supports our agent-email → inbound-agent-call channel.
- A live demo of AI calls is coming next (listen for the actual phrasing).
## 62-67 min: LIVE CALL DEMO ("Taylor", inbound seller call), opener structure
1. Greeting + **"on a recorded line"** disclosure, then "How can I help you today?"
2. Clarify intent: "are you interested in selling a property, or is there something else I can help with?"
3. Get the first name.
4. **Up-front contract:** "My role is to collect a few details about the property so our team can review and see if we can make an offer.
   After some quick questions, we'll both decide if it makes sense to connect you with a [buying specialist]. Does that make sense?"
5. "Is now a good time to talk?"
6. Address, then confirm the zip.
7. Condition sweep (house version): interior paint/flooring, ages of furnace / water heater / AC …
- The seller was curt at first ("I'm calling because you sent me something"). The AI stayed warm, and the seller opened up after the up-front contract.
- **Fit:** adopt steps 1-6 as our inbound opener. For LAND, swap step 7 for land questions (acreage, road frontage/access, utilities: sewer/water or well/septic, perc status,
  survey/plat, structures to demo, liens/taxes, heirs/decision makers).
- ⚠️ **Compliance note:** "Taylor" never said she was an AI in the part played. **Our rule:** disclose the AI up front ("I'm an AI assistant for Fresh Ground").
  Recording consent: VA is one-party consent, but **MD (Bethesda leads) is ALL-party**, so keep "recorded line" in the greeting.
## 67-72 min: more demo + pricing
- **THE PRICE QUESTIONS (verbatim-ish, copy them):**
  - "What do you think it's worth in its current condition?"
  - "What are you hoping to get out of the property? Did you have a certain price or amount of cash in mind you'd like to walk away with at closing?"
  - "What amount are you hoping to walk away with?"
  Humans avoid asking this, the AI asks it flat, and sellers answer.
- Repair conversation: "what do you think needs to be done", roof to foundation, and the seller's own repair-cost estimate.
- **Outbound speed-to-lead demo ("Nick"):** calls a web-form lead back within 60 s.
  - "Hi, this is Nick **with the AI Assistant on a recorded line**." This one DOES disclose AI.
  - "It looks like you just submitted a form online about the property at …, does that sound right?" → "Is now a good time to chat?"
  - "What prompted you to reach out today, a postcard, an online ad, or something else?" (attribution question; copy it).
  - Transition line: "Let me shift gears. Going over a few of the financial details helps our team put together the strongest offer possible.
    Are you currently making a monthly mortgage payment?"
  - Foundation/sewer question.
  - ⚠️ An outbound AI call is legal only with prior express written consent (FCC 2024: AI voice = "artificial voice" under the TCPA).
    Our web form/opt-in must carry that consent language (it's already in seller-sms-opt-in.md).
- **PRICING:** FreedomSoft Solo CRM "normally **$297/mo**, free today" bundled with the Live Answer Agent + funding package (agent price still TBD).
  It includes lists, agent contact, direct mail, skip trace, unlimited POF.
## 72-77 min: THE OFFER
- **Price: $297 today, then $297 every 30 days, PLUS per-minute AI usage (rate not stated).** Includes 1 live answer agent and the Solo CRM + funding package.
  "Waived": $997 + $297/mo CRM, $1,997 AI activation. URL: freedomsoft.com/getai. Scarcity: "limited", "off the table when this is done".
- Bonus 1 ("$4,997 value"): pre-trained agents with **4 skills = {houses, land} × {sellers, listing agents}**. Each has its own qualifying questions,
  script, and objection handling. **Design idea for us:** write 2 scripts, LAND×SELLER and LAND×LISTING-AGENT (the agent call is a different
  conversation: the seller's real bottom, the reason for the cut, dead-contract reason, other offers, will the seller take an option/EMD-light).
- Bonus 2 ("$997/yr"): nationwide MLS access with agent contacts, for stale-listing hunting. **Ours:** Redfin/Zillow scrape + Land Insights already does this for our 7 markets.
## 77-82 min: stack close
- **ARCHITECTURE (copy it):** behind the talking agent run 3 hidden agents:
  - **call-compliance agent:** keeps the call on track / within the rules
  - **lead-manager agent:** updates the CRM correctly after the call
  - **deal-brief agent:** writes the summary
  **Fit:** our pipeline is the same shape. The voice agent produces a transcript, then a compliance check, then lead-intake (Deal Record + Mission Control), then underwriter.
- Bonus 3: unlimited POF letters. Bonus 4: "money button" for transactional funding (double close). Not needed for assignments.
- Close: "$18,546 value" for $297 + $297/mo + usage. "Capped at the next 20." Classic stack-and-scarcity close.
## 82-87 min: close
- 30-day money-back guarantee ("one email"). Cap "expanded" by 5 (scarcity theatre). Small-group onboarding sessions.
- "Point your leads at the agent": you forward your inbound number / lead sources to it.
