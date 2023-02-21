local colorscheme = "onedark"

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
}
