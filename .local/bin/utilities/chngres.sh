#!/usr/bin/sh

# *-------------------------------------------------*
# | Project Name    - resolution
# | Created On      - 10/24/21, 12:29:32 AM
# | Author          - MD Fahim Abrar Saikat
# | Author E-Mail   - saikat.cucse.52@gmail.com
# | Author GitHub   - https://github.com/FA-Saikat
# *-------------------------------------------------*

mode=$(xrandr | awk 'NR >= 3 && NR <=20 {print $1}')
choice=$(printf '%s\n' "${mode[@]}" | dmenu -fn 'NotoSansMono Nerd Font:size=11' -nb '#29363d' -nf '#c2c2c2' -sb '#acdea0' -sf '#2a373f' -i -l 15 -p "ＳＥＬＥＣＴ：")

xrandr --output eDP-1 --mode "${choice}" &> /dev/null
