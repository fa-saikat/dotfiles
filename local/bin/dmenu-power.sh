#!/bin/bash

declare -a actions=(
    'Lock'
    'Reboot'
    'Shutdown'
)

choice=$(printf "%s\n" "${actions[@]}" | dmenu -l 5)

case $choice in
    "${actions[0]}")
        slock && exit 0
        ;;
    "${actions[1]}")
        reboot && exit 0
        ;;
    "${actions[2]}")
        shutdown now && exit 0
        ;;
    *)
        exit 1
esac

