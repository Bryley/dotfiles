
local awful = require("awful")      -- Everything related to window management
local wibox = require("wibox")      -- Widget Box, widgets/layout library
local gears = require("gears")      -- Utility functions and constants
local naughty = require("naughty")

local beautiful = require("beautiful") -- Theme module

local VOL_LOW  = " "
local VOL_MID  = "墳"
local VOL_HIGH = " "
local VOL_MUTE = "婢"

local contents = wibox.widget {
    {
        {
            {
                id = "volume-text",
                markup = VOL_MID,
                align = "center",
                font = beautiful.fonts.very_large,
                widget = wibox.widget.textbox,
            },
            {
                forced_height = 10,
                widget = wibox.container.background,
            },
            {
                id = "volume-bar",
                value = 50,
                max_value = 100,
                forced_height = 10,
                forced_width  = 300,
                background_color = beautiful.custom_colours.bg_dark,
                color = beautiful.custom_colours.bg_light,
                shape = gears.shape.rounded_bar,
                widget = wibox.widget.progressbar,
            },
            layout = wibox.layout.fixed.vertical,
        },
        margins = 20,
        widget = wibox.container.margin,
    },
    bg = beautiful.custom_colours.bg,
    widget = wibox.container.background,
}

local vol = awful.popup({
    widget = contents,
    layout = wibox.layout.fixed.vertical,
    placement = awful.placement.center_horizontal,
    y = 50,
    shape = gears.shape.rounded_rect,
    ontop = true,
    visible = false,
})


local update_volume = function(code)
    local cmd = "bash "..beautiful.scripts_folder.."volume.sh "
    if code == 0 then
        cmd = cmd.."get"
    elseif code == -1 then
        cmd = cmd.."down"
    elseif code == 1 then
        cmd = cmd.."up"
    else
        cmd = cmd.."mute"
    end

    awful.spawn.easy_async(cmd, function(stdout, stderr, reason, exit_code)
        -- TODO check exit code
        local vol_str = string.sub(stdout:gsub("^%s*(. -)%s*$", "%1"), 0, -3)
        local volume_amount = tonumber(vol_str)

        vol.widget:get_children_by_id("volume-bar")[1].value = volume_amount
        -- vol:get_children_by_id("volume-text").value = volume_amount

    end)
end

update_volume(0)

return {
    widget = vol,
    update_volume = update_volume,
    setup = function (s)
        s.vol = vol
    end
}

