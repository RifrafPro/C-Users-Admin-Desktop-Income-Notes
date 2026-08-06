# Vault / Memory Workflow — map, holes, and fixes

The system that lets Claude persist across ephemeral Claude Code web sessions.

## Stages (start → finish)
| # | Stage | Hole found | Fix / component |
|---|-------|-----------|-----------------|
| 0 | **Boot** — clone repo; CLAUDE.md auto-loads only if on default branch | Empty/feature-branch → blank session | `vault-load` hook + CLAUDE.md on `main` |
| 1 | **Orient** — read CLAUDE.md + latest session log | No auto "where we left off" | `vault-load` prints it |
| 2 | **Reconstruct** — sweep Drive/Gmail if vault thin | Manual, ad-hoc | `vault-reconstruct` (planned) |
| 3 | **Work** — the project tasks | Scaffolding built (wholesaling, notes) | project files + scripts |
| 4 | **Capture** — session log + project updates | No template | `/vault-save` |
| 5 | **Persist** — commit + push (VERIFY) | **GitHub 403 read-only.** #1 hole | grant Contents:write; verify + Drive fallback |
| 6 | **Backup** — mirror to Drive | Was non-idempotent (dupes) | search-then-upsert |
| 7 | **Handoff** — next steps | Fresh session forgets | closes once Stage 5 works |

## Efficiency fix
Persistence (Stage 5) is the foundation. Fix write access + CLAUDE.md on `main`
→ Stages 0/1 auto-load → every session ends with a verified auto-save.

## Proven risk (2026-08-06)
The container **rolled back mid-session**, wiping local commits. Only the Google
Drive mirror survived — which is why we mirror every step, and why the GitHub
push is the last piece to make rollbacks a non-event.

## Components built
- `.claude/hooks/vault-load.sh` + `.claude/settings.json` — SessionStart orientation.
- `.claude/commands/vault-save.md` — `/vault-save` (log→commit→push(verify)→Drive mirror).

## Still to build
1. Grant GitHub Contents:write (one-time) — unblocks everything.
2. `vault-reconstruct` agent — rebuild from Drive/Gmail.
3. iSpeedToLead lead auto-ingest (Gmail-forward capture).
