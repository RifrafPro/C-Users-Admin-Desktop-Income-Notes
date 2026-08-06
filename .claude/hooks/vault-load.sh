#!/bin/bash
# vault-load — SessionStart hook.
# Surfaces "where we left off" so every session starts oriented instead of blank.
# Fail-safe by design: never breaks a session. Missing files just print less.
set -uo pipefail

ROOT="${CLAUDE_PROJECT_DIR:-$(pwd)}"
SESS_DIR="$ROOT/vault/sessions"

echo "=== VAULT LOADED — orientation ==="

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

echo "=== end orientation ==="
exit 0
