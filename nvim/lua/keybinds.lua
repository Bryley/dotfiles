local opts = { noremap = true, silent = false }

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

_G.generate_git_commit_message = function()
	local output = vim.api.nvim_call_function("system", { "git diff --cached" })
	local text = "Write a detailed and consise git commit message given the "
		.. "following git diff output making sure the summary title is less than "
		.. "or equal to 75 characters: "
		.. output
	require("neoai").inject(text)
end

keymap("n", "<leader>aa", "<cmd>NeoAI<cr>", opts)
keymap("n", "<leader>ag", "<cmd>lua _G.generate_git_commit_message()<cr>", opts)
keymap("v", "<leader>ar", "<cmd>NeoAIInjectContext Fix up my writing and grammer in this text to be more clear and consise<cr>", opts)
