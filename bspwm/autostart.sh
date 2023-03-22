
# Use .Xresources (handy for high DPI screens
xrdb -merge ~/.Xresources &

# Keyboard event software
pkill sxhkd; sxhkd &

# Notification Software
pkill dunst; dunst &

# Bar
bash $DOT_DIR/polybar/launch.sh

# Polkit authentication agent
pkill lxqt-policykit-agent; lxqt-policykit-agent &

# Program for auto mounting USBs
pkill udiskie; udiskie &

# Remap caplocks to control
setxkbmap -option caps:ctrl_modifier

# Set the cursor to a default cursor when not hovering in window
xsetroot -cursor_name left_ptr &

# Use redshift to reduce blue light for brisbane lat and longitude
pkill redshift; redshift -l 27.4705:153.0260 &

# TODO Auto download wallpaper online and set it
feh --bg-fill $DOT_DIR/bspwm/wallpaper.jpeg &

# Compositor
picom -b --animations --animation-window-mass=0.5 --animation-stiffness=350 --animation-for-open-window=zoom

# Widget controler
# eww daemon
