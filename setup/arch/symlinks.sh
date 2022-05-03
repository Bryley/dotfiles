
# Add symlinks

ln -sf $(pwd)/xinitrc ~/.xinitrc
ln -sf $(pwd)/zshenv ~/.zshenv
ln -sf $(pwd)/alacritty.yml ~/.config/alacritty.yml

rm -rf ~/.config/nvim
rm -rf ~/.config/emacs
rm -rf ~/.config/tmux
rm -rf ~/.config/zsh
rm -rf ~/.config/awesome
rm -rf ~/.config/rofi

ln -sf $(pwd)/nvim ~/.config/nvim
ln -sf $(pwd)/emacs ~/.config/emacs
ln -sf $(pwd)/tmux ~/.config/tmux
ln -sf $(pwd)/zsh ~/.config/zsh
ln -sf $(pwd)/awesome ~/.config/awesome
ln -sf $(pwd)/rofi ~/.config/rofi

