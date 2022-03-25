#!/bin/bash

# *-------------------------------------------------*
# | Project Name    - ncrpt
# | Created On      - 08/07/21, 12:23:53 AM
# | Author          - MD Fahim Abrar Saikat
# | Author E-Mail   - saikat.cucse.52@gmail.com
# | Author GitHub   - https://github.com/FA-Saikat
# *-------------------------------------------------*

encrypt() {
    gpg -c --yes -v --no-symkey-cache --cipher-algo AES256 < "$1" > "$1".gpg
}

compress() {
    tar -zcvf "$filename" "$@"
}

printf "$(tput bold setaf 3):: Selected Files:\n$(tput sgr0)"

for ARG in "$@"; do
    printf "$(tput smso setaf 6)%s$(tput sgr0)\n" "${ARG[*]}"
done

if [[ -f $1 ]]; then
    encrypt "$1" && printf "$(tput bold setaf 3):: Encryption Successfull!$(tput sgr0)\n" && rm -rf "$1"
elif [[ -d $* ]]; then
    compress "$*" && filename="$1.tar.gz"
    encrypt "$filename" && printf "$(tput bold setaf 3):: Encryption Successfull!$(tput sgr0)\n" && exit 0
else
    exit 1
fi



