#!/bin/bash
# Hook script to play sound when Claude completes a task

# Play completion sound
# afplay /System/Library/Sounds/Glass.aiff

if command -v say &>/dev/null; then
    say "[[volm 0.5]] ."
else
    # Visual bell
    printf "\a"
fi

# Optional: Log the completion
echo "$(date): Claude task completed" >> "$HOME/.claude/logs/hook.log"