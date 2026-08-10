#!/bin/bash

which autorandr &> /dev/null || {
    notify-send "Autorandr not found!"
    exit 1
}

mapfile -t available_layout < <( autorandr --list )

my_choice=$(printf '%s\n' "${available_layout[@]}" | dmenu -l 5 -p "Select Layout:" )

[[ -z $my_choice ]] && notify-send "Nothing selected!" || {
    autorandr --load $my_choice
}
