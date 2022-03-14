
main() {
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
