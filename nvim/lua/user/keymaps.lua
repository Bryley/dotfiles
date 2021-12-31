--[[
File contains keybinding and keybinding settings for neovim.
--]]

local opts = { noremap = true, silent = true }
local verbose = { noremap = true, silent = false }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- Normal --
keymap("n", "<F2>", ":NvimTreeToggle<CR>", opts)
keymap("n", "<F3>", ":noh<CR>", opts)
keymap("n", "<F5>", ":source $MYVIMRC<CR>", verbose)
keymap("n", "<C-Q>", "<Nop>", opts)                 -- Stop from quitting

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- Telescope
keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', opts)
keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', opts)
keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', opts)
keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', opts)

-- Buffers
keymap('n', '<A-,>', '<cmd>bprev<CR>', opts)
keymap('n', '<A-.>', '<cmd>bnext<CR>', opts)
keymap('n', '<A-c>', '<cmd>Bdelete!<CR>', opts)

-- nvim-dap debugging
keymap('n', '<leader>dd', '<cmd>lua require("dapui").toggle()<CR>', opts)
keymap('n', '<leader>d<space>', '<cmd>lua require("dap").continue()<CR>', opts)
keymap('n', '<leader>dj', '<cmd>lua require("dap").step_over()<CR>', opts)
keymap('n', '<leader>di', '<cmd>lua require("dap").step_into()<CR>', opts)
keymap('n', '<leader>do', '<cmd>lua require("dap").step_out()<CR>', opts)
keymap('n', '<leader>db', '<cmd>lua require("dap").toggle_breakpoint()<CR>', opts)
keymap('n', '<leader>dc', '<cmd>lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', opts)


-- Insert --
keymap("i", "<C-H>", "<C-W>", opts)

-- Command Mode --
keymap("c", "<C-BS>", "<C-W>", opts)


-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
