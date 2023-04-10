local lsp = require("lspconfig")
local cmp = require("cmp_nvim_lsp")

local capabilities = cmp.default_capabilities()

-- TODO if you need any more language setups look at:
-- https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
lsp.lua_ls.setup({
    capabilities = capabilities,
    settings = { Lua = { diagnostics = { globals = { "vim" } } } },
})
lsp.tsserver.setup({
    capabilities = capabilities,
})
lsp.pyright.setup({
    capabilities = capabilities,
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
})
lsp.rust_analyzer.setup({
    capabilities = capabilities,
})
lsp.dockerls.setup({
    capabilities = capabilities,
})
lsp.ltex.setup({
    capabilities = capabilities,
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
