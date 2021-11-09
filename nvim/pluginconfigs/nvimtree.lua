
vim.api.nvim_set_var("lua_tree_tab_open", 1)

require'nvim-tree'.setup(
	{
		open_on_tab = true,
		auto_close = true,
	}
)

-- Turn on relative line numbers
require'nvim-tree.view'.View.winopts.relativenumber = true
