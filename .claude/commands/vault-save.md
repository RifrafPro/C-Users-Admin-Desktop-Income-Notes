---
description: Save session state to the vault — log, commit, push (verified), and mirror to Drive.
---

Run the end-of-session save. Do every step; report a ✅/⛔ line for each.

## 1. Write the session log
Append/create `vault/sessions/<today>.md` (today's date from session start) using
this template. Reconstruct, don't fabricate — if you don't know something, say so.

```
# Session — <YYYY-MM-DD>

## Context
<what the user came in for>

## What we did
<bullet list of concrete actions/decisions>

## Open threads / blockers
<anything unfinished, incl. external actions the user must take>

## Where we left off / next steps
<the exact next action for the following session — keep this section header
literally "Where we left off" so the vault-load hook can surface it>
```

## 2. Update project files
Update the relevant `vault/projects/*.md` (status + next steps). Create a new
project file if this session started a new workstream.

## 3. Commit
```
git add -A
git commit -m "<concise summary of the session's changes>"
```

## 4. Push — and VERIFY it actually landed
```
git push -u origin <current-branch>   # retry 4x w/ backoff on network errors
```
- If push returns **403 / permission denied**: the GitHub integration is
  read-only. Do NOT claim it saved. Report the block and continue to step 5.
- Confirm success by checking the push output / remote ref — never assume.

## 5. Mirror to Google Drive (idempotent — no duplicates)
Back up the vault to the Drive folder **"Income Notes Vault"**.
- FIRST search Drive for an existing folder named exactly "Income Notes Vault".
  Reuse it. Only create it if zero matches (never create a second one).
- For each vault file, search for an existing file of the same name in that folder.
  If it exists, update it in place; if not, create it. Never create duplicates.

## 6. Report
Print the final status block:
- ✅/⛔ Session log written
- ✅/⛔ Project files updated
- ✅/⛔ Commit
- ✅/⛔ Push landed (or ⛔ 403 read-only — needs write access)
- ✅/⛔ Drive mirror (idempotent)
