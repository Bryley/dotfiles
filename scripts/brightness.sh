
BACKLIGHT_DIR=$(ls -d /sys/class/backlight/* | head -1)
CURRENT_BRIGHTNESS=$(cat $BACKLIGHT_DIR/actual_brightness)
MAX_BRIGHTNESS=$(cat $BACKLIGHT_DIR/max_brightness)

case $1 in
    get)
        awk -v c=$CURRENT_BRIGHTNESS -v m=$MAX_BRIGHTNESS 'BEGIN {print (c/m)*100 }'
        ;;
    set)
        BRIGHTNESS=$(awk -v m=$MAX_BRIGHTNESS -v n=$2 'BEGIN {print ( (n/100) * m )}')
        BRIGHTNESS=$(printf "%.0f\n" "$BRIGHTNESS")
        
        echo $BRIGHTNESS > $BACKLIGHT_DIR/brightness
        # Return new percentage
        echo $2
        ;;
    up)
        NEW_PERC=$(awk -v c=$CURRENT_BRIGHTNESS -v m=$MAX_BRIGHTNESS 'BEGIN { print (c/m) * 100 + 5 }')
        NEW_PERC=$(printf "%.0f\n" "$NEW_PERC")
        BRIGHTNESS=$(awk -v m=$MAX_BRIGHTNESS -v n=$NEW_PERC 'BEGIN {print ( (n/100) * m )}')
        BRIGHTNESS=$(printf "%.0f\n" "$BRIGHTNESS")

        echo $BRIGHTNESS > $BACKLIGHT_DIR/brightness
        # Return new percentage
        echo $NEW_PERC
        ;;
    down)
        NEW_PERC=$(awk -v c=$CURRENT_BRIGHTNESS -v m=$MAX_BRIGHTNESS 'BEGIN { print (c/m) * 100 - 5 }')
        NEW_PERC=$(printf "%.0f\n" "$NEW_PERC")
        BRIGHTNESS=$(awk -v m=$MAX_BRIGHTNESS -v n=$NEW_PERC 'BEGIN {print ( (n/100) * m )}')
        BRIGHTNESS=$(printf "%.0f\n" "$BRIGHTNESS")

        echo $BRIGHTNESS > $BACKLIGHT_DIR/brightness
        # Return new percentage
        echo $NEW_PERC
        ;;
    *)
        echo "Don't know what that means"
        ;;
esac
