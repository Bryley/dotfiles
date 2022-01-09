#!/bin/bash

# Script will generate a blurry wallpaper

convert $HOME/.config/awesome/wallpapers/wallpaper.png -resize $(xdpyinfo | grep dimensions | sed -r 's/^[^0-9]*([0-9]+x[0-9]+).*$/\1/')\! -blur 0x25 $HOME/.config/awesome/wallpapers/wallpaper_blurry.png

