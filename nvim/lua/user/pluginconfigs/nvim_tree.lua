
vim.api.nvim_set_var("lua_tree_tab_open", 1)

vim.g.nvim_tree_quit_on_open = 0 -- This is for barbar

require'nvim-tree'.setup({
    auto_close = true,
    view = {
        side = "left",
        auto_resize = true,
        mappings = {
            custom_only = false,
        },
        number = true,
        relativenumber = true,
    },
})

-- TODO Add suport for barbar by offsetting it.
