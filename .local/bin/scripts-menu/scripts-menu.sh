#!/usr/bin/env sh

# *-------------------------------------------------*
# | Project Name    - scripts-menu.sh
# | Created On      - 02/17/22, 09:50:20 PM
# | Author          - MD Fahim Abrar Saikat
# | Author E-Mail   - saikat.cucse.52@gmail.com
# | Author GitHub   - https://github.com/FA-Saikat
# *-------------------------------------------------*
# Displays a menu of scripts to choose from.

SCRIPT_DIR=$(dirname "$(readlink -f -- "$0")")

chosen=$(cat "$SCRIPT_DIR/scripts-menu.txt" | sed 's/.*\///' | dmenu -fn 'NotoSansMono Nerd Font:style=Medium:size=18' -c -i -l 10)
"$SCRIPT_DIR/$(grep "$chosen" "$SCRIPT_DIR/scripts-menu.txt")"
