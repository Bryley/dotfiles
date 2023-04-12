return {
	{
		"Shatur/neovim-session-manager",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		-- cmd = "SessionManager",
		keys = {
			{ "<F1>", "<cmd>SessionManager load_last_session<cr>", desc = "Load last session" },
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
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "find files" },
			{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "grep" },
			{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "buffers" },
			{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "help tags" },
			{ "<leader>fc", "<cmd>Telescope colorscheme<cr>", desc = "colorscheme" },
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
	-- {
	-- 	-- 'Bryley/neoai',
	-- 	dir = "~/Documents/personal/neoai",
	-- 	dev = true,
	-- 	cmd = "NeoAI",
	-- 	lazy = false,
	-- },
	{
		dir = "~/Documents/personal/neovim-plugins/neoai",
		dev = true,
		cmd = { "NeoAI" },
		lazy = false,
		config = function ()
            require("neoai").setup()
		end,
	},
}
