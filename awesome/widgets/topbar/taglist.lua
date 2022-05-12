
-- The list of tags used in topbar

local gears  = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local naughty = require("naughty")
local beautiful = require("beautiful")

local options = require("config.options")

local M = {}


local client_icons = {
    ['Brave-browser'] = beautiful.icons.browser,
    ['Alacritty'] = beautiful.icons.terminal,
    ['Slack'] = beautiful.icons.slack,
    ['Emacs'] = beautiful.icons.emacs,
    ['Prospect Mail'] = beautiful.icons.mail,
    ['DBeaver'] = beautiful.icons.database,
    ['Lens'] = beautiful.icons.lens,
}

-- Filter function to use for tags
function tagfilter(tag)
    -- If tag contains clients or is selected
    if tag.selected or #tag:clients() > 0 then
        return true
    end
    return false
end


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

local update_callback = function(self, tag, index, tags)
    -- Bold on select
    contents = ""
    if tag.selected then
        contents = "<b>"..index.."</b>"
    else
        contents = ""..index
    end
    self:get_children_by_id('index_role')[1].markup = contents

    -- Do icons by checking the client and choosing based on class.
    -- Look into font awesome icons for each program that is used.

    local icon_list = self:get_children_by_id('icons_role')[1]
    icon_list:reset()

    for i, c in ipairs(tag:clients()) do

        local icon = client_icons[c.class]
        icon_list:add(icon)

        -- Use this as testing for class:
        -- icon_list:add(wibox.widget{
        --     markup = '('.. (c.class) .. ')',
        --     align  = 'center',
        --     valign = 'center',
        --     widget = wibox.widget.textbox
        -- })
        -- icon_list:add(beautiful.icons.browser)
    end

end

local template = {
    layout = wibox.container.background,
    id = 'background_role',
    -- forced_width = 25,
    -- forced_height = 25,
    {
        { -- Index number
            layout = wibox.container.margin,
            margins = 2,
            {
                widget = wibox.widget.textbox,
                id = 'index_role',
                align = "center",
                valign = "center",
            }
        },
        { -- Client Icons TODO manage this (almost done check out commented code above)
            id = 'icons_role',
            layout = wibox.layout.fixed.horizontal,
        },
        layout = wibox.layout.fixed.horizontal,
    },
    create_callback = update_callback,
    update_callback = update_callback,
}

M.init = function(s)
    return awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.noempty,
        buttons = taglist_buttons,
        widget_template = template,
    }
end

return M
