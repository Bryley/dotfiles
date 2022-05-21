#!/bin/sh
redshift -l 27.4705:153.0260 &          # Blue light filter
udiskie &                               # USB handler
setxkbmap -option caps:ctrl_modifier    # Make Cap locks act as control
picom -f --experimental-backends -b &   # Compositor
