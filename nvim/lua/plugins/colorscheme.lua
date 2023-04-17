-- local colorscheme = "onedark"
local colorscheme = "onedarker"

local function config()
	vim.cmd([[colorscheme ]] .. colorscheme)
end

return {
	{
		"projekt0n/github-nvim-theme",
		version = "v0.0.7",
		-- lazy = false,
		-- priority = 1000,
		cond = function()
			return "github_dark" == colorscheme
		end,
		config = config,
	},
	{
		"navarasu/onedark.nvim",
		cond = function()
			return "onedark" == colorscheme
		end,
		config = config,
	},
    {
        "lunarvim/onedarker.nvim",
		cond = function()
			return "onedarker" == colorscheme
		end,
		config = config,
    },
}
