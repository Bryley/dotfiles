
-- The list of tags used in topbar

local gears  = require("gears")
local awful = require("awful")
local wibox = require("wibox")

local options = require("config.options")

local M = {}


-- TODO play around with this
-- M.init = function (screen)
-- 
--     -- screen.tags[1].name
--     local tag = screen.tags[1]
-- 
--     return {
--         layout = wibox.layout.fixed.horizontal,
--         {
--             layout = wibox.widget.textbox,
--             text = tag.name .. " " .. tostring(tag.selected)
--         },
--         {
--             layout = wibox.widget.textbox,
--             text = screen.tags[1].name
--         },
--     }
-- end
-- 
-- return M

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
    awful.button({ }, 1,
        function(t)
            t:view_only()
        end
    ),
    awful.button({ options.modkey }, 1,
        function(t)
            if client.focus then
                client.focus:move_to_tag(t)
            end
        end
    ),
    awful.button({ }, 3,
        awful.tag.viewtoggle
    ),
    awful.button({ options.modkey }, 3,
        function(t)
            if client.focus then
                client.focus:toggle_tag(t)
            end
        end
    ),
    awful.button({ }, 4,
        function(t)
            awful.tag.viewnext(t.screen)
        end
    ),
    awful.button({ }, 5,
        function(t)
            awful.tag.viewprev(t.screen)
        end
    )
)


local template = {
    layout = wibox.container.background,
    id = 'background_role',
    forced_width = 25,
    forced_height = 25,
    -- TODO this shape is not working
    shape = function (cr, w, h)
        return gears.shape.rounded_rect(cr, w, h, 15)
    end,
    {
        layout = wibox.container.margin,
        margins = 2,
        {
            layout = wibox.widget.textbox,
            align = "center",
            id = 'text_role'
        }
    }
}

M.init = function(s)
    return awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons,
        widget_template = template
    }
end

return M
