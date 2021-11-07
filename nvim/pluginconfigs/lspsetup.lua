local lsp_installer = require("nvim-lsp-installer")
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local map = vim.api.nvim_set_keymap

lsp_installer.on_server_ready(function(server)
    local opts = {capabilities = capabilities}

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end
    if server.name == "sumneko_lua" then
		-- Recognise 'vim' as global variable
		opts.settings = {
			Lua = {
				diagnostics = {
					globals = { 'vim' }
				}
			}
		}
    end

    -- This setup() function is exactly the same as lspconfig's setup function (:help lspconfig-quickstart)
    server:setup(opts)
    vim.cmd [[ do User LspAttachBuffers ]]
end)

map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap=true, silent=true })
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', { noremap=true, silent=true })
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { noremap=true, silent=true })
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', { noremap=true, silent=true })
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap=true, silent=true })
map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { noremap=true, silent=true })
map('n', '<C-n>', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', { noremap=true, silent=true })
map('n', '<C-p>', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', { noremap=true, silent=true })


-- LSP saga --

-- Show line diagnostics with <Space>cc
--[[
map('n', '<leader>cc',
'<cmd>lua require\'lspsaga.diagnostic\'.show_cursor_diagnostics()<CR>',
{noremap = true, silent = true})
--]]
