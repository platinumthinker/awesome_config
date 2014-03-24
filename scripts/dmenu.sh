#!/bin/sh

str=""
for i in $@;
do
    str=$str$i"\n";
done

$(echo $str | dmenu.xft -fn 'DejaVu Mono-10:normal' \
    -nb '#002b36' -nf '#657b83' -sb '#002b36' -sf '#fdce59')

