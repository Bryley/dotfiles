return {
	{
		"Shatur/neovim-session-manager",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		-- cmd = "SessionManager",
		keys = {
			{ "<F1>", "<cmd>SessionManager load_current_dir_session<cr>", desc = "Load last session" },
		},
		config = function()
			require("session_manager").setup({
				autoload_mode = require("session_manager.config").AutoloadMode.Disabled,
			})
		end,
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
			{ "<F5>", "<cmd>TermExec cmd='./.venv/bin/python <C-r>%'<CR>", desc = "Run Python" },
		},
		config = true,
	},
	{
		"dhruvasagar/vim-table-mode",
	},
	{
		-- Fuzzy finder plugin
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		keys = {
			"<leader>ff",
			"<leader>fg",
			"<leader>fb",
			"<leader>fh",
			"<leader>fc",
			"<leader>fr",
			"<leader>fk",
			"<leader>fC",
		},
        lazy = false,
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
	{
		"jackMort/ChatGPT.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
		cmd = {
			"ChatGPT",
			"ChatGPTActAs",
			"ChatGPTEditWithInstructions",
		},
		config = function()
			require("chatgpt").setup({
				-- optional configuration
				openai_edit_params = {
					model = "code-davinci-edit-001",
					-- model = "code-davinci-edit-002",
					temperature = 0,
					top_p = 1,
					n = 1,
				},
			})
		end,
	},
	{
		-- Autocompletes brackets TODO move into a separate snippets.lua with LuaSnip and others
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"hrsh7th/nvim-cmp",
		},
	},
	{
		-- Adds git signs to the edge of the document
		"lewis6991/gitsigns.nvim",
		config = true,
	},
	{
		-- Breadcrumbs, TODO not working
		"SmiteshP/nvim-navic",
		dependencies = {
			"neovim/nvim-lspconfig",
		},
		event = "User FileOpened",
		config = true,
	},
	{
		"b0o/schemastore.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
		},
	},
	{
		-- Illuminates same word under cursor
		"RRethy/vim-illuminate",
		config = function()
			require("illuminate").configure()
		end,
	},
	{
		dir = "~/Documents/personal/neovim-plugins/neoai",
		dev = true,
		cmd = { "NeoAI" },
		lazy = false,
		config = function()
			require("neoai").setup()
		end,
    },
}
