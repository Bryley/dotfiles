local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

local beautiful = require("beautiful") -- Theme module


-- Widgets
local rofi_btn = require("widgets.topbar.search")
local taglist = require("widgets.topbar.taglist")
local date_display = require("widgets.topbar.date")
local time_display = require("widgets.topbar.time")
local volume = require("widgets.topbar.volume")
local layout_display = require("widgets.topbar.layoutbox")
local dashboard_widget = require("widgets.topbar.dashboard")


local margin = function (widget)
    return {
        layout = wibox.container.margin,
        left = 5,
        right = 5,
        widget
    }
end

-- Expects screen variable
return {
    setup = function (s)
        -- Create the wibox
        s.topbar = awful.wibar({
            position = "top",
            screen = s,
            width = s.geometry.width - 2 * beautiful.margin,
            -- height = s.geometry.height * 0.027, -- Bar should be 2.7% of height
            height = beautiful.topbar_height,
            -- bg = "#3A3B3Bee", -- TODO store in global variable
            bg = beautiful.bg_normal,
            shape = function(cr, w, h)
                gears.shape.rounded_rect(cr, w, h, beautiful.border_radius) -- was 10
            end
        })

        s.topbar:setup {
            layout = wibox.layout.stack, -- Stack to perfectly center time in middle
            {
                layout = wibox.container.margin,
                margins = beautiful.margin,
                {
                    layout = wibox.layout.align.horizontal,
                    { -- Left widgets
                        layout = wibox.layout.fixed.horizontal,
                        margin(rofi_btn),
                        margin(taglist.init(s)),
                    },
                    nil, -- Middle
                    { -- Right widgets
                        layout = wibox.layout.fixed.horizontal,
                        wibox.widget.systray(),
                        -- margin(volume),
                        margin(date_display),
                        margin(dashboard_widget),
                        margin(layout_display.init(s))
                    }
                }
            },
            time_display,
        }

        s.topbar.y = beautiful.margin
    end
}
