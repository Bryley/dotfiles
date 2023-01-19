#!/bin/bash

#
# This script is for installing nessessary packages on arch
#

printf "\n%b\n" "\e[32m Installing packages \e[0m"

# Installing yay if it doesn't exists

if ! command -v yay &> /dev/null
then
    printf "\n%b\n" "\e[32m 'yay' not found, installing from source \e[0m"

    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
fi

# Update packages and sync databases
sudo pacman --noconfirm -Syu && yay --noconfirm -Sua



# Dependency packages for main packakges
package_dependencies=(
    'wireplumber'           # Audio session manager, dependency for pipewire-pulse
)

# Package list
packages=(
    # GUI
    'xorg'                  # Contains usuful packages for xorg display server
    'bspwm'                 # Tiling Window Manager
    'sxhkd'                 # Keyboard shortcuts for window manager
    'feh'                   # Wallpaper Manager
    'polybar'               # Customisable bar application
    'xsel'                  # Clipboard tool to enable '+' register in neovim
    'alacritty'             # Terminal emulator
    'rofi'                  # A better application search menu
    'xorg-xinit'            # Starts xorg with 'startx' command # TODO This will be changed to a display manager like lightdm
    'udisks2'               # Automatic mounting of USB sticks
    'redshift'              # Filters blue light based on time of day
    'dunst'                 # Notification daemon

    # Audio
    'pipewire'              # Audio framework
    'pipewire-pulse'        # Pulseaudio replacement built into pipewire
    'alsa-utils'            # Utilities for controlling volume

    # Essential programs
    'openssh'               # SSH client for git related stuff
    'wget'                  # A basic commandline tool for sending requests on the internet
    'unzip'                 # Unzips files (This and wget required for LSP)

    'tmux'                  # Terminal multiplexer
    'zsh'                   # Z shell, modern alternate to bash
    'imagemagick'           # An image manipulation software that can be used to blur images

    'networkmanager'        # An easy to use network manager tool (use `nmtui` command)
    'net-tools'             # Useful cmd tools for networking
    'iw'                    # Requirement for tmux config to get network
    'nm-connection-editor'  # A basic GTK GUI for network settings

    'ncdu'                  # NCurses Disk Usage. A terminal UI for analysing disk usage
    'exa'                   # Better alternative to ls command
    'pkgfile'               # Contains the command not found searching tool for better errors
    'fd'                    # Better alternative to the 'find' command.
    'fzf'                   # Fuzzy finder for the command line.

    # Neovim related #
    'neovim'                # The latest version of neovim text editor
    'ripgrep'               # A better grep alternative used by neovim plugin telescope
    # LSPs
    'pyright'               # Python language server by microsoft
    'typescript-language-server' # Typescript and Javascript LSP
    'lua-language-server'   # Sumoneko lua language server
    'rust-analyzer'         # Language server for rust


    # Fonts
    'inter-font'            # Font used for GUI
    'ttf-font-awesome'      # Easy icons stored in a font.
)
# List of AUR packages
aur_packages=(
    # GUI
    # 'picom-git'             # A compositor for xorg
    'xtitle'                # Command that gives info about open window used by bspwm rules
    'picom-pijulius-git'    # A compositor for xorg with great animations
    'awesome-git'           # Awesome Window Manger (dev branch)
    'i3lock-color'          # Lockscreen for X server

    # Essential Programs
    'nvm'                   # Node version manager (Node is used by neovim)
    'command-not-found'     # Shows list of packages for unknown command
    'udiskie'               # Utility for automounting USBs

    'nodejs-svelte-language-server' # Svelte Language server
    'dockerfile-language-server-bin' # Docker language server
    'ltex-ls-bin'           # Latex/Markdown/Org language server

    # Fonts
    'nerd-fonts-hack'       # Font used by terminal emulator
    'nerd-fonts-roboto-mono' # Roboto Nerd font for Awesome WM
    'ttf-material-icons-git' # Googles Material Icons
)


# Install all software required
sudo pacman --noconfirm --asdeps -S ${package_dependencies[@]}
sudo pacman --noconfirm -S ${packages[@]}
yay --sudoloop --noconfirm -S ${aur_packages[@]}


# Start Network Manager
sudo systemctl enable NetworkManager.service
# Sync package database
sudo pkgfile -u


printf "\n%b\n" "\e[32m Changing default shell to zsh \e[0m"

chsh -s /usr/bin/zsh

# printf "\n%b\n" "\e[32m Installing Nerd Fonts \e[0m"
# mkdir -p ~/.local/share/fonts
# Hack font
# curl -L -o ~/.local/share/fonts/HackBold.ttf https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Bold/complete/Hack%20Bold%20Nerd%20Font%20Complete.ttf
# curl -L -o ~/.local/share/fonts/HackBoldItalic https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/BoldItalic/complete/Hack%20Bold%20Italic%20Nerd%20Font%20Complete.ttf
# curl -L -o ~/.local/share/fonts/HackItalic https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Italic/complete/Hack%20Italic%20Nerd%20Font%20Complete.ttf
# curl -L -o ~/.local/share/fonts/HackRegular https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf

# Roboto font TODO not needed as we have installed nerd-fonts-roboto-mono from AUR
# curl -L -o ~/.local/share/fonts/RobotoBold.ttf https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/RobotoMono/Bold/complete/Roboto%20Mono%20Bold%20Nerd%20Font%20Complete.ttf
# curl -L -o ~/.local/share/fonts/RobotoBoldItalic.ttf https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/RobotoMono/Bold-Italic/complete/Roboto%20Mono%20Bold%20Italic%20Nerd%20Font%20Complete.ttf
# curl -L -o ~/.local/share/fonts/RobotoItalic.ttf https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/RobotoMono/Italic/complete/Roboto%20Mono%20Italic%20Nerd%20Font%20Complete.ttf
# curl -L -o ~/.local/share/fonts/RobotoRegular.ttf https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/RobotoMono/Regular/complete/Roboto%20Mono%20Nerd%20Font%20Complete.ttf
# fc-cache -f

# Generate blurry wallpaper
# TODO automatically call later or add in README
# bash $HOME/.config/awesome/wallpapers/generate_blurry.sh

nvm install node

# uDisks2 setup to mount USB devices to /media
sudo mkdir /media
echo "ENV{ID_FS_USAGE}==\"filesystem|other|crypto\", ENV{UDISKS_FILESYSTEM_SHARED}=\"1\"" | sudo tee /etc/udev/rules.d/99-udisks2.rules

printf "\n%b\n" "\e[32m Finished installing software \e[0m"
