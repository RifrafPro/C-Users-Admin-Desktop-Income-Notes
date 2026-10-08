# Claude in Chrome — VERIFIED FIX (from official docs, 2026-10-08)
## History (so this is never re-prescribed): Rich installed the extension TWICE
(Sept + Oct). It never worked because installs were never the problem:
**the claude-in-chrome tools only load when Chrome integration is ENABLED in
Claude Code itself** (`/chrome` → Enabled by default, or launch `claude --chrome`).
Nobody ever ran that. Do NOT suggest reinstalling the extension again.

## The enable procedure (terminal Claude Code, native Windows PowerShell — NOT WSL)
1. `claude update` (old versions had setup bugs, fixed by v2.1.211/2.1.216).
2. `claude auth status` → authMethod must be `claude.ai` (Rich's Pro login, not an API key).
3. Chrome RUNNING, extension v1.0.36+ enabled at chrome://extensions, signed into the
   SAME claude.ai account (richfabiani@gmail.com).
4. Inside a session: `/chrome` → choose **Enabled by default** → accept the one-time
   dialog (press Enter). If extension not detected: restart Chrome, `/chrome` →
   **Reconnect extension**.
5. Verify: `/chrome` shows "Status: Enabled" + "Extension: Installed"; `/mcp` →
   claude-in-chrome → View tools.
## Known failure modes: WSL (unsupported) · API-key auth (silently off) ·
different Chrome profile/account · service worker idle ("receiving end does not
exist" → Reconnect extension) · EADDRINUSE pipe (close other Claude sessions).
Source: code.claude.com/docs/en/chrome.md
## What this unlocks when live: Fairfax GIS plat-date (Job 002 remainder),
IG reels (Job 005), Namecheap/DNS click-work, any web setup done FOR Rich.

## Persistent enable (doc-verified addendum, 10-08)
- The "Enabled by default" switch is the global-config key **claudeInChromeDefaultEnabled: true**
  in **~/.claude.json** (NOT settings.json — ignored there). `/chrome` → "Enabled by default"
  writes it; or edit the JSON locally. ⚠️ ~/.claude.json holds credentials — edit in place on
  Rich's PC only, never copy/commit/upload it.
- The one-time first-run dialog has NO documented skip — one human Enter, once per machine.
- Launcher already passes --chrome per session; the key makes every interactive session
  (incl. VS Code ≥2.1.287) enabled without the flag. Undocumented for headless `claude -p`.
Source: code.claude.com/docs/en/settings-reference.md

## ✅ OUTCOME 2026-10-08: WORKING. Desktop session (CLI 2.1.295, claude.ai auth, claudeInChromeDefaultEnabled=true) loaded claude-in-chrome tools; tabs_context_mcp returned a live tab group. Remote Control (Claude Eyes) sessions need --chrome explicitly — their default is OFF.
