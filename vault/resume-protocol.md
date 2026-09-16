# BULLETPROOF RESUME PROTOCOL (installed 2026-09-16)

**Why this exists.** Rich: "I take several steps forward and then end up losing progress
and being a few steps back — almost every session." On 09-16 we found the exact mechanism:
**the cloud session sat 18 days on a stale copy of the vault** — 19 commits of desktop work
(Sept 3–7: Chain Bridge deal, autonomy rulings, VA/MD law, honest assessment) existed on
GitHub but the cloud session never pulled them. Nothing was ever lost from GitHub; sessions
were just *reading old state and re-treading covered ground.* That feels exactly like
losing progress.

## The one law
> **GitHub `origin/claude/income-notes-project-p3l7gm` is the single source of truth.
> Every session PULLS from it first and PUSHES to it last. A result that isn't pushed
> does not exist. A session that didn't pull is reading the past.**

## The 5 layers (any one survives the loss of the others)
| # | Layer | What | Who keeps it current |
|---|---|---|---|
| 1 | **GitHub** | full history, source of truth | every session's end-of-work push |
| 2 | **Sync-first hook** (cloud) | `.claude/hooks/vault-load.sh` now **fetches + auto-pulls at every session start** and prints 🚨 if it can't — a stale session announces itself before any work | automatic |
| 3 | **Desktop standing order** | pull at start → work → `git add -A && commit && push` at end (CLAUDE.md, 2026-08-28) | desktop Claude, every session |
| 4 | **Local backup folder** ("Income Notes - Backup" on Rich's PC) | dated full snapshots + git bundles via `tools/backup-vault.ps1`, newest 10 kept | desktop Claude after each session (Job 008 installs it; optional nightly Task Scheduler run) |
| 5 | **Drive mirror** ("Income Notes Vault") | key files + periodic `.bundle` (full history in one file) | cloud Claude at `/vault-save` |

## Session choreography (both surfaces)
**START:** hook/standing-order pulls → read latest `vault/sessions/*.md` "Where we left off"
→ read `vault/inbox-for-desktop.md` (desktop) → work.
**END (or after any meaningful chunk):** update session log + project files → commit →
push → **verify the push landed** (`git log origin/… -1`) → cloud also mirrors to Drive.
Never end a session with unpushed commits. If a push fails, SAY SO — don't report saved.

## Restore drill (if the PC dies / repo corrupts)
1. From GitHub: `git clone` the repo — done.
2. From a backup bundle: `git clone "vault-<date>.bundle" restored-vault` — full history.
3. From a snapshot folder: files are plain — copy them back.

## Known failure modes this closes
- Cloud session born before a fix / stale clone → **Layer 2 hook now auto-pulls + screams.**
- Desktop push silently hanging (no credential helper) → fixed 09-03; hook's "ahead N
  not pushed" warning catches any regression.
- Container rollback mid-session → push early, push often; anything pushed survives.
- Drive connector duplicate quirk → GitHub is authoritative; Drive is a mirror, never the source.
