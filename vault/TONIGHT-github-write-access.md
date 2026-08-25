# GitHub write access — ✅ RESOLVED 2026-08-25

Rich installed/configured the Claude GitHub App (Configure screen → granted repo access).
Verified live with a real push — not a guess:

```
git push -u origin claude/income-notes-project-p3l7gm
* [new branch]  claude/income-notes-project-p3l7gm -> claude/income-notes-project-p3l7gm
```

Local and remote now match exactly (confirmed via `git log` on both + `git status -sb`
showing clean/up-to-date). **GitHub is now a real second durable store, alongside Drive.**

## Current repo state (facts, not assumptions)
- Only branch that exists: **`claude/income-notes-project-p3l7gm`** — this repo has **no
  `main` branch**. The "default_branch: main" shown in repo metadata is just a GitHub setting;
  no commit has ever been made to it.
- No pull request opened — there's no base branch to open one against, and this is a personal
  vault (not a reviewed codebase), so a PR doesn't fit the workflow. We just push straight to
  the working branch going forward.

## What this unlocks
- Real redundancy: GitHub + Drive both hold everything now.
- Local Claude Code (once its login is sorted) can `git clone` this repo directly.
- Files pushed here can be given to tools that need a public URL to fetch from (e.g. the
  SignNow upload that was blocked on 2026-08-22/23) — host the file in this repo, hand SignNow
  the raw.githubusercontent.com link.

## Going forward
- Keep committing + pushing to `claude/income-notes-project-p3l7gm` as normal — no bundle
  restores or special recovery steps needed anymore.
- Drive stays as the redundant mirror (still update it — belt and suspenders, not either/or).
