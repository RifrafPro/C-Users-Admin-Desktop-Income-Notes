#!/bin/bash
# vault-load — SessionStart hook.
# Surfaces "where we left off" so every session starts oriented instead of blank.
# Fail-safe by design: never breaks a session. Missing files just print less.
set -uo pipefail

ROOT="${CLAUDE_PROJECT_DIR:-$(pwd)}"
SESS_DIR="$ROOT/vault/sessions"

echo "=== VAULT LOADED — orientation ==="

# 0) SYNC FIRST (added 2026-09-16 after an 18-day-stale session caused "lost progress").
# Fetch the remote; if we're behind and the tree is clean, fast-forward pull.
# If we can't sync, say so LOUDLY as the first line — a stale vault silently
# masquerading as current is the #1 cause of Rich losing progress.
if git -C "$ROOT" rev-parse --git-dir >/dev/null 2>&1; then
  BRANCH="$(git -C "$ROOT" rev-parse --abbrev-ref HEAD 2>/dev/null)"
  if git -C "$ROOT" fetch origin "$BRANCH" --quiet 2>/dev/null; then
    BEHIND="$(git -C "$ROOT" rev-list --count HEAD..origin/"$BRANCH" 2>/dev/null || echo 0)"
    AHEAD="$(git -C "$ROOT" rev-list --count origin/"$BRANCH"..HEAD 2>/dev/null || echo 0)"
    if [ "${BEHIND:-0}" -gt 0 ]; then
      if [ -z "$(git -C "$ROOT" status --porcelain 2>/dev/null)" ] && [ "${AHEAD:-0}" -eq 0 ]; then
        if git -C "$ROOT" merge --ff-only origin/"$BRANCH" --quiet 2>/dev/null; then
          echo "🔄 SYNCED: pulled $BEHIND new commit(s) from origin — vault is now current."
        else
          echo "🚨 VAULT IS $BEHIND COMMIT(S) BEHIND origin/$BRANCH and auto-pull FAILED."
          echo "🚨 RUN 'git pull' BEFORE TRUSTING ANYTHING BELOW — it may be stale."
        fi
      else
        echo "🚨 VAULT IS $BEHIND COMMIT(S) BEHIND origin/$BRANCH (local changes/commits present)."
        echo "🚨 RECONCILE FIRST: git pull (merge). Everything below may be stale."
      fi
    else
      echo "✅ Vault in sync with origin/$BRANCH (behind: 0, ahead: ${AHEAD:-0})."
    fi
    if [ "${AHEAD:-0}" -gt 0 ]; then
      echo "⚠️ $AHEAD local commit(s) NOT PUSHED — push before session end or they can be lost."
    fi
  else
    echo "🚨 COULD NOT FETCH origin — offline or auth issue. Vault may be STALE. Verify before trusting."
  fi
fi

# 0.5) Message bus: surface OPEN messages from the desktop (return channel).
if [ -f "$ROOT/vault/inbox-for-cloud.md" ]; then
  OPEN_MSGS="$(grep -c '^## ⬜ OPEN' "$ROOT/vault/inbox-for-cloud.md" 2>/dev/null || echo 0)"
  if [ "${OPEN_MSGS:-0}" -gt 0 ]; then
    echo ""
    echo "📤 $OPEN_MSGS OPEN message(s) FROM DESKTOP in vault/inbox-for-cloud.md — read and handle them:"
    grep '^## ⬜ OPEN' "$ROOT/vault/inbox-for-cloud.md" | head -n 10
  fi
fi

# 1) Confirm the memory anchor exists.
if [ -f "$ROOT/CLAUDE.md" ]; then
  echo "CLAUDE.md present (standing rules + project pointers active)."
else
  echo "WARNING: CLAUDE.md missing — memory anchor not loaded. Rebuild the vault."
fi

# 2) Show the most recent session log (that's 'where we left off').
if [ -d "$SESS_DIR" ]; then
  LATEST="$(ls -1 "$SESS_DIR"/*.md 2>/dev/null | sort | tail -n 1)"
  if [ -n "${LATEST:-}" ]; then
    echo ""
    echo "--- Most recent session: $(basename "$LATEST") ---"
    # Print the 'Where we left off' section if present, else the whole file (capped).
    if grep -qE "^#+.*[Ww]here [Ww]e [Ll]eft [Oo]ff" "$LATEST" 2>/dev/null; then
      awk 'BEGIN{p=0} /^#+.*[Ww]here [Ww]e [Ll]eft [Oo]ff/{p=1} p{print}' "$LATEST" | head -n 40
    else
      head -n 40 "$LATEST"
    fi
  else
    echo "No session logs yet in vault/sessions/."
  fi
else
  echo "No vault/sessions/ directory yet."
fi

# 3) List active projects so Claude knows what's in play.
if [ -d "$ROOT/vault/projects" ]; then
  echo ""
  echo "--- Active projects ---"
  ls -1 "$ROOT/vault/projects"/*.md 2>/dev/null | while read -r f; do
    echo "  - $(basename "$f")"
  done
fi

# 4) Show the deal-agency agents (the operating system).
if [ -d "$ROOT/.claude/agents" ]; then
  echo ""
  echo "--- FRESH GROUND deal agents (invoke deal-orchestrator to run a deal) ---"
  ls -1 "$ROOT/.claude/agents"/*.md 2>/dev/null | while read -r f; do
    echo "  - $(basename "$f" .md)"
  done
fi

# 5) Show open deals in the pipeline.
if [ -d "$ROOT/vault/deals" ]; then
  DEALS="$(ls -1 "$ROOT/vault/deals"/*.md 2>/dev/null | grep -v '_TEMPLATE' | wc -l | tr -d ' ')"
  echo ""
  echo "--- Deals in pipeline: ${DEALS:-0} (see vault/deals/) ---"
fi

# 6) Automation stack pointer.
if [ -f "$ROOT/vault/automation-stack.md" ]; then
  echo ""
  echo "--- Automation: see vault/automation-stack.md (e-sign/voice/SMS/CRM tools + status) ---"
fi

echo "=== end orientation ==="
exit 0
