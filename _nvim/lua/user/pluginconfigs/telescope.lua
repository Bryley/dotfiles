local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local status_ok2, trouble = pcall(require, "trouble.providers.telescope")
if not status_ok2 then
    return
end

local actions = require("telescope.actions")

telescope.setup({
	pickers = {
		find_files = {
			hidden = true,
			no_ignore = true,
		},
	},
	defaults = {
		file_ignore_patterns = {
			".venv",
			"node_modules",
		},
		mappings = {
			i = { ["<c-t>"] = trouble.open_with_trouble },
			n = { ["<c-t>"] = trouble.open_with_trouble },
		},
	},
})
