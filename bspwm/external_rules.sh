#!/bin/bash

wid=$1
class=$2
instance=$3
consequences=$4

title="$(xtitle "$wid")"

# Rule for Chromium's Picture in picture mode to be floating
[ -z "$class" ] && [ -z "$instance" ] && [ "$title" = "Picture in picture" ] \
    && echo 'state=floating'

[ "$class" = "Matplotlib" ] && echo 'state=floating' ]

# echo "'${title}' '${wid}'" "'${class}'" "'${instance}'" "'${consequences}'" >> ~/Desktop/test_rules

