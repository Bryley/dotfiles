--
-- File contains any user preferences or options as variables
--

local options = {
    terminal = "alacritty",
    editor = os.getenv("EDITOR") or "neovim",
    modkey = "Mod4" -- The windows key
}

options.editor_cmd = options.terminal .. " -e " .. options.editor

return options
