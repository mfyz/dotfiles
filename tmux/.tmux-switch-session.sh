#!/bin/bash

# Switch to next/previous session based on creation time order
# Usage: .tmux-switch-session.sh [next|prev]

direction="${1:-next}"
current_session=$(tmux display-message -p '#S')

# Get sessions sorted by creation time (oldest first)
sessions=($(tmux list-sessions -F '#{session_created}:#{session_name}' | sort -n | cut -d: -f2))

# Find current session index
current_index=-1
for i in "${!sessions[@]}"; do
    if [[ "${sessions[$i]}" == "$current_session" ]]; then
        current_index=$i
        break
    fi
done

# Calculate target index
num_sessions=${#sessions[@]}
if [[ "$direction" == "next" ]]; then
    target_index=$(( (current_index + 1) % num_sessions ))
else
    target_index=$(( (current_index - 1 + num_sessions) % num_sessions ))
fi

# Switch to target session
tmux switch-client -t "${sessions[$target_index]}"
