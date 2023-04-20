#!/bin/bash

wid=$1
class=$2
instance=$3
consequences=$4

title="$(xtitle "$wid")"

# Below is used for debugging
# echo "THIS IS A RULE: $wid $class $instance\n" >> DEBUG_OUTPUT_DELETE_ME

# Rule for Chromium's Picture in picture mode to be floating
[ -z "$class" ] && [ -z "$instance" ] && [ "$title" = "Picture in picture" ] \
    && echo 'state=floating'

[ "$class" = "Matplotlib" ] && echo 'state=floating'

[ "$class" = "Peek" ] && echo 'state=floating'

