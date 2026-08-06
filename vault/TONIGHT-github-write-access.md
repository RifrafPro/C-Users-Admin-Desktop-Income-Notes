# TONIGHT — Turn on GitHub write access (≈5 min)

**Why:** Claude can *read* the repo but not *write* to it (push returns `403`).
That's the only reason the vault doesn't auto-persist across sessions. Fix it once
and memory becomes automatic. Everything is safe in Google Drive meanwhile.

## PART A — Grant write access (~3 min)
1. Go to **https://github.com/settings/installations**
2. Find **Claude** (a.k.a. "Claude Code") → **Configure**.
3. Under **Repository access**: include **`C-Users-Admin-Desktop-Income-Notes`**.
4. Approve any **"Contents: Read and write"** permission prompt → **Save**.
> If there's no "Claude" app, the connection was via the Claude Code web app —
> open the repo/environment settings in claude.ai/code and switch this repo to
> **read/write (push)**.

## PART B — Restore + push (~2 min)
The whole vault (incl. `.claude/`) is in Drive "Income Notes Vault" as a full
snapshot tarball. **Use the NEWEST `vault-bundle-*.tar.gz`** (latest as of this
writing: **`vault-bundle-2026-08-06-2200.tar.gz`** — the complete, current repo).
Paste to a fresh session:

> My GitHub repo **RifrafPro/C-Users-Admin-Desktop-Income-Notes** now has write
> access. Restore my vault from my Google Drive folder **"Income Notes Vault"**:
> extract the NEWEST `vault-bundle-*.tar.gz` at the repo root, commit, and **push
> to the default branch (main)** so future sessions auto-load `CLAUDE.md` and the
> `vault-load` hook. Then clean up the duplicate `.md` files + the empty second
> "Income Notes Vault" folder in Drive. Confirm the push and give me the commit link.

## PART C — Verify
`CLAUDE.md` visible on the **main** branch at
https://github.com/RifrafPro/C-Users-Admin-Desktop-Income-Notes → memory is now automatic.

## Backup locations
- Drive folder: **Income Notes Vault**
  https://drive.google.com/drive/folders/1g0FkWKFXt6iEQUw5czlNM8FX2jIpR3uL
- Key files also sent to your computer in chat.
