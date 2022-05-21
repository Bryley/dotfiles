
main() {
    # Check if device has battery and return 1 if so
    ls -d /sys/class/power_supply/BAT* > /dev/null &> /dev/null
    ret=$?
    if [ $ret -ne 0 ]; then
        return 1;
    fi

    BAT=$(ls -d /sys/class/power_supply/BAT* | head -1)

    status=$(cat $BAT/status) # Either "Charging" or "Discharging"
    percentage=$(cat $BAT/capacity)

    icon=""
    if [[ "$status" == "Charging" ]]; then
        icon="+"
    fi

    echo "$percentage%$icon"
}

main
