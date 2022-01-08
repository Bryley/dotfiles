local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

local options = require("config.options")

local PADDING = 10


-- Widgets
local taglist = require("widgets.topbar.taglist")
local date_display = require("widgets.topbar.date")
local time_display = require("widgets.topbar.time")
local layout_display = require("widgets.topbar.layoutbox")


awful.screen.connect_for_each_screen(function(s)
    -- Each screen has its own tag table.
    awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

    -- Create the wibox
    s.topbar = awful.wibar({
        position = "top",
        screen = s,
        width = s.geometry.width - 2 * PADDING,
        height = 33,
        bg = "#3A3B3B",
        shape = function(cr, w, h)
            gears.shape.rounded_rect(cr, w, h, 10)
        end
    })

    s.topbar:setup {
        layout = wibox.layout.stack, -- Stack to perfectly center time
        {
            layout = wibox.container.margin,
            margins = 5,
            {
                layout = wibox.layout.align.horizontal,
                { -- Left widgets
                    layout = wibox.layout.fixed.horizontal,
                    taglist.init(s),
                },
                nil, -- Middle
                { -- Right widgets
                    layout = wibox.layout.fixed.horizontal,
                    wibox.widget.systray(),
                    date_display,
                    layout_display.init(s)
                }
            }
        },
        time_display,
    }

    s.topbar.y = PADDING

end)