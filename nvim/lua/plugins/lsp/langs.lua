local lsp = require("lspconfig")
local cmp = require("cmp_nvim_lsp")
local navic = require("nvim-navic")

local capabilities = cmp.default_capabilities()
local on_attach = function(client, bufnr)
	if client.server_capabilities.documentSymbolProvider then
		navic.attach(client, bufnr)
	end
end

-- If you need any more language setups look at:
-- https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
lsp.lua_ls.setup({
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = {
                    "vim",
                    "describe",
                    "it",
                    "before_each",
                    "after_each",
                    "before",
                    "after",
                    "assert",
                    "spy",
                    "mock",
                    "stub",
                    "pending",
                    "teardown",
                    "setup",
                    "lazy_setup",
                    "lazy_teardown",
                }
            }
        }
    },
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
lsp.gopls.setup {
    capabilities = capabilities,
}
lsp.yamlls.setup {
    capabilities = capabilities,
    settings = {
        yaml = {
            schemas = {
                kubernetes = "deploy/*.yaml",
                ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
                ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
                ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
                ["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
                ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
                ["http://json.schemastore.org/ansible-playbook"] = "*play*.{yml,yaml}",
                ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
                ["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
                ["https://json.schemastore.org/gitlab-ci"] = "*gitlab-ci*.{yml,yaml}",
                ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
                ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
                ["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "*flow*.{yml,yaml}",
            },
        }
    }
}
