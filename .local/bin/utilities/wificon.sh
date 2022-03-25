#!/bin/bash

# *-------------------------------------------------*
# | Project Name    - wificon
# | Created On      - 03/05/22, 08:39:14 PM
# | Author          - MD Fahim Abrar Saikat
# | Author E-Mail   - saikat.cucse.52@gmail.com
# | Author GitHub   - https://github.com/FA-Saikat
# *-------------------------------------------------*

CONNECT(){
    nmcli dev wifi con "$BSSID" password "$PASS"
}
type dmenu &> /dev/null && {
    BSSID=$(nmcli dev wifi list | sed -n '1!p' | cut -b 9- | \
            dmenu -fn "NotoSansMono Nerd Font:size=14" -nb "#1F2227" -nf "#97B6c6" -sb "#1F2227" -sf "#ED8784" -l 10 | \
            cut -d' ' -f1)
    if [[ -n "$BSSID" ]]; then
        PASS=$(echo "" | dmenu -fn "NotoSansMono Nerd Font:size=14" -nb "#1F2227" -nf "#97B6c6" -sb "#1F2227" -sf "#ED8784" -p 'Password: ')
        if [[ -n "$PASS" ]]; then
            exit 1
        fi
    else
        exit 1
    fi
    CONNECT  &> /dev/null
    exit 0
}
