--[[
File contains keybinding and keybinding settings for neovim.
--]]

local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- Normal --
keymap("n", "<F2>", ":NvimTreeToggle<CR>", opts)
keymap("n", "<F3>", ":noh<CR>", opts)
keymap("n", "<F5>", ":source $MYVIMRC<CR>", opts)

-- Telescope
keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', opts)
keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', opts)
keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', opts)
keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', opts)

-- Buffers
keymap('n', '<A-,>', '<cmd>bprev<CR>', opts)
keymap('n', '<A-.>', '<cmd>bnext<CR>', opts)
keymap('n', '<A-c>', '<cmd>Bdelete<CR>', opts)



-- Insert --
keymap("i", "<C-H>", "<C-W>", opts)


-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
