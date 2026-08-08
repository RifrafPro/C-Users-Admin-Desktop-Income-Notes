# SETUP — Run Claude Code LOCALLY (exclusive control + real backup)

> Goal: move off the **ephemeral web container** (claude.ai/code) and run Claude Code on
> Rich's own PC — permanent files, exclusive control, and a complete backup. Written 2026-08-08.

## Why go local (the whole reason)
- **Exclusive control + permanence:** files live on YOUR disk, not a cloud VM that resets.
- **Fixes the GitHub 403 automatically:** the web version pushes through Anthropic's proxy with
  read-only scoped creds (that's the 403). Local Claude Code uses **your own git/GitHub
  credentials directly** — no proxy, no 403. Push just works.
- **The ephemeral container can't be made permanent** — it's what the web hands you
  automatically. You don't fix it; you replace it by going local.

## Step 1 — Install Claude Code on the PC (Windows)
PowerShell:
```powershell
irm https://claude.ai/install.ps1 | iex
```
Alternatives: `winget install Anthropic.ClaudeCode` · desktop app at https://claude.com/download
*(Mac: `curl -fsSL https://claude.ai/install.sh | bash` or `brew install --cask claude-code`)*

Requires a **Pro / Max / Team** plan (same Claude account). Run `claude`, approve login in browser.

## Step 2 — Get the vault onto the machine
The current, complete copy is in **two places** (GitHub is STALE — recent work never pushed due
to the 403):
- **Bundle:** `income-notes-vault-2026-08-08.tar.gz` (delivered in chat — includes full git history)
- **Google Drive:** "Income Notes Vault" folder (every file, individually)

Unzip the bundle to the Desktop (Windows 11 has `tar` built in):
```powershell
tar -xzf income-notes-vault-2026-08-08.tar.gz -C "$env:USERPROFILE\Desktop"
```
You'll get `C:\Users\Admin\Desktop\C-Users-Admin-Desktop-Income-Notes` — rename to taste.

## Step 3 — Run it + establish the GitHub backup
```powershell
cd "$env:USERPROFILE\Desktop\<vault-folder>"
claude
```
Then push (now works with your own creds):
```powershell
git push -u origin claude/income-notes-project-p3l7gm
```
From here, GitHub is a live backup again.

## Step 4 — Backup: 3 copies, 3 places (3-2-1)
| Copy | Where | Role |
|---|---|---|
| 1. Local folder | `C:\Users\Admin\Desktop\Income Notes` | Primary — exclusive control |
| 2. GitHub | your repo | Versioned offsite backup (works once local) |
| 3. Cloud sync | OneDrive / Google Drive desktop on that folder | Automatic file backup |

**Cloud-sync caveats:** running inside a synced folder works; just **exclude `~/.claude/`**
(session transcripts/caches) from sync, and avoid editing the same file in two places at once.

## Step 5 — Pick up where we left off
Open the vault folder, run `claude`, say **"load the vault"** — the SessionStart hook prints the
latest session's "where we left off" + active projects + the deal agents. Continue from there.

## Auth / credential notes
- Login stored locally: Mac Keychain · Windows `%USERPROFILE%\.claude\.credentials.json`.
- Model pick: `/model` in a session. Export a readable transcript: `/export <name>.txt`.
- If a local push ever 403s, refresh the token: `gh auth refresh -s admin:repo_hook`.
