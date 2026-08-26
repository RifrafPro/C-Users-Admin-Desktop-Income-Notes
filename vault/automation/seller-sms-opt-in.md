# Seller SMS Opt-In Flow (AI call agent → ElevenLabs + Twilio)

Purpose: the FIRST outbound text to a seller lead, gaining explicit consent before the call
agent ever dials. Precedes Script 06 (negotiation). Builds on Script 07's compliance rules —
does not replace the longer nurture cadence in Script 07, which still applies on no-reply.

> Design note: registered under Twilio's **Customer Care** A2P use-case (see
> `automation-stack.md`), on the reasoning that every recipient already submitted a lead
> through iSpeedToLead — an existing inquiry, not cold prospecting. Still unverified: whether
> iSpeedToLead's own lead form captures proper consent language for follow-up contact (open
> item in `lead-gen-ispeedtolead.md`).

## The message
> "Hi [first name] — this is [FRESH GROUND / agent persona name], following up on the info
> you submitted about your property at [address]. Open to a quick call to talk through your
> options? Reply YES for a call, or STOP to opt out."

If no name on file:
> "Hi — this is [FRESH GROUND], following up on the info submitted about your property at
> [address]. Open to a quick call? Reply YES for a call, or STOP to opt out."

## Reply handling (keyword-based — see note below)
| Reply | Action |
|---|---|
| **YES** / yes / sure / ok / y | Trigger the call agent to place the call (same-day, business hours). |
| **STOP** / unsubscribe / quit / cancel | **Immediate, permanent suppression.** Log to DNC. No further contact ever — this is a hard compliance requirement, not a judgment call. |
| No reply within 48h | One soft follow-up (Script 07's Day-2 tone), then fall into the existing Script 07 nurture cadence (Day 5, Day 9). Do not invent a new cadence here. |
| Anything else (question, "who is this", ambiguous) | **Escalate — do not auto-reply conversationally.** Flag for Rich's review. |

> ⚠️ **Design choice, not an assumption:** this flow only auto-acts on clear YES/STOP
> keywords. Free-form conversational texting back and forth was never explicitly authorized —
> only "text to opt into a call" was. If you want the agent handling open-ended text replies
> too, that's a separate decision to make explicitly (same pattern as the MAO carve-out).

## What the call agent needs before it can text anyone
- Twilio phone number provisioned + A2P 10DLC campaign registered (Customer Care use-case)
- The lead's phone number + address (from the Deal Record / iSpeedToLead)
- Nothing here is live yet — this is the script, ready for when the infrastructure exists.
