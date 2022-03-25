#!/bin/sh

# ░█▀▀░█▀▀░█░█░░░░░█░█░█▀▀░█░█░█▀▀░█▀▀░█▀█░░░█░█░█▀▀░█░░░█▀█░█▀▀░█▀▄ Generate
# ░▀▀█░▀▀█░█▀█░▄▄▄░█▀▄░█▀▀░░█░░█░█░█▀▀░█░█░░░█▀█░█▀▀░█░░░█▀▀░█▀▀░█▀▄ Add
# ░▀▀▀░▀▀▀░▀░▀░░░░░▀░▀░▀▀▀░░▀░░▀▀▀░▀▀▀░▀░▀░░░▀░▀░▀▀▀░▀▀▀░▀░░░▀▀▀░▀░▀ Git

# *-------------------------------------------------*
# | Project Name    - git-setup.sh
# | Created On      - 08/07/21, 07:24:37 PM
# | Author          - MD Fahim Abrar Saikat
# | Author E-Mail   - saikat.cucse.52@gmail.com
# | Author GitHub   - https://github.com/FA-Saikat
# *-------------------------------------------------*

DIR="/sys/firmware/efi"

echo "$(tput bold setaf 3):: Enter your E-Mail: " && read mail
echo ":: Enter your Name: $(tput sgr0)" && read name

if [ -d $DIR ]; then
    ssh-keygen -t ed25519 -C "$mail"
else
    ssh-keygen -t rsa -b 4096 -C "$mail"
fi

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

git config --global user.email "$mail"
git config --global user.name "$name"

echo "$(tput bold setaf 3)Done!$(tput sgr0)"

exit 0
