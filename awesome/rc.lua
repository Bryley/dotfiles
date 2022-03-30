--------------------------------------
-- Bryley's AwesomeWM Configuration --
--------------------------------------

-- Use LuaRocks if installed
pcall(require, "luarocks.loader")

local gears = require("gears")      -- Utility functions and constants
local awful = require("awful")      -- Everything related to window management

local wibox = require("wibox")      -- Widget Box, widgets/layout library
local beautiful = require("beautiful") -- Theme module


-- Notification library TODO
local naughty = require("naughty")
-- local menubar = require("menubar")

require("awful.autofocus")          -- Handles the focusing of clients
local hotkeys_popup = require("awful.hotkeys_popup") -- Shows help dialog TODO move to keys
require("awful.hotkeys_popup.keys") -- Enables extra shortcuts in help dialog

require("config.errorhandling")

-- Theme Set --
local conf_dir = gears.filesystem.get_configuration_dir() -- Path of config
beautiful.init(conf_dir.."theme.lua")

local options = require("config.options")

-- Require my widgets
require("widgets.topbar")           -- The main bar at the top of the screen

require("wallpaper")                -- Wallpaper manager

require("config.bindings")          -- Mouse and key bindings

require("config.rules")             -- Rules for clients

-- {{{ Signals TODO move into separate file/folder
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)

    -- Add a border radius around clients
    c.shape = function(cr, w, h)
        -- TODO this have poor antialiasing and has a weird shadow try to fix (look into the awesome-nice project)
        gears.shape.rounded_rect(cr, w, h, 10)
    end

    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- buttons for the titlebar
    local buttons = gears.table.join(
        awful.button({ }, 1, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.move(c)
        end),
        awful.button({ }, 3, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.resize(c)
        end)
    )

    awful.titlebar(c) : setup {
        { -- Left
            awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout  = wibox.layout.fixed.horizontal
        },
        { -- Middle
            { -- Title
                align  = "center",
                widget = awful.titlebar.widget.titlewidget(c)
            },
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal
        },
        { -- Right
            awful.titlebar.widget.floatingbutton (c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.stickybutton   (c),
            awful.titlebar.widget.ontopbutton    (c),
            awful.titlebar.widget.closebutton    (c),
            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal
    }
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}

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
