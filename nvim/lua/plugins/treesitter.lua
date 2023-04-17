return {
    "nvim-treesitter/nvim-treesitter",
    version=false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects", -- Adds extra text objects like function and class
        "nvim-treesitter/playground",        -- Shows AST for current code using treesitter
    },
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = "all",
            ignore_install = { "haskell", "jsonc", "smali" },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = true,
            },
            playground = {
                enable = true,
            },
            textobjects = {
                select = {
                    enable = true,
                    -- Automatically jump forward to textobj, similar to targets.vim
                    lookahead = true,

                    keymaps = {
                        -- You can use the capture groups defined in textobjects.scm
                        ["af"] = { query = "@function.outer", desc = "Outer function" },
                        ["if"] = { query = "@function.inner", desc = "Inner function" },
                        ["ac"] = { query = "@class.outer", desc = "Outer class" },
                        ["ic"] = { query = "@class.inner", desc = "Inner class" },
                        ["/"] = { query = "@comment.outer", desc = "Comment" },
                    },
                    -- selection_modes = {
                    -- 	["@parameter.outer"] = "v", -- charwise
                    -- 	["@function.outer"] = "V", -- linewise
                    -- 	["@class.outer"] = "<c-v>", -- blockwise
                    -- },
                    include_surrounding_whitespace = true,
                },
            },
        })
    end,
}
