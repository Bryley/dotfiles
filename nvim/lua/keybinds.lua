local opts = { noremap = true, silent = true }
local verbose = { noremap = true, silent = false }


-- Shorten function name
local keymap = vim.api.nvim_set_keymap

keymap("i", "<C-H>", "<C-W>", opts) -- Control backspace deletes a word

keymap("t", "<Esc>", "<C-\\><C-n>", opts) -- Esc goes to normal mode in term

-- Stay in indent mode when in visual mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

