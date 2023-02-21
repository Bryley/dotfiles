return {
	{
		"Shatur/neovim-session-manager",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{ "<F1>", "<cmd>SessionManager load_last_session<cr>", desc = "Load last session" },
		},
	},
	{
		-- Ability to change surrounding characters on text objects.
		"kylechui/nvim-surround",
		config = true,
	},
	{
		-- Smooth scrolling for neovim
		"karb94/neoscroll.nvim",
		config = true,
	},
	{
		-- Better commenting with gcc
		"numToStr/Comment.nvim",
		config = true,
	},
	{
		-- Better terminals inside nvim
		"akinsho/toggleterm.nvim",
		keys = {
			{ "<F4>", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
		},
		config = true,
	},
    {
        'dhruvasagar/vim-table-mode'
    },
	{
		-- Fuzzy finder plugin
		"nvim-telescope/telescope.nvim",
        keys = {
            {"<leader>ff", "<cmd>Telescope find_files<cr>", desc='find files'},
            {"<leader>fg", "<cmd>Telescope live_grep<cr>", desc='grep'},
            {"<leader>fb", "<cmd>Telescope buffers<cr>", desc='buffers'},
            {"<leader>fh", "<cmd>Telescope help_tags<cr>", desc='help tags'},
            {"<leader>fc", "<cmd>Telescope colorscheme<cr>", desc='colorscheme'},
        },
		opts = {
			pickers = {
				find_files = {
					hidden = true,
					no_ignore = true,
				},
			},
			defaults = {
				file_ignore_patterns = {
					".venv",
					"node_modules",
				},
			},
		},
	},
}
