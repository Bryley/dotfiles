#!/bin/bash

# Add symlinks in .config

ln -sf $(pwd)/xinitrc ~/.xinitrc
ln -sf $(pwd)/zshenv ~/.zshenv
ln -sf $(pwd)/alacritty.yml ~/.config/alacritty.yml

rm -rf ~/.config/nvim
rm -rf ~/.config/emacs
rm -rf ~/.config/tmux
rm -rf ~/.config/zsh
rm -rf ~/.config/awesome
rm -rf ~/.config/rofi
rm -rf ~/.config/picom
rm -rf ~/.config/qtile
rm -rf ~/.config/eww
rm -rf ~/.config/bspwm
rm -rf ~/.config/sxhkd
rm -rf ~/.config/dunst

ln -sf $(pwd)/nvim ~/.config/nvim
ln -sf $(pwd)/emacs ~/.config/emacs
ln -sf $(pwd)/tmux ~/.config/tmux
ln -sf $(pwd)/zsh ~/.config/zsh
ln -sf $(pwd)/awesome ~/.config/awesome
ln -sf $(pwd)/qtile ~/.config/qtile
ln -sf $(pwd)/rofi ~/.config/rofi
ln -sf $(pwd)/picom ~/.config/picom
ln -sf $(pwd)/eww ~/.config/eww
ln -sf $(pwd)/bspwm ~/.config/bspwm
ln -sf $(pwd)/sxhkd ~/.config/sxhkd
ln -sf $(pwd)/dunst ~/.config/dunst

