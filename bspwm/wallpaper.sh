#!/bin/bash

WALLPAPER="https://unsplash.com/photos/x9gqq2wUrV0/download?ixid=MnwxMjA3fDB8MXx0b3BpY3x8Ym84alFLVGFFMFl8fHx8fDJ8fDE2NzE2MDQ4ODA&force=true" # Green mountain at sunset
WALLPAPER="https://unsplash.com/photos/XAdQD0JRZ9Y/download?ixid=MnwxMjA3fDB8MXx0b3BpY3x8Ym84alFLVGFFMFl8fHx8fDJ8fDE2NzE2MDY1MTI&force=true" # Snowy mountain with huts on side

curl -L -o downloaded_image $WALLPAPER

EXT=$(identify downloaded_image | cut -f 2 -d " " | tr '[:upper:]' '[:lower:]')
mv downloaded_image "wallpaper.$EXT"

convert -quality 100 "wallpaper.$EXT" wallpaper.jpeg
