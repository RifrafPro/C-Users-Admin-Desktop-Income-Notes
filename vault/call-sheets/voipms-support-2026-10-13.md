# VoIP.ms tech support call — morning 2026-10-13
**The one sentence:** "New account 577131, DID +1-571-832-2832. Inbound/config is fine;
OUTBOUND calls via SIP trunk from ElevenLabs fail. What is blocking outbound on my account?"

## Have on screen before dialing
1. VoIP.ms portal → CDR / call records: any failed outbound attempts listed? Note the
   exact error/disposition codes (this is the evidence they'll ask for).
2. The trunk settings desktop Claude configured (POP hostname, auth user, transport).

## Questions in order
1. Is outbound calling ENABLED on this new account, or does it need manual activation /
   additional verification? (New accounts often have outbound restricted until reviewed.)
2. Is a Caller ID number required to be set before outbound works? (Set it to
   571-832-2832 if so.)
3. Does my account's POP accept SIP from third-party cloud platforms (ElevenLabs), or is
   there an IP/registration restriction I must loosen?
4. Transport: UDP vs TCP on your side — what does my POP accept? (Our platform sends TCP.)
5. If they fix something: stay on the line, have desktop Claude re-run the ear test live.

## Context notes
- ElevenLabs trunk shows configured OK per Chrome-hands check 10-12 evening; failure is
  specifically outbound via VoIP.ms.
- Separate issue, NOT for this call: ElevenLabs dashboard login failing for Rich (the
  agent + Creator sub live on that account) — needs its own artifact when Rich gets to it.
