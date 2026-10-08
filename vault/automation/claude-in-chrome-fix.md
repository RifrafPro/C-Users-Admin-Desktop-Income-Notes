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
