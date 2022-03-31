--------------------------------------
-- Bryley's AwesomeWM Configuration --
--------------------------------------

-- Use LuaRocks if installed
pcall(require, "luarocks.loader")

local gears = require("gears")      -- Utility functions and constants
local awful = require("awful")      -- Everything related to window management

local beautiful = require("beautiful") -- Theme module


-- Notification library TODO
local naughty = require("naughty")
-- local menubar = require("menubar")

require("awful.autofocus")          -- Handles the focusing of clients

require("config.errorhandling")     -- Error handling if config is wrong

-- Theme Set --
local conf_dir = gears.filesystem.get_configuration_dir() -- Path of config
beautiful.init(conf_dir.."theme.lua")

-- local options = require("config.options")

-- Require my widgets
local topbar = require("widgets.topbar") -- The main bar at the top of the screen
local vol_popup = require("widgets.volume_popup")

awful.screen.connect_for_each_screen(function(s)
    -- Each screen has its own tag table.
    awful.tag(
        { "1", "2", "3", "4", "5", "6", "7", "8", "9" },
        s, awful.layout.layouts[1]
    )
    topbar.setup(s)
    vol_popup.setup(s)
end)

require("wallpaper")                -- Wallpaper manager

require("config.bindings").setup(vol_popup.update_volume) -- Mouse and key bindings

require("config.rules")             -- Rules for clients

require("signals")                  -- Setup all signals

-- Autostart --
require("config.autostart")


-- {{{ Menu TODO make better or remove
-- Create a launcher widget and a main menu
-- local myawesomemenu = {
--    { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
--    { "edit config", options.editor_cmd .. " " .. awesome.conffile },
--    { "restart", awesome.restart },
--    { "quit", function() awesome.quit() end },
-- }
-- 
-- local mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
--                                     { "open terminal", options.terminal }
--                                   }
--                         })
-- 
-- local mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
--                                      menu = mymainmenu })
-- 
-- -- Menubar configuration
-- menubar.utils.terminal = options.terminal -- Set the terminal for applications that require it
-- }}}
