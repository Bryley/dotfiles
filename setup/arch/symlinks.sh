
# Add symlinks

# TODO xinitrc file

ln -sf $(pwd)/zshenv ~/.zshenv
ln -sf $(pwd)/alacritty.yml ~/.config/alacritty.yml

rm -rf ~/.config/nvim
rm -rf ~/.config/tmux
rm -rf ~/.config/zsh
rm -rf ~/.config/awesome

ln -sf $(pwd)/nvim ~/.config/nvim
ln -sf $(pwd)/tmux ~/.config/tmux
ln -sf $(pwd)/zsh ~/.config/zsh
ln -sf $(pwd)/zsh ~/.config/awesome

