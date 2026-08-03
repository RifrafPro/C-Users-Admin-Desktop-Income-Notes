# CLAUDE.md — Rich's Vault (read this first, every session)

This repository IS the vault. It is Claude's persistent memory across sessions.
Sessions here are ephemeral: nothing is remembered unless it was **committed and
pushed to this repo**. So keep it current.

## Standing operating rules (do NOT re-ask these every time)

1. **Don't ask permission for things Rich has already asked for.** If a task is
   already approved here or was clearly requested, just do it. Only pause for
   genuinely destructive or irreversible actions (deleting large amounts of data,
   sending external messages, spending money).
2. **Be decisive.** Make reasonable default choices and proceed. Report what you
   did, not a menu of options, unless a real fork needs Rich's call.
3. **Update the vault at the end of meaningful work.** Append to
   `vault/sessions/` and update the relevant project file, then commit + push.
   The last thing every session should do is save state here.
4. **Reconstruct, don't fabricate.** If the vault doesn't have something, say so
   plainly rather than inventing a "memory."
5. Rich's timezone/dates: use the current date provided at session start.

## Who
- **Rich Fabiani** — richfabiani@gmail.com
- Real-estate investor / entrepreneur. Focus areas: **mortgage-note investing
  ("Income Notes"), wholesaling properties, and flipping paper.** Uses lead-gen
  services (e.g. **iSpeedToLead**) to source deals.

## Where to look
- `vault/profile.md` — background, businesses, goals
- `vault/preferences.md` — how Rich likes Claude to work (fuller detail)
- `vault/projects/` — active projects (income-notes, wholesaling, lead-gen)
- `vault/sessions/` — dated logs = "where we left off"
- `vault/projects/income-notes-glossary.md` — saved copy of the Income Notes glossary

## How memory works (important honesty note)
This vault only persists if commits land on the branch future sessions actually
open. If a session starts on the default branch and the vault lives only on a
feature branch, it won't be seen. **Merge the vault PR so it lands on the default
branch** — that makes it permanent, auto-loaded memory.
