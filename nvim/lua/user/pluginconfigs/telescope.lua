local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

local actions = require "telescope.actions"

telescope.setup {
    pickers = {
        find_files = {
            hidden = true,
            no_ignore = true,
        }
    },
    defaults = {
        file_ignore_patterns = {
            ".venv",
            "node_modules"
        }
    }
}
