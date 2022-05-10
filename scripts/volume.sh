
# Basic bash script to control the volume

case $1 in
    get)
        # amixer sget Master | awk -F '[][]' '/Left:/ {print $2}'
        amixer sget Master | awk -F '[][]' '{print $2}' | awk '/[0-9]/ { print $0 }'
        ;;
    set)
        amixer set Master $2 | awk -F '[][]' '{print $2}' | awk '/[0-9]/ { print $0 }'
        ;;
    mute)
        amixer set Master toggle | awk -F '[][]' '{print $2}' | awk '/[0-9]/ { print $0 }'
        ;;
    up)
        amixer set Master 5%+ | awk -F '[][]' '{print $2}' | awk '/[0-9]/ { print $0 }'
        ;;
    down)
        amixer set Master 5%- | awk -F '[][]' '{print $2}' | awk '/[0-9]/ { print $0 }'
        ;;
    *)
        echo "Don't know what that means"
        ;;
esac
