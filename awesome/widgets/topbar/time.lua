
-- Basic time display widget

local wibox = require("wibox")

return wibox.widget({
    format = "%-I:%M %p",
    align = "center",
    widget = wibox.widget.textclock
})
