# CLAUDE.md — Rich's Vault (read this first, every session)

This repository IS the vault. It is Claude's persistent memory across sessions.
Sessions here are ephemeral: nothing is remembered unless it was **committed and
pushed to this repo** (and mirrored to the Google Drive "Income Notes Vault").
So keep it current.

## Standing operating rules (do NOT re-ask these every time)

1. **Don't ask permission for things Rich has already asked for.** If a task is
   already approved here or was clearly requested, just do it. Only pause for
   genuinely destructive or irreversible actions.
2. **Be decisive.** Make reasonable default choices and proceed. Report what you
   did, not a menu of options, unless a real fork needs Rich's call.
3. **Update the vault at the end of meaningful work.** Append to
   `vault/sessions/`, update the relevant project file, then commit + push +
   mirror to Drive. Save state here — it's the only memory that survives.
4. **Reconstruct, don't fabricate.** If the vault doesn't have something, say so.
5. Rich's timezone/dates: use the current date provided at session start.

## Who
- **Rich Fabiani** — richfabiani@gmail.com
- Real-estate investor / entrepreneur. Active business: **FRESH GROUND** —
  teardown-lot wholesaling to luxury home builders in the DC Metro. Also:
  mortgage-note investing ("Income Notes"). Lead-gen via **iSpeedToLead**.

## Where to look
- `vault/profile.md` — background, businesses, goals
- `vault/preferences.md` — how Rich likes Claude to work
- `vault/projects/wholesaling.md` — FRESH GROUND (CURRENT FOCUS)
- `vault/projects/fresh-ground-scripts.md` — the 10-script playbook
- `vault/projects/lead-gen-ispeedtolead.md` — lead flow + 3 markets
- `vault/projects/income-notes*.md` — note investing + glossary
- `vault/projects/income-notes-business-workflow.md` — note pipeline
- `vault/sessions/` — dated logs = "where we left off"
- `vault/workflow-map.md` — the vault/memory system

## The memory system
- **Session start:** the `.claude/hooks/vault-load.sh` SessionStart hook prints
  the latest session's "Where we left off" + active projects. Read it.
- **Session end / after meaningful work:** run **`/vault-save`** — writes the
  session log, updates project files, commits, pushes (VERIFY it landed), then
  mirrors to Google Drive.
- **Drive mirror is idempotent:** ONE folder "Income Notes Vault". Search for the
  folder + target file first, update in place — NEVER create duplicates.
- **Verify, don't assume:** a push that returns 403 did NOT save — say so plainly.

## How memory persists (honesty note)
The container is ephemeral and has rolled back mid-session before. Two durable
stores: (1) **GitHub** — needs Contents:write (see `vault/TONIGHT-github-write-access.md`);
(2) **Google Drive "Income Notes Vault"** — works now. Mirror to Drive every time.
