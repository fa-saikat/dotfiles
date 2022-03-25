#!/bin/bash
# *-------------------------------------------------*
# | Project Name    - bulkrename.sh
# | Created On      - 03/18/22, 11:04:47 AM
# | Author          - MD Fahim Abrar Saikat
# | Author E-Mail   - saikat.cucse.52@gmail.com
# | Author GitHub   - https://github.com/fa-saikat
# *-------------------------------------------------*

printf "$(tput bold setaf 3)::Filename    :$(tput sgr0) " && read file
printf "$(tput bold setaf 3)::Extension   :$(tput sgr0) " && read ext

find . -maxdepth 1 -type f -iname "*" \
    -exec ls {} \; | cat -n | while read i f; \
do mv "$f" "$file-$i.$ext"; done

