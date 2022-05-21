-- This is code for the dashboard button in the topbar

local btn = require("widgets.comps.btn")

local wibox = require("wibox")
local awful = require("awful")

local naughty = require("naughty")

local options = require("config.options")

local beautiful = require("beautiful")

-- Temp function to convert table to string

local click = function (_)
    awful.spawn(options.search)
end

local get_network_icon = function ()
    local SCRIPT = beautiful.scripts_folder..'network.sh'
    return awful.widget.watch(SCRIPT, 3, function(widget, stdout)
        local icon = beautiful.icons.network.wifi

        if (stdout == 'Offline') then
            icon = beautiful.icons.network.off
        elseif (stdout == 'Ethernet') then
            icon = beautiful.icons.network.wired
        end
        widget:set_markup_silently(icon.markup)
    end)
end

local get_battery_icon = function ()
    local SCRIPT = beautiful.scripts_folder..'battery.sh'
    return awful.widget.watch(SCRIPT, 3, function(widget, stdout, _, _, exitcode)
        if (exitcode ~= 0) then
            return
        end
        -- TODO use different icon for battery
        widget:set_markup_silently(stdout)
    end)
end

-- local widget = wibox.widget{
--     widget = wibox.layout.fixed.horizontal,
    -- get_network_icon(),
    -- get_battery_icon()
-- }

local widget = wibox.widget {
    widget = get_network_icon()
}

-- beautiful.debug(widget)

-- naughty.notify({text = dump(widget)})

return btn(widget, click)
