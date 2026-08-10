#!/bin/bash

# set -n
# set -e

which ibus &> /dev/null || {
    notify-send "Keyboard Layout" "ibus Not Found!"
    exit 1
}

ENGINE_ENG="xkb:us::eng"
ENGINE_BN="ibus-avro"

ENGINE=$(ibus engine)

if [[ "$ENGINE" == "$ENGINE_ENG" ]]
then
    ibus engine "$ENGINE_BN" && notify-send "Keyboard Layout" "Switched to Bangla"
    exit 0
else
    ibus engine "$ENGINE_ENG" && notify-send "Keyboard Layout" "Switched to English"
    exit 0
fi
