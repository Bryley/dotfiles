return {
	"nvim-neorg/neorg",
	ft = "norg",
	build = ":Neorg sync-parsers",
	cmd = "Neorg",
	opts = {
		load = {
			["core.defaults"] = {}, -- Loads default behaviour
			["core.norg.concealer"] = {}, -- Adds pretty icons to your documents
			["core.export"] = {
				config = {
					export_dir = "~/Documents/neorg-outputs",
				},
			}, -- Adds pretty icons to your documents
			["core.norg.dirman"] = { -- Manages Neorg workspaces
				config = {
					workspaces = {
						notes = "~/Documents/notes",
					},
				},
			},
		},
	},
	dependencies = { { "nvim-lua/plenary.nvim" } },
}
