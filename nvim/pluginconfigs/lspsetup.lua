local lsp_installer = require("nvim-lsp-installer")
local coq = require "coq"

local map = vim.api.nvim_set_keymap

lsp_installer.on_server_ready(function(server)
    local opts = {coq.lsp_ensure_capabilities()}

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function is exactly the same as lspconfig's setup function (:help lspconfig-quickstart)
    server:setup(opts)
    vim.cmd [[ do User LspAttachBuffers ]]
end)


-- LSP saga --

-- Show line diagnostics with <Space>cc
map('n', '<leader>cc',
'<cmd>lua require\'lspsaga.diagnostic\'.show_cursor_diagnostics()<CR>',
{noremap = true, silent = true})
