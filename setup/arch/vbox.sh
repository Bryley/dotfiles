# 
# Contains code to run if running inside a virtual box
#

# TODO if statement

sudo pacman --noconfirm -S virtualbox-guest-utils       # Guest additions for vbox

# Enable vbox service
sudo systemctl enable vboxservice.service

# TODO Add XDG autostart to awesome config at wiki.archlinux.org/title/Awesome#Autostart
