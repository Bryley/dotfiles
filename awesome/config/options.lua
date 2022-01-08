--
-- File contains any user preferences or options as variables
--

local awful = require("awful")

local options = {
    terminal = "alacritty",
    browser = "brave",
    editor = os.getenv("EDITOR") or "neovim",
    search = "rofi -show",
    modkey = "Mod4" -- The windows key
}

options.editor_cmd = options.terminal .. " -e " .. options.editor

-- Table of layouts
awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.floating,
    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.fair,
    -- awful.layout.suit.tile.left,
    -- awful.layout.suit.tile.bottom,
    -- awful.layout.suit.tile.top,
    -- awful.layout.suit.fair.horizontal,
    -- awful.layout.suit.max,
    -- awful.layout.suit.max.fullscreen,
    -- awful.layout.suit.magnifier,
    -- awful.layout.suit.corner.nw,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
}

return options
