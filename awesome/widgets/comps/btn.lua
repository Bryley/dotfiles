
-- Contains code for creating a button widget

local wibox = require("wibox")
local awful = require("awful")
local gears = require("gears")

local beautiful = require("beautiful") -- Theme module

-- local HOVER_COLOR = '#4b4b4b'
-- local DOWN_COLOR = '#2e2e2e'

return function (contents, click)
    local widget = wibox.widget({
        layout = wibox.container.background,
        -- shape = gears.shape.rounded_rect,
        shape = function(cr, w, h)
            gears.shape.rounded_rect(cr, w, h, beautiful.border_radius)
        end,
        {
            layout = wibox.container.margin,
            left = beautiful.dpi(10),
            right = beautiful.dpi(10),
            -- left = 10,
            -- right = 10,
            -- top = 5,
            -- bottom = 5,
            contents,
        }
    })
    widget:connect_signal("mouse::enter", function (w)
        w:set_bg(beautiful.bg_hover)
    end)
    widget:connect_signal("mouse::leave", function (w)
        w:set_bg(nil)
    end)
    widget:connect_signal("button::press", function(w)
        w:set_bg(beautiful.bg_down)
    end)
    widget:connect_signal("button::release", function(w)
        w:set_bg(nil)
        click(w)
    end)

    return widget
end

