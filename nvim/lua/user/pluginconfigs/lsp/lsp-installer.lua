local status_ok1, lspconfig = pcall(require, "lspconfig")
if not status_ok1 then
    return
end

local status_ok2, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok2 then
    return
end

local status_ok3, null_ls = pcall(require, "null-ls")
if not status_ok3 then
    return
end

local capabilities = cmp_nvim_lsp.default_capabilities()

-- TODO if you need any more language setups look at:
-- https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
lspconfig.sumneko_lua.setup {
    capabilities = capabilities,
    settings = { Lua = { diagnostics = { globals = { 'vim' } } } }
}
lspconfig.tsserver.setup {
    capabilities = capabilities
}
lspconfig.pyright.setup {
    capabilities = capabilities
}
lspconfig.svelte.setup {
    capabilities = capabilities
}
lspconfig.rust_analyzer.setup {
    capabilities = capabilities
}
lspconfig.dockerls.setup {
    capabilities = capabilities
}
lspconfig.ltex.setup {
    capabilities = capabilities
}

null_ls.setup {
    sources = {
        -- TODO put these in the install scripts
        require("null-ls").builtins.formatting.black,
        require("null-ls").builtins.formatting.stylua,
        require("null-ls").builtins.formatting.prettier.with({
            extra_args = { "--tab-width", "4" }
        }),
        require("null-ls").builtins.formatting.sqlfluff.with({
            extra_args = { "--dialect", "mysql" }, -- change to your dialect
        }),
    },
}

require("user.pluginconfigs.lsp.lsp-settings")
-- local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
-- if not status_ok then
-- 	return
-- end
--
-- -- Register a handler that will be called for all installed servers.
-- -- Alternatively, you may also register handlers on specific server instances instead (see example below).
-- lsp_installer.on_server_ready(function(server)
-- 	local opts = {
-- 		on_attach = require("user.pluginconfigs.lsp.handlers").on_attach,
-- 		capabilities = require("user.pluginconfigs.lsp.handlers").capabilities,
-- 		--capabilities = capabilities
-- 	}
--
-- 	 if server.name == "sumneko_lua" then
-- 	 	local sumneko_opts = require("user.pluginconfigs.lsp.settings.sumneko_lua")
-- 	 	opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
-- 	 end
-- 	 -- if server.name == "pyright" then
-- 	 -- 	local pyright_opts = require("user.pluginconfigs.lsp.settings.pyright")
-- 	 -- 	opts = vim.tbl_deep_extend("force", pyright_opts, opts)
-- 	 -- end
--
-- 	-- This setup() function is exactly the same as lspconfig's setup function.
-- 	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- 	server:setup(opts)
-- end)
