# Email Triage Policy — automated & continuous

Decided 2026-08-26 (Rich). Runs against **richfabiani@gmail.com** (the connected inbox).
⚠️ Does NOT yet cover anthorahproperties@gmail.com — the multi-inbox bridge
(`multi-inbox-email-access.md`) is still not set up, so leads/builder replies landing there
are invisible to this triage. That's the real blocker to "complete" — fix that first if you
want the highest-value mail included.

## The rule (Rich's exact framing)
**Auto-archive ONLY if it's pure junk** — not project-relevant AND not personally important.
When in doubt, leave it alone and flag it. Never guess on an ambiguous one.

## 🔒 RULE ZERO — check this FIRST, before any other classification (Rich, 2026-08-26)
**Anything self-sent — From: or To: richfabiani@gmail.com or anthorahproperties@gmail.com,
sent by Rich to himself/between his own accounts — is ALWAYS project-relevant and must NEVER
be auto-archived, regardless of what the content looks like.** This is how Rich bookmarks
tools, ideas, and research for FRESH GROUND (the whole backlog of IG/FB reel links, "7 skills
part 1," etc. earlier this session are exactly this pattern). A self-sent email that superficially
resembles marketing content is still protected — the self-send is the signal, not the content.

## Buckets
1. **Project-relevant** (FRESH GROUND / Income Notes) — leads, builder/buyer replies, title
   company replies, iSpeedToLead, system emails from tools we use (Twilio, SignNow, GitHub,
   Firecrawl, ElevenLabs, Retell). → **Keep in Inbox, never touched.** Label if useful for
   findability, but don't archive.
2. **Personally important** (life-relevant, even if unrelated to the business) — bank/financial
   institution alerts, order/shipping confirmations, bills, calendar invites/notifications,
   tax/medical/insurance/government mail, anything with real personal-life consequence.
   → **Keep in Inbox, never touched.**
3. **Pure junk / bulk marketing** — newsletters (Beehiiv, etc.), community/course platform
   notifications (Skool), retail promo blasts (FragranceNet, vintage-muscle-style VIP codes),
   sales-funnel pitches (alperhacs-style "days to lock it in", AskForFunding-style investor
   spam), marketing-automation platform nudges (GoHighLevel, ManyChat limit warnings — note:
   ManyChat/service-limit warnings arguably lean toward #2 if Rich actually uses that service
   for something live; use judgment, flag if unsure). → **Auto-archive + label** (removes from
   Inbox, does NOT delete — fully reversible, findable via the label).
4. **Ambiguous / unsure** — doesn't confidently fit 1–3. → **Leave in Inbox, label as
   `Needs-Review`, do nothing else.** Never guess into an action.

## What junk-handling actually does — UPDATED 2026-08-26 (Rich: "delete the garbage")
- Apply the label `Auto-Archived-Junk` (for audit trail, in case anything needs tracing back)
- **Trash it** (Gmail Trash, not permanent delete — recoverable ~30 days if a classification
  turns out wrong, then auto-purges). This replaces the original "just archive, never trash"
  default — Rich wants actual junk gone, not just decluttered-but-lingering.
- Still **never**: mark as spam (spam-marking trains filters and can affect deliverability from
  senders Rich may still want mail from later) or permanently delete.

## What triage does NOT do
- **Never send or reply to a real person automatically** — that stays under the standing rule
  (draft only, Rich's explicit "send it"). Triage only files/labels; it doesn't compose
  outbound mail on its own.
- Never touches anything already outside `in:inbox` (sent, drafts, existing archive) — only
  acts on new/current Inbox mail.

## Mechanism — continuous & automated
A scheduled Routine fires periodically (see trigger `FRESH GROUND email triage`), each run:
1. Search `in:inbox` for mail not yet processed (newer than last run, or unlabeled by this system)
2. Classify each thread into one of the 4 buckets above using this policy
3. Act per bucket (archive+label junk; label ambiguous as Needs-Review; leave 1–2 untouched)
4. No report needed for routine runs with nothing notable; flag anything genuinely urgent

## Log
- 2026-08-26 — Policy decided + first live pass run manually. Recurring trigger set up.
