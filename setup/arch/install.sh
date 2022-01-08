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

# Update packages
sudo pacman -Syu --noconfirm && yay -Sua

# GUI stuff
sudo pacman --noconfirm -S xorg         # Contains usuful packages for xorg display server
sudo pacman --noconfirm -S picom        # A compositor for xorg (Useful for animations, opaque windows and more)
sudo pacman --noconfirm -S awesome      # The lua based window manager
sudo pacman --noconfirm -S alacritty    # Terminal emulator
sudo pacman --noconfirm -S rofi         # A better application search menu # TODO add later
sudo pacman --noconfirm -S xorg-xinit   # Starts xorg with 'startx' command # TODO This will be changed to a display manager like lightdm

# TODO display manager for login screen

# Essential programs
sudo pacman --noconfirm -S wget         # A basic commandline tool for sending requests on the internet
sudo pacman --noconfirm -S unzip        # Unzips files (This and wget required for LSP servers for neovim)
sudo pacman --noconfirm -S tmux         # Terminal multiplexer
sudo pacman --noconfirm -S zsh          # Z shell modern alternate to bash
sudo pacman --noconfirm -S neovim       # The latest version of neovim text editor
sudo pacman --noconfirm -S ripgrep       # A better grep alternative used by neovim plugin telescope



# AUR programs
yay -S nvm brave
# TODO command not found package

# nvm install node # TODO not gonna work as zsh is not active

printf "\n%b\n" "\e[32m Changing default shell to zsh \e[0m"

chsh -s /usr/bin/zsh

# TODO install node version manager and node

printf "\n%b\n" "\e[32m Installing Nerd Fonts \e[0m"
mkdir -p ~/.local/share/fonts
# Hack font
curl -L -o ~/.local/share/fonts/HackBold.ttf https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Bold/complete/Hack%20Bold%20Nerd%20Font%20Complete.ttf
curl -L -o ~/.local/share/fonts/HackBoldItalic https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/BoldItalic/complete/Hack%20Bold%20Italic%20Nerd%20Font%20Complete.ttf
curl -L -o ~/.local/share/fonts/HackItalic https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Italic/complete/Hack%20Italic%20Nerd%20Font%20Complete.ttf
curl -L -o ~/.local/share/fonts/HackRegular https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf

# Roboto font
curl -L -o ~/.local/share/fonts/RobotoBold.ttf https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/RobotoMono/Bold/complete/Roboto%20Mono%20Bold%20Nerd%20Font%20Complete.ttf
curl -L -o ~/.local/share/fonts/RobotoBoldItalic.ttf https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/RobotoMono/Bold-Italic/complete/Roboto%20Mono%20Bold%20Italic%20Nerd%20Font%20Complete.ttf
curl -L -o ~/.local/share/fonts/RobotoItalic.ttf https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/RobotoMono/Italic/complete/Roboto%20Mono%20Italic%20Nerd%20Font%20Complete.ttf
curl -L -o ~/.local/share/fonts/RobotoRegular.ttf https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/RobotoMono/Regular/complete/Roboto%20Mono%20Nerd%20Font%20Complete.ttf
fc-cache -f

printf "\n%b\n" "\e[32m Finished installing software \e[0m"
