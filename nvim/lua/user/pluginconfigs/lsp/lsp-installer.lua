
local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("user.pluginconfigs.lsp.handlers").on_attach,
		capabilities = require("user.pluginconfigs.lsp.handlers").capabilities,
		--capabilities = capabilities
	}

	 if server.name == "sumneko_lua" then
	 	local sumneko_opts = require("user.pluginconfigs.lsp.settings.sumneko_lua")
	 	opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	 end

	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)

-- Mappings

--[[
map('n', 'gd'	, '<cmd>lua vim.lsp.buf.definition()<CR>',		{ noremap=true, silent=true })
map('n', 'gD'	, '<cmd>lua vim.lsp.buf.declaration()<CR>',		{ noremap=true, silent=true })
map('n', 'gr'	, '<cmd>lua vim.lsp.buf.references()<CR>',		{ noremap=true, silent=true })
map('n', 'gi'	, '<cmd>lua vim.lsp.buf.implementation()<CR>',	{ noremap=true, silent=true })
map('n', 'K'	, '<cmd>lua vim.lsp.buf.hover()<CR>',			{ noremap=true, silent=true })
map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>',	{ noremap=true, silent=true })
map('n', '<C-p>', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>',{ noremap=true, silent=true })
map('n', '<C-n>', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>',{ noremap=true, silent=true })
--]]
