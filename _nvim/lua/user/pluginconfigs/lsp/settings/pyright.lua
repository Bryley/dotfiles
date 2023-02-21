return {
    -- TODO fix this up for pyright
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim", "awesome", "client", "root" },
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true,
                },
            },
        },
    },
}

