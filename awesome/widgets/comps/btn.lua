
-- Contains code for creating a button widget

local wibox = require("wibox")
local awful = require("awful")
local gears = require("gears")

local HOVER_COLOR = '#4b4b4b'
local DOWN_COLOR = '#2e2e2e'

return function (contents, click)
    local widget = wibox.widget({
        layout = wibox.container.background,
        shape = gears.shape.rounded_rect,
        {
            layout = wibox.container.margin,
            left = 10,
            right = 10,
            top = 5,
            bottom = 5,
            contents,
        }
    })
    widget:connect_signal("mouse::enter", function (w)
        w:set_bg(HOVER_COLOR)
    end)
    widget:connect_signal("mouse::leave", function (w)
        w:set_bg(nil)
    end)
    widget:connect_signal("button::press", function(w)
        w:set_bg(DOWN_COLOR)
    end)
    widget:connect_signal("button::release", function(w)
        w:set_bg(nil)
        click(w)
    end)

    return widget
end

