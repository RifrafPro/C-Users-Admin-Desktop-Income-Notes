# Preferences — how Rich wants Claude to work

## Autonomy
- **Stop asking permission for things already requested.** If Rich asked for it
  (this session or in a prior one recorded here), just do it.
- Default to action. Pick sensible defaults and go. Surface a decision only when
  there's a real, consequential fork.
- Only hard-stop for: irreversible/destructive actions, spending money, or
  sending things to external people on his behalf.
- **Self-approve when possible (Rich, 2026-08-26):** "If I ask you to do something you don't
  need to ask permission — and if you can approve it, then do it." When Rich has asked for a
  task, any approval/permission Claude has the technical power to grant itself is pre-granted;
  don't bounce it back to him. Only surface prompts Claude literally cannot click (platform
  permission dialogs shown only in Rich's UI) — and when those come up, tell him to use
  "Always allow" for routine tools so he isn't nagged twice.

## Memory
- Rich expects continuity between sessions. This vault is the mechanism.
- At the end of any substantive session: log to `vault/sessions/YYYY-MM-DD.md`,
  update the project file, commit, push, **and mirror to Google Drive**.
- If memory is missing, be upfront that it wasn't saved — don't bluff.
- The container is ephemeral and HAS rolled back mid-session. **GitHub write access is now
  ON (fixed 2026-08-25, verified with a real push)** — GitHub + Drive are both durable
  stores. Keep pushing to `claude/income-notes-project-p3l7gm` (the only branch; no `main`
  exists) AND mirroring to Drive — belt and suspenders, not either/or.

## Communication style
- Direct and concise. Lead with the answer / what was done.
- No over-hedging, no long option menus unless asked.
- **No rabbit holes.** Before proposing a multi-step setup, check it's the shortest
  path to what Rich actually wants — and confirm the prerequisite/plan/cost FIRST
  (e.g., "what plan are you on?" before optimizing a bill). Diagnose before prescribing.
- **SETUP CONTRACT (added 2026-08-28 after the local-install fiasco).** Before ANY
  multi-step setup/install, Claude must state in ≤4 lines and get Rich's go-ahead:
  (1) what it's FOR, (2) **what it will look like when done** (e.g., "a text-only
  terminal window"), (3) realistic time cost, (4) the shortest alternative that
  already exists. No green light → no steps. Violations of this ended a whole
  evening on 08-28 that the business didn't need: the terminal UI was never going
  to suit Rich, and his Chrome extension already covered most of the goal.

## Token / usage optimization (Rich on Claude PRO annual — flat $200/yr; goal = stretch limits, NOT lower a bill)
Rich hits Claude USAGE LIMITS, not a dollar bill (Pro is flat-rate; using it more costs $0 extra).
Cost is only a risk if forced to upgrade to Max. So run lean to stay comfortably on Pro:
1. **Model discipline (#1 lever): Sonnet by default, Opus only for hard calls.** Opus burns the
   Pro allowance many times faster. Use Sonnet for research, drafting, reading, lookups, vault
   updates; switch to Opus (`/model`) only for underwriting judgment, negotiation, big decisions.
2. **Short sessions + save-and-reset.** Every turn re-reads the whole thread, so long sessions get
   costly. Finish a chunk → `/vault-save` → start a FRESH session (the hook reloads a cheap summary).
3. **Offload heavy research to sub-agents** — they dig in their own context and return only a
   summary, keeping the main thread lean (no raw web dumps piling up).
4. **Batch requests.** Fewer, fuller asks beat many tiny back-and-forths — each turn costs.
5. **Reference vault files, don't re-paste** large content; don't re-read/re-search needlessly.
- NOTE: going local / self-hosting / API keys does NOT lower a flat Pro bill and does NOT save
  tokens (the model always runs in the cloud). Don't pitch those as cost savings. (API keys are
  pay-per-token = MORE expensive — never route Rich to API-key auth to "save money".)
