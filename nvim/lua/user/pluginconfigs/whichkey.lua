
local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end


local mappings = {
    f = {
        name = "fuzzy find",
        f = {'<cmd>Telescope find_files<cr>', 'File search'},
        g = {'<cmd>Telescope live_grep<cr>', 'Grep search'},
        b = {'<cmd>Telescope buffers<cr>', 'Buffer search'},
        h = {'<cmd>Telescope help_tags<cr>', 'Help search'}
    },
    d = {
        name = "debug",
        d = {'<cmd>lua require("dapui").toggle()<CR>', 'Debug view'},
        space = {'<cmd>lua require("dap").continue()<CR>', 'Continue'},
        j = {'<cmd>lua require("dap").step_over()<CR>', 'Step Over'},
        i = {'<cmd>lua require("dap").step_into()<CR>', 'Step Into'},
        o = {'<cmd>lua require("dap").step_out()<CR>', 'Step Out'},
        b = {'<cmd>lua require("dap").toggle_breakpoint()<CR>', 'Breakpoint toggle'},
        c = {'<cmd>lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', 'Conditional Breakpoint'},
    }
}

which_key.setup()
which_key.register(mappings, { prefix = "<leader>" })
