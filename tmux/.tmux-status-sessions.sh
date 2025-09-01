#!/bin/bash

# Get current session
current_session=$(tmux display-message -p '#S')

# Cache file for session data
cache_file="/tmp/.tmux-sessions-cache"
cache_duration=3  # Cache sessions list for 3 seconds

# Color palette for sessions
# Debug command to preview colors: for i in 11 216 51 46 202 197 207 39 148 105; do printf "\e[48;5;238m\e[38;5;%sm %3s \e[0m " "$i" "$i"; done; echo
colors=(11 216 51 46 202 197 207 39 148 105)

# Function to get color by rotating through the palette
get_color_for_session() {
    local session_index="$1"
    local color_index=$((session_index % ${#colors[@]}))
    echo "${colors[$color_index]}"
}

# Function to get cached session data or refresh if stale
get_session_data() {
    local current_time=$(date +%s)
    
    # Check if cache exists and is still valid
    if [ -f "$cache_file" ]; then
        local cache_time=$(stat -c %Y "$cache_file" 2>/dev/null || echo 0)
        local age=$((current_time - cache_time))
        
        if [ $age -lt $cache_duration ]; then
            # Cache is still valid, use it
            cat "$cache_file"
            return
        fi
    fi
    
    # Cache is stale or doesn't exist, refresh it
    # Get sessions in the same order as switch-client navigation (alphabetical)
    local sessions=($(tmux list-sessions -F '#{session_name}' | sort))
    local session_data=""
    
    for session in "${sessions[@]}"; do
        # Get windows for this session
        local windows=($(tmux list-windows -t "$session" -F '#{window_name}'))
        local window_count=${#windows[@]}
        local window_list=""
        
        # Only build window list if more than 1 window
        if [ "$window_count" -gt 1 ]; then
            window_list=$(printf "%s," "${windows[@]}" | sed 's/,$//')
        fi
        
        # Store session data: session_name:window_count:window_list
        session_data+="${session}:${window_count}:${window_list}"$'\n'
    done
    
    # Save to cache
    echo -n "$session_data" > "$cache_file"
    echo -n "$session_data"
}

# Build session list with windows
output=""
first=true
session_index=0

# Get session data (cached or fresh)
session_data=$(get_session_data)
# Process each line of session data
while IFS=':' read -r session window_count window_list; do
    [ -z "$session" ] && continue
    
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
    
    # Only show window list if more than 1 window
    if [ "$window_count" -gt 1 ] && [ -n "$window_list" ]; then
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
done <<< "$session_data"

echo "${output}"
