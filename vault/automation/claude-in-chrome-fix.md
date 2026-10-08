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

## FAILURE LOG (10-08 night, per LOG-FAILURES rule)
- The "Cloud-to-Eyes direct line" Routine (trig_016Tv43M3HMYCYZxfkx8jyVR) fired 3x into
  the idle remote-control session session_014gf7bsquhCzEVNyUqFhrLP — ZERO turns executed
  (used_tokens stayed 0). Dead-letter path: fire_trigger -> idle remote-control CLI session
  does not deliver, at least while the session has never run a turn. Do NOT rely on it.
- WORKING lever instead: create_session on the bridge environment (env_018WVyYimSDAHRJiQYNBcX36)
  with the full prompt — spawns a fresh worker ON the PC that executes immediately
  (first use: session_017rxdof5eFjFHkbNUtPK65j "Finish domain verification NOW").
- Also: the remote-control HOST window accepts no typing/pasting by design; drive sessions
  from claude.ai/code, the app, or cloud create_session.
