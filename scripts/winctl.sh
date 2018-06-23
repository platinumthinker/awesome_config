#!/bin/bash

readonly FILE_TRIGGER=$HOME/.color
if [[ ! -f "$FILE_TRIGGER" ]]; then
    echo "light" > .color
fi

if [[ $(cat "$FILE_TRIGGER") == "light" ]]; then
    BACK='#fdf6e3'
    FG='#002b36'
else
    BACK='#002b36'
    FG='#657b83'
fi
FONT="DejaVu Mono-14"

wnds=$(wmctrl -l | awk '{print substr($0, index($0,$4))}')

sel=$(echo "$wnds" | sort -u |
    dmenu -fn "$FONT" -nb "$BACK" -nf "$FG" -sb "$BACK" -sf "#dc322f")
test -z "$sel" && exit 0
wrkid=$(wmctrl -d | grep "${sel}" | awk '{print $1}')
test "$wrkid" && wmctrl -s "$wrkid" || wmctrl -a "$sel" || exit 1
exit 0
