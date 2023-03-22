local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

keymap("n", "<F3>", "<cmd>noh<cr>", opts) -- Control backspace deletes a word

keymap("i", "<C-H>", "<C-W>", opts) -- Control backspace deletes a word

keymap("t", "<Esc>", "<C-\\><C-n>", opts) -- Esc goes to normal mode in term

-- Stay in indent mode when in visual mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("v", "<leader>s", "yPgv<cmd>'<,'>AI fix up my writing and grammer to be more clear<cr>", opts)
keymap("v", "<leader>c", "<cmd>'<,'>NeoAI<cr>", { noremap = true, silent = false })
