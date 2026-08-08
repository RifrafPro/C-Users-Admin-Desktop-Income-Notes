# Multi-Inbox Email Access — how to let Claude + the agents see BOTH inboxes

**Problem (confirmed 2026-08-08):** Rich runs two separate Google accounts:
- **richfabiani@gmail.com** — the account Claude's Gmail connector is authorized to (this is
  what I can read/draft from). Also the noisy one (lots of newsletters/marketing).
- **anthorahproperties@gmail.com** — Rich's **business-facing** inbox. This is the address
  **Rob Zimmermann (Zimmermann Homes) emailed.** Claude is NOT connected to it → I can't see
  Rob's reply or anything that lands there.

The Gmail connector = **one Google account per OAuth authorization.** These are two distinct
Gmail accounts (both @gmail.com, so NOT Google Workspace → no admin delegation option).

---

## ✅ THE FIX — Option B: make richfabiani the hub (do this; ~10 min, all in browser)

Keeps Claude's current connection intact and pulls Anthorah's mail into view.

### Step 1 — Forward Anthorah's mail into richfabiani (so I can READ Rob)
In **anthorahproperties@gmail.com**:
1. Settings (gear) → **See all settings** → **Forwarding and POP/IMAP**.
2. **Add a forwarding address** → `richfabiani@gmail.com` → Google emails a confirmation code
   to richfabiani; open it, click the confirm link.
3. Back in Anthorah settings → select **"Forward a copy of incoming mail to
   richfabiani@gmail.com"** → **keep Gmail's copy in the Inbox** → Save.
✅ Result: every email to Anthorah (incl. Rob's) now also appears in richfabiani → I can see it.

### Step 2 — Let sends go OUT as Anthorah (so replies come from the right name)
In **richfabiani@gmail.com**:
1. Settings → **Accounts and Import** → **"Send mail as"** → **Add another email address**.
2. Enter `anthorahproperties@gmail.com`, name "Anthorah Properties" (or "Rich Fabiani |
   Anthorah Properties") → verify with the code Google sends.
3. Optional: set it as default for replies to Anthorah threads.
✅ Result: from richfabiani I can compose, and Rich can send, **as Anthorah**.

### Step 3 — Keep business mail out of the newsletter swamp (recommended)
In **richfabiani@gmail.com**: Settings → **Filters and Blocked Addresses** → **Create filter**:
- Match: `to:anthorahproperties@gmail.com` → **Apply label** `Anthorah-Business`
  (+ optionally "Never send to Spam", "Mark as important").
✅ Result: forwarded Anthorah/builder mail is labeled + findable; I can search `label:Anthorah-Business`.

---

## ⚠️ Honest limitations (so expectations are right)
- **Reading** Rob's mail: fully solved by Step 1. ✔
- **Sending as Anthorah:** Step 2 enables it, BUT Claude's draft tool composes from the
  authenticated account, so a draft I create defaults to **From: richfabiani**. At send time
  Rich flips the **From** dropdown to **Anthorah Properties** (2 seconds) — or sets Anthorah as
  the default for those threads. Not a blocker, just a manual click.
- **Sending is human-gated anyway** (FRESH GROUND hard rule: no outbound to a real person
  without Rich's "send it"), so the manual send step is by design, not a regression.
- I **cannot** do Steps 1–3 myself — they're Google account settings changes in the browser,
  and the connector OAuth is interactive. This doc is the runbook; Rich executes it.

## Alternative — Option A: connect Anthorah as its own connector
In **claude.ai → Settings → Connectors**, authorize `anthorahproperties@gmail.com` as an
additional Gmail connection. Cleaner isolation, but: (a) needs the interactive Google login,
(b) some clients only keep ONE active Google account (may *switch* rather than run both).
Only worth it if the app cleanly supports two live Gmail connectors. **Option B is the
recommended default.**

## Note on "our agents"
The FRESH GROUND deal agents run inside this same session and share **this** Gmail connection —
they see whatever inbox is connected, not a separate one. Fixing access at the connector/hub
level (above) fixes it for every agent too.

---
_Set up 2026-08-08. When Steps 1–2 are done, forward/point me to Rob's email and I'll finalize
the reply under the Anthorah identity._
