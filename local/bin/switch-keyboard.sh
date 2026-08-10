#!/usr/bin/env bash

ENGINE_ENG="xkb:us::eng"
ENGINE_BEN="ibus-avro"

ENGINE_CUR=$(ibus engine)

if [[ "$ENGINE_CUR" == "$ENGINE_ENG" ]]; then
	ibus engine "$ENGINE_BEN"
	notify-send "Keyboard" "Switched to Avro!"
else
	ibus restart
	notify-send "Keyboard" "Switched to English!"
fi
