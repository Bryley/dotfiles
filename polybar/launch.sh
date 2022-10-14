#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# VARIABLES #
#
#  MONITOR_X_SIZE \/
#-----------------------------------------------------------------------------
#                      CENTER_WID_SIZE \/               RIGHT_WID_SIZE \/
#                                     --------                      ---------
# | 1 2 3 4 5 6 7 8 9 |               | Time |                      | Extra |
#-                                    ^                             ^
#^                    CENTER_X_OFFSET |              RIGHT_X_OFFSET |
#| BAR_MARGIN

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar_bar.log

BAR_MARGIN=20
CENTER_WID_SIZE=30
RIGHT_WID_SIZE=300

# for monitor_raw in $(
#     xrandr -q | awk '/ connected/ {print $0}' | \
#         sed 's/\( (.\+\)\|connected\|primary//g' | \
#         sed 's/\([0-9]\)x.\+$/\1/g' | \
#         sed 's/\s\+/:/g'
# ); do
#     MONITOR=$(echo $monitor_raw | cut -d ":" -f 1)
#     MONITOR_SIZE=$(echo $monitor_raw | cut -d ":" -f 2)
#
#     echo raw $monitor_raw
#     echo "Monitor '$MONITOR'"
#     echo Size $MONITOR_SIZE
#     echo Margin $BAR_MARGIN
#
#     CENTER_X_OFFSET=$(expr $(expr $MONITOR_SIZE / 2) - $(expr $CENTER_WID_SIZE / 2))
#     echo $CENTER_X_OFFSET
#
#     MONITOR=$MONITOR CENTER_WID_SIZE=$CENTER_WID_SIZE CENTER_X_OFFSET=$CENTER_X_OFFSET BAR_MARGIN=$BAR_MARGIN; polybar -c $DOT_DIR/polybar/bar.ini bar-left 2>&1 | tee -a /tmp/polybar_bar.log & disown
#
#     # MONITOR=$monitor \
#     # CENTER_WID_SIZE=$CENTER_WID_SIZE \
#     # CENTER_X_OFFSET=$CENTER_X_OFFSET \
#     # BORDER_MARGIN=$BORDER_MARGIN \
#     # polybar -c $DOT_DIR/polybar/bar.ini bar-center 2>&1 | \
#     # tee -a /tmp/polybar_bar.log & disown
# done

for monitor in $(xrandr --query | grep ' connected' | awk '{print $1}'); do
    MONITOR=$monitor polybar -c $DOT_DIR/polybar/bar.ini bar-left 2>&1 | tee -a /tmp/polybar_bar.log & disown
    # MONITOR=$monitor polybar -c $DOT_DIR/polybar/bar.ini bar-center 2>&1 | tee -a /tmp/polybar_bar.log & disown
done

echo "Bars launched..."
