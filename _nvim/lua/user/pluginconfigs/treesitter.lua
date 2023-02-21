local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
	ignore_install = { "" }, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "" }, -- list of language that will be disabled
		additional_vim_regex_highlighting = true,
	},
	indent = {
		enable = false,
		disable = { "yaml" },
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
	rainbow = {
		enable = true,
		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		-- colors = {}, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
	},
})
