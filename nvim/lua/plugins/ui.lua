return {
	{
		-- Better UI for neovim lua functions like vim.ui.input()
		"stevearc/dressing.nvim",
		config = true,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		version = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			{
				"s1n7ax/nvim-window-picker",
				opts = {
					selection_chars = "ABCDEFGHIJKLMNOP",
					filter_rules = {
						-- filter using buffer options
						bo = {
							-- if the file type is one of following, the window will be ignored
							filetype = { "neo-tree", "neo-tree-popup", "notify" },
							-- if the buffer type is one of following, the window will be ignored
							buftype = { "terminal", "quickfix" },
						},
					},
				},
			},
		},
		keys = {
			{ "<F2>", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
		},
		opts = {
			close_if_last_window = true,
			window = {
				mappings = {
					["<space>"] = function() end,
					["<cr>"] = "open_with_window_picker",
					["o"] = "open_with_window_picker",
					["S"] = "split_with_window_picker",
					["s"] = "vsplit_with_window_picker",
				},
			},
		},
	},
	{
		"akinsho/bufferline.nvim",
		lazy = false,
		version = "v3.*",
		dependencies = {
			"moll/vim-bbye", -- Adds Bdelete to delete current tab
			"nvim-tree/nvim-web-devicons",
		},
		keys = {
			{ "<A-h>", "<cmd>bprev<cr>", mode = "n", desc = "Previous tab" },
			{ "<A-l>", "<cmd>bnext<cr>", mode = "n", desc = "Next tab" },
			{ "<A-c>", "<cmd>Bdelete!<cr>", mode = "n", desc = "Delete tab" },
			{ "<A-h>", "<cmd>bprev<cr>", mode = "i", desc = "Previous tab" },
			{ "<A-l>", "<cmd>bnext<cr>", mode = "i", desc = "Next tab" },
			{ "<A-c>", "<cmd>Bdelete!<cr>", mode = "i", desc = "Delete tab" },
		},
		opts = {
			options = {
				offsets = {
					{
						filetype = "neo-tree",
						text = "Neotree",
						text_align = "center",
						separator = true,
					},
				},
			},
		},
	},
	{
		-- Breadcrumbs
		"SmiteshP/nvim-navic",
		dependencies = {
			"neovim/nvim-lspconfig",
		},
		event = "User FileOpened",
		lazy = false,
		config = function()
			require("nvim-navic").setup({
				highlight = true,
				click = true,
			})
		end,
	},
	{
		-- Breadcrumbs GUI
		"SmiteshP/nvim-navbuddy",
        lazy = false,
		dependencies = {
			"SmiteshP/nvim-navic",
			"MunifTanjim/nui.nvim",
		},
		opts = { lsp = { auto_attach = true } },
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"SmiteshP/nvim-navic",
		},
		config = function()
			local navic = require("nvim-navic")
			require("lualine").setup({
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff", "diagnostics" },
					lualine_c = { { "filename", path = 1 } },
					lualine_x = { "encoding", "fileformat", "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { { "filename", path = 1 } },
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
				winbar = {
					lualine_c = {
						{
							function()
								return navic.get_location()
							end,
							cond = function()
								return navic.is_available()
							end,
						},
					},
				},
			})
		end,
	},
	{
		-- Adds indent guides to the code
		"lukas-reineke/indent-blankline.nvim",
	},
	{
		"rcarriga/nvim-notify",
		lazy = false,
		config = function()
			vim.notify = require("notify")
		end,
	},
}
