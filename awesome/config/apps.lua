
local apps = {
    terminal = "alacritty",
    editor = os.getenv("EDITOR") or "neovim",
}

apps.editor_cmd = apps.terminal .. " -e " .. apps.editor

return apps
