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
lsp.volar.setup {
    capabilities = capabilities,
}
