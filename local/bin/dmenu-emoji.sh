#!/usr/bin/env sh

# Derived from Luke Smith's script.

dmenu_bg="#141B1E"
dmenu_fg="#E57474"
dmenu_sbg="#141B1E"
dmenu_sfg="#8CCF7E"

SCRIPT_DIR=$(dirname "$(readlink -f -- "$0")")

# chosen=$(cut -d ';' -f1 "$SCRIPT_DIR/emojies.txt" | rofi - dmenu -i | sed "s/ .*//")
chosen=$(cut -d ';' -f1 "$SCRIPT_DIR/emojies.txt" | dmenu -fn 'NotoColorEmoji:style=Regular:size=18' -nb "$dmenu_bg" -nf "$dmenu_fg" -sb "$dmenu_sbg" -sf "$dmenu_sfg" -i -l 15 | sed "s/ .*//")

[ -z "$chosen" ] && exit

printf "$chosen" | xclip -sel c
notify-send "\"$chosen\" copied to clipboard"
