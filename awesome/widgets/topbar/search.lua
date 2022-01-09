
-- Small search button for launching rofi

local btn = require("widgets.comps.btn")

local wibox = require("wibox")
local awful = require("awful")

local options = require("config.options")

local click = function (_)
    awful.spawn(options.search)
end

local widget = {
    text = "",
    widget = wibox.widget.textbox,
}

return btn(widget, click)
