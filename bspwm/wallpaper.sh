#!/bin/bash

HOSTNAME=$(cat /etc/hostname)

echo "Found hostname of $HOSTNAME"
if [ "$HOSTNAME" = "workarch" ]; then
    WALLPAPER="https://unsplash.com/photos/ruWkmt3nU58/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8MXx8fGVufDB8fHx8MTY3MzMyNTU4NA&force=true" # Purplish sky beach with mountain in the middle
    WALLPAPER="https://unsplash.com/photos/UWQP2mh5YJI/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8MXx8fGVufDB8fHx8MTY3MzMyNjY1Nw&force=true" # Lagoon
elif [ "$HOSTNAME" = "desktop" ]; then
    # WALLPAPER="https://unsplash.com/photos/XAdQD0JRZ9Y/download?ixid=MnwxMjA3fDB8MXx0b3BpY3x8Ym84alFLVGFFMFl8fHx8fDJ8fDE2NzE2MDY1MTI&force=true" # Snowy mountain with huts on side
    WALLPAPER="https://unsplash.com/photos/dYWB45BChyk/download?ixid=MnwxMjA3fDB8MXx0b3BpY3x8Ym84alFLVGFFMFl8fHx8fDJ8fDE2ODA1MDg5Mjc&force=true" # Lagoon with greenish blue water and steep cliff
else
    WALLPAPER="https://unsplash.com/photos/x9gqq2wUrV0/download?ixid=MnwxMjA3fDB8MXx0b3BpY3x8Ym84alFLVGFFMFl8fHx8fDJ8fDE2NzE2MDQ4ODA&force=true" # Green mountain at sunset
fi

# WALLPAPER="https://unsplash.com/photos/ruWkmt3nU58/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8MXx8fGVufDB8fHx8MTY3MzMyNTU4NA&force=true" # Purplish sky beach with mountain in the middle
# WALLPAPER="https://unsplash.com/photos/x9gqq2wUrV0/download?ixid=MnwxMjA3fDB8MXx0b3BpY3x8Ym84alFLVGFFMFl8fHx8fDJ8fDE2NzE2MDQ4ODA&force=true" # Green mountain at sunset
# WALLPAPER="https://unsplash.com/photos/XAdQD0JRZ9Y/download?ixid=MnwxMjA3fDB8MXx0b3BpY3x8Ym84alFLVGFFMFl8fHx8fDJ8fDE2NzE2MDY1MTI&force=true" # Snowy mountain with huts on side

curl -L -o downloaded_image $WALLPAPER

EXT=$(identify downloaded_image | cut -f 2 -d " " | tr '[:upper:]' '[:lower:]')
mv downloaded_image "$DOT_DIR/bspwm/wallpaper.$EXT"

convert -quality 100 "$DOT_DIR/bspwm/wallpaper.$EXT" $DOT_DIR/bspwm/wallpaper.jpeg

bash ./generate_blurry.sh
