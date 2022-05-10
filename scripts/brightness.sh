
BACKLIGHT_DIR=$(ls -d /sys/class/backlight/* | head -1)
CURRENT_BRIGHTNESS=$(cat $BACKLIGHT_DIR/actual_brightness)
MAX_BRIGHTNESS=$(cat $BACKLIGHT_DIR/max_brightness)

case $1 in
    get)
        awk -v c=$CURRENT_BRIGHTNESS -v m=$MAX_BRIGHTNESS 'BEGIN {print (c/m)*100 }'
        ;;
    set)
        awk -v m=$MAX_BRIGHTNESS -v n=$2 'BEGIN {print ( (n/100) * m )}' > $BACKLIGHT_DIR/brightness
        ;;
    up)
        NEW_PERC=$(awk -v c=$CURRENT_BRIGHTNESS -v m=$MAX_BRIGHTNESS 'BEGIN {print (c/m)*100 + 5 }')
        awk -v m=$MAX_BRIGHTNESS -v n=$NEW_PERC 'BEGIN {print ( (n/100) * m )}' > $BACKLIGHT_DIR/brightness
        ;;

    down)
        NEW_PERC=$(awk -v c=$CURRENT_BRIGHTNESS -v m=$MAX_BRIGHTNESS 'BEGIN {print (c/m)*100 - 5 }')
        awk -v m=$MAX_BRIGHTNESS -v n=$NEW_PERC 'BEGIN {print ( (n/100) * m )}' > $BACKLIGHT_DIR/brightness
        ;;

    *)
        echo "Don't know what that means"
        ;;
esac
