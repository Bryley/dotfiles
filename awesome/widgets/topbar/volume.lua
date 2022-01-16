
-- A volume arc located in the tabbar

-- TODO finish this

local btn = require("widgets.comps.btn")

local wibox = require("wibox")
local awful = require("awful")

local widget = {
    value = 40,
    thickness = 1,
    min_value = 0,
    max_value = 100,
    paddings = 5,
    layout = wibox.container.arcchart,
    {
        text = "墳",
        widget = wibox.widget.textbox
    }
}

return btn(widget, function (_)
    -- Nothing
end)
