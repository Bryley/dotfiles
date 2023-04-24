local opts = { noremap = true, silent = false }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

keymap("n", "<F3>", "<cmd>noh<cr>", opts) -- Control backspace deletes a word

keymap("i", "<C-H>", "<C-W>", opts) -- Control backspace deletes a word

keymap("t", "<Esc>", "<C-\\><C-n>", opts) -- Esc goes to normal mode in term

-- Stay in indent mode when in visual mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Resize Windows with arrowkeys
keymap("n", "<Left>", "<cmd>vertical resize +1<cr>", opts)
keymap("n", "<Right>", "<cmd>vertical resize -1<cr>", opts)
keymap("n", "<Up>", "<cmd>resize +1<cr>", opts)
keymap("n", "<Down>", "<cmd>resize -1<cr>", opts)

keymap("n", "<S-Left>", "<cmd>vertical resize +5<cr>", opts)
keymap("n", "<S-Right>", "<cmd>vertical resize -5<cr>", opts)
keymap("n", "<S-Up>", "<cmd>resize +5<cr>", opts)
keymap("n", "<S-Down>", "<cmd>resize -5<cr>", opts)
