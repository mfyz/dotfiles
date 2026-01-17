#!/bin/bash

# Generate pronounceable session names using consonant-vowel patterns
# Names are 4-5 characters, easy to read and distinguish

# Consonants that work well at the start of syllables
CONSONANTS=(b c d f g h j k l m n p r s t v w z)
# Vowels
VOWELS=(a e i o u)
# Consonants that work well at the end of syllables
END_CONSONANTS=(b d f g k l m n p r s t x z)

# Get a random element from an array
random_from() {
    local arr=("$@")
    echo "${arr[RANDOM % ${#arr[@]}]}"
}

# Generate a pronounceable name (CVCVC or CVCCV pattern)
generate_name() {
    local c1=$(random_from "${CONSONANTS[@]}")
    local v1=$(random_from "${VOWELS[@]}")
    local c2=$(random_from "${CONSONANTS[@]}")
    local v2=$(random_from "${VOWELS[@]}")
    local c3=$(random_from "${END_CONSONANTS[@]}")

    # Randomly pick between patterns: CVCVC (5 chars) or CVCV (4 chars)
    if (( RANDOM % 2 == 0 )); then
        echo "${c1}${v1}${c2}${v2}${c3}"
    else
        echo "${c1}${v1}${c2}${v2}"
    fi
}

# Get list of existing session names
get_existing_sessions() {
    tmux list-sessions -F '#{session_name}' 2>/dev/null || echo ""
}

# Generate a unique session name
generate_unique_name() {
    local existing=$(get_existing_sessions)
    local name
    local attempts=0
    local max_attempts=50

    while (( attempts < max_attempts )); do
        name=$(generate_name)
        # Check if name already exists
        if ! echo "$existing" | grep -qx "$name"; then
            echo "$name"
            return 0
        fi
        ((attempts++))
    done

    # Fallback: append random number if all attempts failed
    echo "${name}${RANDOM:0:2}"
}

# Main
generate_unique_name
