
set runtimepath+=~/.config/nvim,~/.config/nvim/after
set packpath+=~/.config/nvim
source ~/.config/nvim/vimrc

" Plugin config files
source  ~/.config/nvim/pluginconfigs/coq.vim
luafile ~/.config/nvim/pluginconfigs/lspsetup.lua

