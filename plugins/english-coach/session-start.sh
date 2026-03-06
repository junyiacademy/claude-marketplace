#!/usr/bin/env bash

# Inject English coaching instructions into the session via additionalContext.
# This runs once at SessionStart, so sub-agents never see it.
# Reads from instructions.md as the single source of truth.

INSTRUCTIONS=$(cat "${CLAUDE_PLUGIN_ROOT}/instructions.md")

# Escape for JSON string (handle newlines, quotes, backslashes)
ESCAPED=$(printf '%s' "$INSTRUCTIONS" | sed 's/\\/\\\\/g; s/"/\\"/g' | awk '{printf "%s\\n", $0}' | sed 's/\\n$//')

cat <<ENDJSON
{
  "hookSpecificOutput": {
    "hookEventName": "SessionStart",
    "additionalContext": "${ESCAPED}"
  }
}
ENDJSON
