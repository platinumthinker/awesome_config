#!/bin/sh

DMENU="dmenu.xft -fn \"FiraMono-11\" -nb #002b36 -nf #657b83 -sb #002b36 -sf #fdce59"

wnds=$(wmctrl -l | awk '{print substr($0, index($0,$4))}')

sel=$(echo "$wnds" | sort -u | $DMENU)
test -z "$sel" && exit 0
wrkid=`wmctrl -d | grep "${sel}" | awk '{print $1}'`
test $wrkid && wmctrl -s $wrkid || wmctrl -a "$sel" || exit 1
exit 0
