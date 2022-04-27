
local status_ok, tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

vim.api.nvim_set_var("lua_tree_tab_open", 1)

-- vim.g.nvim_tree_quit_on_open = 0 -- This is for barbar

tree.setup({
    -- auto_close = true,
    view = {
        side = "left",
        mappings = {
            custom_only = false,
        },
        number = true,
        relativenumber = true,
    },
    actions = {
        open_file = {
            quit_on_open = false,   -- This is for barbar
        },
    },
})

-- TODO Add suport for barbar by offsetting it.
