#!/bin/bash

##For print list windows in active desktop

DMENU="dmenu.xft -fn \"FiraMono-11\" -nb #002b36 -nf #657b83 -sb #002b36 -sf #fdce59"

deskID=$(wmctrl -d | grep "  \* " | grep -o -E "[0-9]+[[:space:]]")
mask="0x[0-9a-z]+[[:space:]]+$deskID"
wnds=$(wmctrl -l | grep -E "$mask" | awk '{print substr($0, index($0,$4))}' )

sel=$(echo "$wnds" | sort -u | $DMENU)

test -z "$sel" && exit 0
wrkid=`wmctrl -d | grep "${sel}" | awk '{print $1}'`
test $wrkid && wmctrl -s $wrkid || wmctrl -a "$sel" || exit 1
exit 0
