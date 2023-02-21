local status_ok, neorg = pcall(require, "neorg")
if not status_ok then
	return
end

neorg.setup({
    load = {
        ["core.defaults"] = {}, -- Loads defaults
        ["core.norg.concealer"] = {}, -- Adds icons to files
        ["core.norg.dirman"] = {
            config = {
                workspaces = {
                    work = "~/Documents/notes/work",
                }
            }
        }
    }
})
