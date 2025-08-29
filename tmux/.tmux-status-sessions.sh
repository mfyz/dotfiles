#!/bin/bash

# Get current session
current_session=$(tmux display-message -p '#S')

# Color palette for sessions
# Debug command to preview colors: for i in 11 216 51 46 202 197 207 39 148 105; do printf "\e[48;5;238m\e[38;5;%sm %3s \e[0m " "$i" "$i"; done; echo
colors=(11 216 51 46 202 197 207 39 148 105)

# Function to get color by rotating through the palette
get_color_for_session() {
    local session_index="$1"
    local color_index=$((session_index % ${#colors[@]}))
    echo "${colors[$color_index]}"
}

# Build session list with windows
output=""
first=true
# Get sessions in the same order as switch-client navigation (alphabetical)
sessions=($(tmux list-sessions -F '#{session_name}' | sort))
session_index=0
for session in "${sessions[@]}"; do
    # Add separator between sessions (not before the first one)
    if [ "$first" = false ]; then
        output+="#[fg=colour248]•"
    fi
    first=false
    
    # Get color for this session by rotating through the palette
    color=$(get_color_for_session "$session_index")
    session_index=$((session_index + 1))
    
    if [ "$session" = "$current_session" ]; then
        # Current session with colored background and true black text
        output+="#[bg=colour${color},fg=colour16,bold] ${session} "
    else
        # Other sessions with just colored text
        output+="#[bg=default,fg=colour${color}] ${session} "
    fi
    
    # Get windows for this session
    windows=($(tmux list-windows -t "$session" -F '#{window_name}'))
    window_count=${#windows[@]}
    
    # Only show window list if more than 1 window
    if [ "$window_count" -gt 1 ]; then
        # Join window names with commas
        window_list=$(printf "%s," "${windows[@]}" | sed 's/,$//')
        if [ "$session" = "$current_session" ]; then
            output+="#[bg=colour${color},fg=colour240] • #[bg=colour${color},fg=colour16]${window_list}"
        else
            output+="#[bg=default,fg=colour240] • #[bg=default,fg=colour245]${window_list}"
        fi
    fi
    
    if [ "$session" = "$current_session" ]; then
        output+=""
    fi
    
    output+="#[default]"
done

echo "${output}"
