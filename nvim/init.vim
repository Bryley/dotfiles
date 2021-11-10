
set runtimepath+=~/.config/nvim,~/.config/nvim/after
set packpath+=~/.config/nvim
source ~/.config/nvim/vimrc

" Plugin config files
"source  ~/.config/nvim/pluginconfigs/coq.vim
luafile ~/.config/nvim/pluginconfigs/treesitter.lua
luafile ~/.config/nvim/pluginconfigs/nvim-cmp.lua
luafile ~/.config/nvim/pluginconfigs/lspsetup.lua
luafile ~/.config/nvim/pluginconfigs/lualine.lua
luafile ~/.config/nvim/pluginconfigs/nvimtree.lua
source ~/.config/nvim/pluginconfigs/doge-setup.vim

