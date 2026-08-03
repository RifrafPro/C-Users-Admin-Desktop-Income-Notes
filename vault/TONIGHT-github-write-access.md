# TONIGHT — Turn on GitHub write access (≈5 min)

**Why:** Right now Claude can *read* your repo but not *write* to it (every push
returns `403`). That's the only reason the vault didn't persist. Fix that once and
memory becomes automatic. Your files are already safe in Google Drive + on your
computer, so nothing is at risk — this just reconnects the auto-save.

---

## PART A — Grant write access (do this first, ~3 min)

1. Go to **https://github.com/settings/installations**
   (GitHub → your avatar → **Settings** → **Applications** → **Installed GitHub Apps**)
2. Find **Claude** (a.k.a. "Claude Code" / "Claude for GitHub") → click **Configure**.
3. Under **Repository access**:
   - Make sure **`C-Users-Admin-Desktop-Income-Notes`** is included.
   - Either select **All repositories**, or **Only select repositories** and add it.
4. If GitHub shows a **permissions update / "Contents: Read and write"** prompt,
   click **Approve / Save** to accept it.
5. Click **Save**.

> If you don't see a "Claude" app there, the connection was made through the
> Claude Code web app instead. In that case, open the repo/environment settings
> inside Claude Code (claude.ai/code) and switch this repo from **read-only** to
> **read/write (push)**.

---

## PART B — Have Claude rebuild + push the vault (~2 min)

Tonight's session starts fresh (no memory yet — that's what we're fixing). So
paste this exact prompt to the new Claude session:

> My GitHub repo **RifrafPro/C-Users-Admin-Desktop-Income-Notes** now has write
> access. Rebuild my Income Notes vault from my Google Drive folder named
> **"Income Notes Vault"**: download all the `.md` files and recreate this
> structure — `CLAUDE.md` at the repo root; `preferences.md` and `profile.md`
> under `vault/`; `income-notes.md` and `income-notes-glossary.md` under
> `vault/projects/`; and the session log under `vault/sessions/`. Commit and
> **push to the default branch (main)** so future sessions auto-load `CLAUDE.md`.
> Then confirm the push succeeded and give me the commit link.

---

## PART C — Verify it worked

- Claude reports the push **succeeded** with a commit link, **and**
- You can see the files at
  **https://github.com/RifrafPro/C-Users-Admin-Desktop-Income-Notes**
  on the **main** branch (`CLAUDE.md` visible at the top).

Once `CLAUDE.md` is on the **default branch**, every future session auto-loads it
and Claude will actually remember. From then on, Claude saves state to the repo at
the end of each session automatically.

---

## Backup locations (in case you need the files directly)
- Google Drive folder: **Income Notes Vault**
  https://drive.google.com/drive/folders/1g0FkWKFXt6iEQUw5czlNM8FX2jIpR3uL
- The 6 files were also sent to you in chat to save on your computer.
