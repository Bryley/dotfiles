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
sudo pacman --noconfirm -S      xorg        \ # Contains usuful packages for xorg display server
                                picom       \ # A compositor for xorg (Useful for animations, opaque windows and more)
                                awesome     \ # The lua based window manager
                                alacritty   \ # Terminal emulator
                                #rofi        \ # A better application search menu       # TODO add later
                                xorg-xinit    # Starts xorg with 'startx' command # TODO This will be changed to a display manager like lightdm

# TODO display manager for login screen


# Essential programs
sudo pacman --noconfirm -Su     wget        \ # A basic commandline tool for sending requests on the internet
                                unzip       \ # Unzips files (This and wget required for LSP servers for neovim)
                                tmux        \ # Terminal multiplexer
                                zsh         \ # Z shell modern alternate to bash
                                neovim      \ # The latest version of neovim text editor
                                ripgrep       # A better grep alternative used by neovim plugin telescope



# AUR programs
sudo yay -S nvm brave
# TODO command not found package

nvm install node


# TODO set zsh as default shell with 'chsh -s <path-to-zsh>'

# TODO install node version manager and node

printf "\n%b\n" "\e[32m Installing Nerd Fonts \e[0m"
mkdir -p ~/.local/share/fonts
curl -L -o ~/.local/share/fonts/HackBold.ttf https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Bold/complete/Hack%20Bold%20Nerd%20Font%20Complete.ttf
curl -L -o ~/.local/share/fonts/HackBoldItalic https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/BoldItalic/complete/Hack%20Bold%20Italic%20Nerd%20Font%20Complete.ttf
curl -L -o ~/.local/share/fonts/HackItalic https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Italic/complete/Hack%20Italic%20Nerd%20Font%20Complete.ttf
curl -L -o ~/.local/share/fonts/HackRegular https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf
fc-cache -f

printf "\n%b\n" "\e[32m Finished installing software \e[0m"
