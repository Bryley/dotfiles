#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar_bar.log

for monitor in $(xrandr --query | grep ' connected' | awk '{print $1}'); do
    MONITOR=$monitor polybar -c $DOT_DIR/polybar/bar.ini bar-left   2>&1 | tee -a /tmp/polybar_bar.log & disown
    MONITOR=$monitor polybar -c $DOT_DIR/polybar/bar.ini bar-center 2>&1 | tee -a /tmp/polybar_bar.log & disown
    MONITOR=$monitor polybar -c $DOT_DIR/polybar/bar.ini bar-right 2>&1 | tee -a /tmp/polybar_bar.log & disown
done

echo "Bars launched..."
