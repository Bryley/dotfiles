--[[
File contains keybinding and keybinding settings for neovim.
--]]

local opts = { noremap = true, silent = true }
local verbose = { noremap = true, silent = false }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap
local command = vim.api.nvim_command

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Commands
command("command JSONFormat :%!jq .")

-- Normal --
keymap("n", "<F2>", ":NvimTreeToggle<CR>", opts)
keymap("n", "<F3>", ":noh<CR>", opts)
keymap("n", "<F4>", "<cmd>ToggleTerm<CR>", opts)
-- Runs python code for the current file using venv in ./.venv/ folder
keymap("n", "<F5>", "<cmd>TermExec cmd='./.venv/bin/python <C-r>%'<CR>", verbose)
keymap("n", "<C-Q>", "<Nop>", opts) -- Stop from quitting

keymap("n", "<C-h>", "<cmd>SidewaysLeft<CR>", opts) -- sideways.vim plugin
keymap("n", "<C-l>", "<cmd>SidewaysRight<CR>", opts) -- sideways.vim plugin

-- keymap("n", "<leader>c", "<cmd>lua require'docstr'.docstr()<CR>", verbose)
keymap("n", "<leader>c", "<cmd>lua require('neogen').generate()<CR>", verbose)

-- LSP
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
keymap("n", "<C-p>", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
keymap("n", "<C-n>", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)

-- Terminal --
keymap("t", "<Esc>", "<C-\\><C-n>", opts) -- Esc goes to normal mode in term

-- Resize with arrows
-- keymap("n", "<C-Up>", ":resize -2<CR>", opts)
-- keymap("n", "<C-Down>", ":resize +2<CR>", opts)
-- keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
-- keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)
keymap("n", "<Up>", ":resize -2<CR>", opts)
keymap("n", "<Down>", ":resize +2<CR>", opts)
keymap("n", "<Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<Right>", ":vertical resize -2<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)

-- Buffers
keymap("n", "<A-h>", "<cmd>bprev<CR>", opts)
keymap("n", "<A-l>", "<cmd>bnext<CR>", opts)
keymap("n", "<A-c>", "<cmd>Bdelete!<CR>", opts)
keymap("i", "<A-h>", "<cmd>bprev<CR>", opts)
keymap("i", "<A-l>", "<cmd>bnext<CR>", opts)
keymap("i", "<A-c>", "<cmd>Bdelete!<CR>", opts)

-- nvim-dap debugging
keymap("n", "<leader>dd", '<cmd>lua require("dapui").toggle()<CR>', opts)
keymap("n", "<leader>d<space>", '<cmd>lua require("dap").continue()<CR>', opts)
keymap("n", "<leader>dt", '<cmd>lua require("dap").terminate()<CR>', opts)
keymap("n", "<leader>dj", '<cmd>lua require("dap").step_over()<CR>', opts)
keymap("n", "<leader>di", '<cmd>lua require("dap").step_into()<CR>', opts)
keymap("n", "<leader>do", '<cmd>lua require("dap").step_out()<CR>', opts)
keymap("n", "<leader>db", '<cmd>lua require("dap").toggle_breakpoint()<CR>', opts)
keymap("n", "<leader>dc", '<cmd>lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', opts)

-- icon-picker
keymap("n", "<leader>i", "<cmd>IconPickerNormal nerd_font<CR>", opts)
-- This fails due to <C-I> acting like Tab in terminal
-- keymap('i', '<C-i>', '<cmd>IconPickerInsert<CR>', opts)

-- Text-Case
keymap("n", "gs", "<cmd>lua require('textcase').current_word('to_snake_case')<CR>", opts)
keymap("n", "gS", "<cmd>lua require('textcase').current_word('to_camel_case')<CR>", opts)

-- Insert --
keymap("i", "<C-H>", "<C-W>", opts)

-- Command Mode --
keymap("c", "<C-BS>", "<C-W>", opts) -- TODO doesn't work need to fix

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
