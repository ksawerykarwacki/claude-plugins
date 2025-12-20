#!/bin/bash
# load-agents.sh - Recursively discovers and loads AGENTS.md files
# This hook runs at SessionStart and injects AGENTS.md content into Claude's context
#
# Based on: https://github.com/anthropics/claude-code/issues/6235
# Until native AGENTS.md support is added, this plugin provides the functionality

PROJECT_ROOT="${PWD}"
FOUND_ANY=false

# Find all AGENTS.md files, sorted by depth (root first, then subdirs)
while IFS= read -r file; do
    if [ -n "$file" ]; then
        FOUND_ANY=true
        REL_PATH="${file#${PROJECT_ROOT}/}"

        echo "=== AGENTS.md: ${REL_PATH} ==="
        echo ""
        cat "$file"
        echo ""
        echo "=== END: ${REL_PATH} ==="
        echo ""
    fi
done < <(find "${PROJECT_ROOT}" -name "AGENTS.md" -type f 2>/dev/null | sort)

# Silent exit if no AGENTS.md found (graceful no-op)
if [ "$FOUND_ANY" = false ]; then
    exit 0
fi
