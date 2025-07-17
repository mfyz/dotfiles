#!/bin/bash
# Hook script to play sound when Claude needs user input

# Play notification sound
# afplay /System/Library/Sounds/Funk.aiff

say "[[volm 0.5]] hey"

# Optional: Log the notification
echo "$(date): User input needed" >> ~/.claude/logs/hook.log