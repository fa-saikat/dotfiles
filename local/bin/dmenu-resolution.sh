#!/bin/bash

set -euo pipefail

CURRENT_DISPLAY=$(xrandr | sed -n '2p' | cut -d' ' -f1)
MODE=$(xrandr | awk 'NR >= 3 && /[0-9]+x[0-9]+/ {print $1}')
CHOICE=$(printf '%s\n' "${MODE[@]}" | dmenu -fn 'NotoSansMono Nerd Font:size=11' -nb '#29363d' -nf '#c2c2c2' -sb '#acdea0' -sf '#2a373f' -i -l 15 -p "Select resolution:")

[[ -z "$CHOICE" ]] && exit 1

xrandr --output "$CURRENT_DISPLAY" --mode "${CHOICE}" &> /dev/null
