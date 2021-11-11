
vim.api.nvim_set_var("lua_tree_tab_open", 1)

vim.g.nvim_tree_quit_on_open = 0 -- This is for barbar

require'nvim-tree'.setup(
	{
		auto_close = true,
	}
)

-- Turn on relative line numbers
require'nvim-tree.view'.View.winopts.relativenumber = true

-- TODO Add suport for barbar by offsetting it.
