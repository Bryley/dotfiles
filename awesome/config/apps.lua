
local apps = {
    terminal = "alacritty",
    editor = os.getenv("EDITOR") or "neovim",
    editor_cmd = "alacritty" .. " -e " .. "neovim"
}

return apps
