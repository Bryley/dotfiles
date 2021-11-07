#!/bin/bash

echo "This script will install and setup all the simlinks and install any apt dependencies"
echo "Note that this will remove some files and folders you have in ~/.config,"
echo "If you want to be careful make a backup."
echo ""

read -r -p "Are you sure you want to procceed? [y/N] " response
if ! [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
	echo "No changes were made to ~/.config"
	exit 0
fi


# Add Simlinks
ln -sf $(pwd)/alacritty.yml ~/.config/alacritty.yml
rm -rf ~/.config/nvim
rm -rf ~/.config/fish
rm -rf ~/.config/tmux
ln -sf $(pwd)/nvim ~/.config/nvim
ln -sf $(pwd)/fish ~/.config/fish
ln -sf $(pwd)/tmux ~/.config/tmux

printf "\n%b\n" "\e[32mFinished creating simlinks\e[0m"

printf "\n%b\n" "\e[32mInstalling Nerd Fonts\e[0m"
mkdir ~/.local/share/fonts
curl -L -o ~/.local/share/fonts/HackBold.ttf https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Bold/complete/Hack%20Bold%20Nerd%20Font%20Complete.ttf
curl -L -o ~/.local/share/fonts/HackBoldItalic https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/BoldItalic/complete/Hack%20Bold%20Italic%20Nerd%20Font%20Complete.ttf
curl -L -o ~/.local/share/fonts/HackItalic https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Italic/complete/Hack%20Italic%20Nerd%20Font%20Complete.ttf
curl -L -o ~/.local/share/fonts/HackRegular https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf
fc-cache -f

# Install packages
printf "\n%b\n" "\e[32mRemoving vim packages\e[0m"
sudo apt remove neovim
sudo apt remove vim

# Install neovim 0.5
printf "\n%b\n" "\e[32mInstalling latest version of neovim\e[0m"
curl -L -o nvim.appimage https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
chmod +x ./nvim.appimage
ln -sf $(pwd)/nvim.appimage $HOME/.local/bin/nvim


printf "\n%b\n" "\e[32mSetting up neovim\e[0m"
nvim --headless -u ./nvim/setup_init.vim +PlugInstall +qall
# Remove current Treesitter parsers
rm $(pwd)/nvim/plugged/nvim-treesitter/parser/*.so
nvim --headless +"TSInstallSync css html javascript json5 python typescript" +qall
nvim --headless +"LspInstall pyright sumneko_lua tsserver" +qall

printf "\n%b\n" "\e[32mAll done you might want to close and reopen your shell for changes to take place\e[0m"