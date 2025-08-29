#!/bin/bash

# Get current session
current_session=$(tmux display-message -p '#S')

# Function to generate color based on string hash
get_color_for_name() {
    local name="$1"
    # Use a hash of the name to pick a color
    local hash=$(echo -n "$name" | sum | cut -d' ' -f1)
    # Pick bright, high-contrast colors
    # cyan, bright blue, bright magenta, bright green, bright yellow, orange, pink, light purple, lime, sky blue, coral, light green
    local colors=(51 39 201 46 226 208 213 141 118 87 210 120)
    local index=$((hash % ${#colors[@]}))
    echo "${colors[$index]}"
}

# Build session list with windows
output=""
first=true
# Get sessions in the same order as switch-client navigation (alphabetical)
sessions=($(tmux list-sessions -F '#{session_name}' | sort))
for session in "${sessions[@]}"; do
    # Add separator between sessions (not before the first one)
    if [ "$first" = false ]; then
        output+="#[fg=colour239]|"
    fi
    first=false
    
    # Get color for this session
    color=$(get_color_for_name "$session")
    
    if [ "$session" = "$current_session" ]; then
        # Current session with dark gray background
        output+="#[bg=colour238,fg=colour${color},bold]${session}"
    else
        # Other sessions with just colored text
        output+="#[bg=default,fg=colour${color}]${session}"
    fi
    
    # Get windows for this session
    windows=($(tmux list-windows -t "$session" -F '#{window_name}'))
    window_count=${#windows[@]}
    
    # Only show window list if more than 1 window
    if [ "$window_count" -gt 1 ]; then
        # Join window names with commas
        window_list=$(printf "%s," "${windows[@]}" | sed 's/,$//')
        if [ "$session" = "$current_session" ]; then
            output+="#[bg=colour238,fg=colour240] • #[bg=colour238,fg=colour250]${window_list}"
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