
local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("user.pluginconfigs.lsp.lsp-installer")
require("user.pluginconfigs.lsp.handlers").setup()
