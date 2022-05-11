
-- The button in the top right that displays the layout

local awful = require("awful")
local gears = require("gears")

local M = {}

local btns = gears.table.join(
    awful.button({ }, 1,
        function ()
        awful.layout.inc( 1)
        end
    ),
    awful.button({ }, 3,
        function ()
            awful.layout.inc(-1)
        end
    ),
    awful.button({ }, 4,
        function ()
            awful.layout.inc( 1)
        end
    ),
    awful.button({ }, 5,
        function ()
            awful.layout.inc(-1)
        end
    )
)

M.init = function (s)
    local layoutbox = awful.widget.layoutbox(s)
    -- layoutbox:buttons(btns)
    return layoutbox
end

return M
