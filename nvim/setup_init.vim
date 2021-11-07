" This is a setup script that will only load the vimrc correctly.
" It is used so that PlugInstall can be executed via a script without failing
" due to errors. Then after that the actual init.vim will be called.
set runtimepath+=~/.config/nvim,~/.config/nvim/after
set packpath+=~/.config/nvim
source ~/.config/nvim/vimrc
