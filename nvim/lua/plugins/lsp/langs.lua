local lsp = require("lspconfig")
local cmp = require("cmp_nvim_lsp")
local navic = require("nvim-navic")

local capabilities = cmp.default_capabilities()
local on_attach = function(client, bufnr)
	if client.server_capabilities.documentSymbolProvider then
		navic.attach(client, bufnr)
	end
end

-- TODO if you need any more language setups look at:
-- https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
lsp.lua_ls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = { Lua = { diagnostics = { globals = { "vim" } } } },
})
lsp.tsserver.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
lsp.pyright.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "workspace",
				useLibraryCodeForTypes = true,
			},
		},
	},
})
lsp.svelte.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
lsp.rust_analyzer.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
lsp.dockerls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
lsp.jsonls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		json = {
			schemas = require("schemastore").json.schemas(),
			validate = { enable = true },
		},
	},
})
lsp.yamlls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		yaml = {
			schemas = require("schemastore").yaml.schemas(),
		},
	},
})
lsp.ltex.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
lsp.gopls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
lsp.volar.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
