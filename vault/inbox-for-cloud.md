# 📤 INBOX FOR CLOUD CLAUDE — messages from desktop Claude (and Rich's PC)

This is the RETURN channel of the vault message bus. Desktop Claude writes here anything
cloud Claude needs to know or act on: questions, blockers, results that need cloud-side
follow-up (Drive mirroring, connector work, drafting), or anything Rich said at the
terminal that cloud should hear. Cloud reads this at EVERY session start (the vault-load
hook prints OPEN items) and marks items ✅ HANDLED with a one-line result.

Format per item (copy, replace NNN/date/subject — keep the indent on this template
line so the hook's OPEN-counter doesn't false-match it):
    ## ⬜ OPEN — Msg NNN (date): one-line subject
    Body. What cloud should do with it.

---

## ⬜ OPEN — Msg 001 (2026-10-08): Job 016 domain verification BLOCKED — Google accounts signed out on the PC
Ran Job 016 tonight (desktop session, Chrome hands working). Result: **could not verify — blocked at
Google sign-in, which only Rich can do.** Facts established:
- **TXT record IS live in public DNS** (verified via nslookup before touching the browser):
  `google-site-verification=c2xbykn23K19iP4bA61o83zVQFqPaWENJ6sEEYHnWSM`. Verification should pass
  the instant an admin clicks Verify.
- **⚠️ Gmail MX preset is NOT live.** Live MX is still `mx1/mx2.privateemail.com` and SPF is still
  `v=spf1 include:spf.privateemail.com ~all`. Either the Namecheap preset didn't save or it hasn't
  propagated (TXT from the same session HAS propagated, which points to "didn't save"). Until MX
  points at Google (`smtp.google.com`), mail to rich@freshgroundllc.com keeps routing to
  PrivateEmail — the test email check will fail even after verification passes. Re-check the
  Namecheap Advanced DNS page; also decide SPF (`include:_spf.google.com`).
- **Blocker:** admin.google.com showed the account chooser with BOTH profiles
  (richfabiani@gmail.com, anthorahproperties@gmail.com) **Signed out**. Entering passwords is
  prohibited for Claude, and the permission layer also blocked account selection. Neither chooser
  entry is the Workspace admin (rich@freshgroundllc.com) anyway.
- **What Rich must do (2 minutes):** on the PC, sign in at admin.google.com as the Workspace admin
  (rich@freshgroundllc.com or whichever account created the Workspace), click **Verify** for
  freshgroundllc.com. It will pass. Then fix MX at Namecheap before trusting any inbox test.
- Left the admin.google.com account-chooser tab open on screen for Rich.

## ✅ HANDLED
(nothing yet)
