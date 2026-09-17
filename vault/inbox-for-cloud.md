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

## ✅ HANDLED
(nothing yet)
