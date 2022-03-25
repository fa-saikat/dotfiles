#!/bin/sh

# *-------------------------------------------------*
# | Project Name    - WebApp.sh
# | Created On      - 08/08/21, 10:27:00 AM
# | Author          - MD Fahim Abrar Saikat
# | Author E-Mail   - saikat.cucse.52@gmail.com
# | Author GitHub   - https://github.com/FA-Saikat
# *-------------------------------------------------*

# ░█░█░█▀▀░█▀▄░█▀█░█▀█░█▀█ Websites?
# ░█▄█░█▀▀░█▀▄░█▀█░█▀▀░█▀▀ Pffft..!!
# ░▀░▀░▀▀▀░▀▀░░▀░▀░▀░░░▀░░ Apps (っ▀¯▀)つ

BROWSER=brave

Facebook="https://facebook.com"
YouTube="https://youtube.com"
Messenger="https://messenger.com"
Reddit="https://reddit.com"
Discord="https://discord.com/app"

declare -a WEBSITES=(
" Facebook"
" Messenger"
"ﭮ Discord"
" YouTube"
" Reddit"
)

choice=$(printf '%s\n' "${WEBSITES[@]}" | dmenu -fn 'NotoSansMono Nerd Font:size=13' -nb '#2D2D2D' -nf '#C2C2C2' -sb '#C2C2C2' -sf '#2D2D2D' -i -p 'ＯＰＥＮ :')

if [[ ! -e /usr/bin/brave && ! -e /usr/bin/dmenu ]]; then
    echo "System does not satisfy dependencies!" && exit 1
fi

OPEN_LINK() {
    $BROWSER \
        --no-sandbox \
        --disable-background-networking \
        --disable-background-timer-throttling \
        --disable-backing-store-limit \
        --disable-breakpad \
        --enable-low-end-device-mode \
        --app=$OPEN \
        $@ >/dev/null 2>&1 &
}

if [ "$choice" == " Facebook" ]; then
    OPEN=$(printf '%s\n' "$Facebook" | awk '{print $NF}')
    OPEN_LINK
elif [ "$choice" == " YouTube" ]; then
    OPEN=$(printf '%s\n' "$YouTube" | awk '{print $NF}')
    OPEN_LINK
elif [ "$choice" == " Reddit" ]; then
    OPEN=$(printf '%s\n' "$Reddit" | awk '{print $NF}')
    OPEN_LINK
elif [ "$choice" == " Messenger" ]; then
    OPEN=$(printf '%s\n' "$Messenger" | awk '{print $NF}')
    OPEN_LINK
elif [ "$choice" == "ﭮ Discord" ]; then
    OPEN=$(printf '%s\n' "$Discord" | awk '{print $NF}')
    OPEN_LINK
else
    exit 1
fi

