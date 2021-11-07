-- Setup nvim-cmp.
local cmp = require'cmp'
local lspkind = require('lspkind')
lspkind.init()

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	mapping = {
		['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
		['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
		['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
		['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		['<C-e>'] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
		-- Remember that Ctrl-N is next and Ctrl-P is previous select
	},
	-- The order of priority that autocompletion will work
	sources = cmp.config.sources({
		{ name = 'nvim_lua' },
		{ name = 'nvim_lsp' },
		{ name = 'path' },
		{ name = 'buffer', keyword_length = 5},
		{ name = 'luasnip' },
	}),
	formatting = {
		format = lspkind.cmp_format({
			with_text = true,
			menu = {
				buffer = "[buffer]",
				nvim_lsp = "[LSP]",
				nvim_lua = "[NVIM]",
				path = "[path]",
				luasnip = "[snip]",
			}
		})
	},
	experimental = {
		-- Enable the new menu
		native_menu = false,
		ghost_test = true,
	}
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
	sources = {
	  { name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	sources = cmp.config.sources({
	  { name = 'path' }
	}, {
	  { name = 'cmdline' }
	})
})
