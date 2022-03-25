#!/usr/bin/env sh

# Derived from Luke Smith's script.

dmenu_bg="#2a2f33"
dmenu_fg="#acb765"
dmenu_sbg="#2a2f33"
dmenu_sfg="#d76e6e"

SCRIPT_DIR=$(dirname "$(readlink -f -- "$0")")

# chosen=$(cut -d ';' -f1 "$SCRIPT_DIR/emojies.txt" | rofi - dmenu -i | sed "s/ .*//")
chosen=$(cut -d ';' -f1 "$SCRIPT_DIR/emojies.txt" | dmenu -fn 'Jetbrains Mono Nerd Font:style=Regular:size=18' -nb "$dmenu_bg" -nf "$dmenu_fg" -sb "$dmenu_sbg" -sf "$dmenu_sfg" -c -i -l 15 | sed "s/ .*//")

[ -z "$chosen" ] && exit

printf "$chosen" | xclip -sel c
notify-send "\"$chosen\" copied to clipboard"
