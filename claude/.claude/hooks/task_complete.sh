#!/bin/bash
# Hook script to play sound when Claude completes a task

# Play completion sound
# afplay /System/Library/Sounds/Glass.aiff

say "[[volm 0.5]] ."

# Optional: Log the completion
echo "$(date): Claude task completed" >> ~/.claude/logs/hook.log