# Call Sheet — Plivo sales/demo call + Twilio refund (prepped 2026-08-29)

## PART 1 — Twilio refund (do first, ~10 min, mostly self-serve)
1. **Release the phone number first** (stops the monthly charge): console.twilio.com →
   Phone Numbers → Manage → Active Numbers → select the number → Release. (It was never
   published anywhere — safe to drop.)
2. **Request the balance refund:** Twilio refunds *unused credit-card top-ups* on account
   closure. Console → Help/Support → open a ticket: "Please close my account and refund my
   remaining balance of ~$50 to the original card. Account was never used in production;
   A2P registration was not completed." → they may route you to the account-closure flow
   (Settings → General → Close Account triggers the refund review).
3. If they push back: ask for "refund of unused promotional-free balance excluded, paid
   balance refunded" — paid top-ups are refundable; free/promo credits are not.
4. Keep the confirmation email → forward to yourself so it lands in the vault flow.

## PART 2 — Plivo call: what we MUST learn (their sales: via plivo.com "Talk to sales" /
## request-demo form — they typically book a demo fast for AI Agents product)

### The dealbreaker questions (in priority order)
1. **Custom agent brain:** "I have my own negotiation script and hard business rules —
   a price ceiling the agent can NEVER exceed, and an escalate-to-human rule. Can your AI
   Agents run a fully custom prompt/flow like that, or am I limited to your templates
   (lead-qual, support)?" ← if templates-only, Plivo is OUT → Retell.
2. **Latency, both kinds:** "What's your answer-to-first-word time on outbound calls with
   answering-machine detection OFF? And your average turn latency mid-conversation?"
   (Acceptable: first word <1s; turns ≤0.8s. Ask them to DEMO it live on the call.)
3. **The live demo test:** "Call my cell right now with one of your agents. Let me feel it."
   — judge with your own ears: pickup gap, turn gaps, interruption handling (talk OVER it
   and see if it recovers).
4. **Outbound compliance:** "For B2C outbound calls to homeowners in Virginia — what do I
   need on your platform? Any registration like 10DLC for voice? What about when I add
   SMS later?" (SMS will need 10DLC campaign registration — ask them to walk you through
   THEIR process and how long it takes; this is where Twilio lost us.)
5. **Which LLM powers it + can we choose?** (Claude/GPT choice matters for negotiation
   quality — ask if we can bring our own model/key.)
6. **Verify pricing:** "$0.05/min AI + ~$0.0115/min outbound + $0.50/mo per number,
   pay-as-you-go, no monthly minimum — is that accurate and complete? Any hidden
   platform fee? What does the $25 Starter plan actually gate?"
7. **Integration:** "Can the agent hit a webhook mid-call or post-call with the outcome
   (price agreed, notes, recording + transcript)? I need results flowing into my own system."
8. **Recording + transcripts** included? Cost? (We need both for the vault + compliance.)
9. **Human transfer:** "Can it warm-transfer to my cell when it hits an edge case?"

### Context to give them (safe to share)
Real-estate acquisitions; outbound calls to property owners who opted in by SMS/inbound
interest; single agent persona; low volume to start (tens of calls/mo, scaling later).
Do NOT share: MAO logic details, buyer names, or anything strategic.

### Decision rule after the call
- Custom brain YES + demo felt human + pricing confirmed → **BUILD ON PLIVO** (T9 → build)
- Any dealbreaker → **Retell trial** same week, no further deliberation.
