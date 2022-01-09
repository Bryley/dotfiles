
-- Basic date display widget

local btn = require("widgets.comps.btn")

local wibox = require("wibox")
local awful = require("awful")
local gears = require("gears")

local naughty = require("naughty")

local click = function (_)
    naughty.notify({text="TODO show calendar"})
    -- month_calendar.toggle() -- TODO fix
end

local widget = {
    format = "%a %b %-d",
    align = "center",
    widget = wibox.widget.textclock,
}


local btn_widget = btn(widget, click)

-- local month_calendar = awful.widget.calendar_popup.month()
-- month_calendar:attach( btn_widget, "tr" )

return btn_widget
