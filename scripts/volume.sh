
# Basic bash script to control the volume

case $1 in
    get)
        amixer sget Master | awk -F '[][]' '/Left:/ {print $2}'
        ;;

    set)
        amixer set Master $2 | awk -F '[][]' '/Left:/ {print $2}'
        ;;
    mute)
        amixer set Master toggle | awk -F '[][]' '/Left:/ {print $2}'
        ;;
    up)
        amixer set Master 5%+ | awk -F '[][]' '/Left:/ {print $2}'
        ;;

    down)
        amixer set Master 5%- | awk -F '[][]' '/Left:/ {print $2}'
        ;;

    *)
        echo "Don't know what that means"
        ;;
esac
