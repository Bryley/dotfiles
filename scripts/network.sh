# Code adapted from dracula tmux script to get network:
# https://github.com/dracula/tmux

HOSTS="google.com github.com example.com"

main() {
    network="Offline"
    for host in $HOSTS; do
        # Do a single ping request to server waiting only a second
        if ping -q -c 1 -W 1 $host &> /dev/null; then
            SSID=$(iw dev | sed -nr 's/^\t\tssid (.*)/\1/p')
            if [ -n "$SSID" ]; then
                # printf '%s' "$SSID"
                network=$SSID
            else
                network='Ethernet'
            fi
            break
        fi
    done

    echo "$network"
}

main
