#!/bin/bash

echo "This script will install and setup all the simlinks and install any dependencies for the system"
echo "Note that this will remove some files and folders you have in ~/.config,"
echo "If you want to be careful make a backup."
echo ""

read -r -p "Are you sure you want to procceed? [y/N] " response
if ! [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
	echo "No changes were made to ~/.config"
	exit 0
fi

# TODO setup for debian distros
DISTRO=arch

bash setup/$DISTRO/install.sh
bash setup/symlinks.sh

# Installing software

printf "\n%b\n" "\e[32m All done you might want to reboot your computer for some changes to take place \e[0m"
printf "\n%b\n" "\e[32m Note if you are running on virtualbox please execute the script in 'setup/${DISTRO}/vbox.sh' before rebooting \e[0m"
