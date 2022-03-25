#!/bin/sh

# *-------------------------------------------------*
# | Project Name    - share.sh
# | Created On      - 09/24/21, 08:59:35 PM
# | Author          - MD Fahim Abrar Saikat
# | Author E-Mail   - saikat.cucse.52@gmail.com
# | Author GitHub   - https://github.com/FA-Saikat
# *-------------------------------------------------*

file=$(find ./ -type f | fzf)

curl -F "file=@$file" 0x0.st | xclip -sel c

