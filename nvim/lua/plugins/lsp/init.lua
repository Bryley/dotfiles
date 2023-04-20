return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		keys = {
			{ "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", desc = "goto definition" },
			{ "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", desc = "goto declaration" },
			{ "gr", "<cmd>lua vim.lsp.buf.references()<CR>", desc = "goto references" },
			{ "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", desc = "goto implementations" },
			{ "K", "<cmd>lua vim.lsp.buf.hover()<CR>", desc = "show docs" },
			{ "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", desc = "Show signature" },
			{ "<C-p>", "<cmd>lua vim.diagnostic.goto_prev()<CR>", desc = "goto prev diagnostic" },
			{ "<C-n>", "<cmd>lua vim.diagnostic.goto_next()<CR>", desc = "goto next diagnostic" },
		},
		dependencies = {
			"folke/neodev.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"jose-elias-alvarez/null-ls.nvim",
		},
		config = function()
			require("plugins.lsp.langs")
			require("plugins.lsp.nullls")
			require("plugins.lsp.settings")
		end,
	},
	{
		"hrsh7th/cmp-nvim-lsp",
		dependencies = {
			"rafamadriz/friendly-snippets",
			"L3MON4D3/LuaSnip",
		},
	},
	{
		-- Adds signatures for neovim config lua code
		"folke/neodev.nvim",
		opts = {
			experimental = { pathStrict = true },
		},
	},
	{
		-- A plugin that allows external formatters and linters to work with LSP
		"jose-elias-alvarez/null-ls.nvim",
		keys = {
			"<leader>lf",
			"<leader>lr",
			"<leader>la",
		},
	},
	{
		"L3MON4D3/LuaSnip",
		event = "InsertEnter",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		config = function()
			require("luasnip.loaders.from_lua").lazy_load()
			require("luasnip.loaders.from_vscode").lazy_load()
			require("luasnip.loaders.from_snipmate").lazy_load()
		end,
	},
	{
		"rafamadriz/friendly-snippets",
	},
	{
		-- The base auto completion plugin
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp", -- Enables LSP auto completion
			"hrsh7th/cmp-buffer", -- Enables buffer completions
			"hrsh7th/cmp-path", -- Enables path completions
			"hrsh7th/cmp-cmdline", -- Enables cmdline completions
			"hrsh7th/cmp-nvim-lua", -- Enables nvim lua autocompletions
			{
				-- Enables snippet completions
				"saadparwaiz1/cmp_luasnip",
				dependencies = {
					"L3MON4D3/LuaSnip",
				},
			},
			"onsails/lspkind-nvim", -- Adds better looking menu for cmp
		},
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = {
					["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
					["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
					["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
					["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
					["<C-e>"] = cmp.mapping({
						i = cmp.mapping.abort(),
						c = cmp.mapping.close(),
					}),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<C-n>"] = function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						else
							fallback()
						end
					end,
					["<C-p>"] = function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						else
							fallback()
						end
					end,
					-- Remember that Ctrl-N is next and Ctrl-P is previous select
				},
				sources = cmp.config.sources({
					{ name = "nvim_lua" },
					{ name = "nvim_lsp" },
					{ name = "path" },
					{ name = "luasnip" },
					{ name = "buffer", keyword_length = 3 },
				}),
                experimental = {
                    ghost_text = true,
                },
			})
		end,
	},
}
