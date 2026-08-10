#!/bin/bash

# Configuration
STEP=0.1  # Default brightness step (adjust this value dynamically as needed)
DIRECTION="$1"  # 'up' or 'down' to adjust brightness
VALID_STEP_REGEX="^0(\.[0-9]+)?$|^1(\.0+)?$"  # Valid range: 0.1 to 1.0

# Function to get the active monitor
get_active_monitor() {
    local xdotool_out current_x current_y active_monitor
    if ! xdotool_out=$(xdotool getmouselocation --shell 2>/dev/null); then
        printf "Error: 'xdotool' not available or failed to fetch cursor position.\n" >&2
        return 1
    fi

    current_x=$(echo "$xdotool_out" | grep '^X=' | cut -d= -f2)
    current_y=$(echo "$xdotool_out" | grep '^Y=' | cut -d= -f2)

    if [[ -z "$current_x" || -z "$current_y" ]]; then
        printf "Error: Unable to determine cursor position.\n" >&2
        return 1
    fi

    if ! active_monitor=$(xrandr --current | grep -oP "^.+ connected.*" | \
        awk -v x="$current_x" -v y="$current_y" '
        match($0, /([0-9]+)x([0-9]+)\+([0-9]+)\+([0-9]+)/, res) {
            if (x >= res[3] && x < (res[3] + res[1]) &&
                y >= res[4] && y < (res[4] + res[2])) {
                print $1;
                exit;
            }
        }'); then
        printf "Error: Unable to determine active monitor.\n" >&2
        return 1
    fi

    if [[ -z "$active_monitor" ]]; then
        printf "Error: No active monitor found for current cursor position.\n" >&2
        return 1
    fi

    printf "%s\n" "$active_monitor"
    return 0
}

# Function to adjust brightness using xrandr
adjust_brightness_xrandr() {
    local monitor direction step current_brightness new_brightness
    monitor="$1"
    direction="$2"
    step="$3"

    # Get current brightness
    if ! current_brightness=$(xrandr --verbose | grep -A 10 "^$monitor" | grep 'Brightness:' | awk '{print $2}'); then
        printf "Error: Unable to fetch current brightness for monitor '%s'.\n" "$monitor" >&2
        return 1
    fi

    if [[ -z "$current_brightness" || ! "$current_brightness" =~ ^0(\.[0-9]+)?$|^1(\.0+)?$ ]]; then
        printf "Error: Invalid brightness value fetched: '%s'.\n" "$current_brightness" >&2
        return 1
    fi

    # Calculate new brightness
    if [[ "$direction" == "up" ]]; then
        new_brightness=$(echo "$current_brightness + $step" | bc)
    elif [[ "$direction" == "down" ]]; then
        new_brightness=$(echo "$current_brightness - $step" | bc)
    else
        printf "Error: Invalid direction '%s'. Use 'up' or 'down'.\n" "$direction" >&2
        return 1
    fi

    # Ensure new brightness is within the valid range [0.1, 1.0]
    if (( $(echo "$new_brightness < 0.1" | bc -l) )); then
        new_brightness=0.1
    elif (( $(echo "$new_brightness > 1.0" | bc -l) )); then
        new_brightness=1.0
    fi

    # Apply new brightness
    if ! xrandr --output "$monitor" --brightness "$new_brightness"; then
        printf "Error: Failed to set brightness to '%s' for monitor '%s'.\n" "$new_brightness" "$monitor" >&2
        return 1
    fi

    printf "Brightness for monitor '%s' set to %s.\n" "$monitor" "$new_brightness"
    return 0
}

main() {
    # Validate step is in the range 0.1 to 1.0
    if [[ ! "$STEP" =~ $VALID_STEP_REGEX ]]; then
        printf "Error: Invalid step value '%s'. Must be in range 0.1 to 1.0.\n" "$STEP" >&2
        return 1
    fi

    # Validate direction
    if [[ -z "$DIRECTION" || ! "$DIRECTION" =~ ^(up|down)$ ]]; then
        printf "Usage: %s [up|down]\n" "$(basename "$0")" >&2
        return 1
    fi

    # Get active monitor
    local active_monitor
    if ! active_monitor=$(get_active_monitor); then
        printf "Error: Failed to determine active monitor.\n" >&2
        return 1
    fi

    # Adjust brightness
    if ! adjust_brightness_xrandr "$active_monitor" "$DIRECTION" "$STEP"; then
        printf "Error: Failed to adjust brightness.\n" >&2
        return 1
    fi

    return 0
}

# Entrypoint
main

