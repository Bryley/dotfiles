
-- Basic date display widget

local wibox = require("wibox")
local awful = require("awful")
local gears = require("gears")

local naughty = require("naughty")

local btns = gears.table.join(
    awful.button({}, 1,
        function ()
            naughty.notify({text="Oh I see"})
        end
    )
)

return wibox.widget({
    format = "%a %b %-d",
    align = "center",
    buttons = btns,
    widget = wibox.widget.textclock,
})
