#!/bin/bash

# Script will generate a blurry wallpaper

convert $HOME/.config/bspwm/wallpaper.jpeg -resize $(xdpyinfo | grep dimensions | sed -r 's/^[^0-9]*([0-9]+x[0-9]+).*$/\1/')\! -blur 0x25 $HOME/.config/bspwm/wallpaper_blurry.jpeg

