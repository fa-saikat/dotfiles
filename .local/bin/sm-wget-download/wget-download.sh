#!/usr/bin/env bash

urlregex="(((http|https)://|www\\.)[a-zA-Z0-9.]*[:]?[a-zA-Z0-9./@$&%?$\#=_~-]*)|((magnet:\\?xt=urn:btih:)[a-zA-Z0-9]*)"

echo "$(xclip -o -sel clip)" >> $HOME/.cache/wget-urls.txt

LINK=$(cat $HOME/.cache/wget-urls.txt | grep -aEo "$urlregex" | dmenu -l 10)

alacritty -e wget --directory-prefix $HOME/Downloads "$LINK"  \
    notify-send "wget" "Download Complete!"

