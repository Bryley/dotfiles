
-- The list of tags used in topbar

local gears  = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local naughty = require("naughty")
local beautiful = require("beautiful")

local options = require("config.options")

local M = {}


local client_icons = {
    ['Brave-browser'] = beautiful.icons.clients.browser,
    ['Alacritty'] = beautiful.icons.clients.terminal,
    ['Slack'] = beautiful.icons.clients.slack,
    ['Emacs'] = beautiful.icons.clients.emacs,
    ['Prospect Mail'] = beautiful.icons.clients.mail,
    ['DBeaver'] = beautiful.icons.clients.database,
    ['Lens'] = beautiful.icons.clients.lens,
}


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
    -- self:get_children_by_id('index_role')[1].markup = contents

    -- Do icons by checking the client and choosing based on class.
    -- Look into font awesome icons for each program that is used.

    local icon_list = self:get_children_by_id('icons_role')[1]
    icon_list:reset()

    for i, c in ipairs(tag:clients()) do

        local icon = client_icons[c.class]
        if icon == nil then
            icon = beautiful.icons.clients.other
        end
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

local create_callback = function(self, tag, index, tags)
    -- Hover support
    self:connect_signal('mouse::enter', function()
        self.old_colour = self.bg

        self.bg = beautiful.bg_btn_hover
        self.hover = true
    end)
    self:connect_signal('mouse::leave', function()
        self.bg = self.old_colour
        self.hover = false
    end)
    self:connect_signal('button::release', function()
        self.old_colour = beautiful.taglist_bg_focus
    end)

    update_callback(self, tag, index, tags)

end

-- TODO use later
-- local index_bubble = {
--     widget = wibox.container.background,
--     bg = beautiful.taglist_bg_dark,
--     forced_width = 25,
--     forced_height = 25,
--     shape = beautiful.taglist_shape,
--     {
--         layout = wibox.container.margin,
--         margins = 2,
--         {
--             widget = wibox.widget.textbox,
--             id = 'index_role',
--             -- id = 'text_role',
--             align = "center",
--             valign = "center",
--         }
--     },
-- }
-- local template = {
--     container = wibox.container.background,
--     id = 'background_role',
--     {
--         widget = wibox.container.margin,
--         left = 10,
--         right = 10,
--         top = 2,
--         bottom = 2,
--         {
--             -- {
--                 widget = wibox.container.background,
--                 shape = beautiful.taglist_shape,
--                 bg = "#fb3456",
--                 forced_width = 20,
--                 forced_height = 20,
--                 -- { -- Index
--                 --     widget = wibox.container.margin,
--                 --     -- left = beautiful.taglist_padding_inline,
--                 --     -- right = beautiful.taglist_padding_inline,
--                 --     -- top = 2,
--                 --     -- bottom = 2,
--                 --     margins = 5,
--                 --     index_bubble,
--                 -- },
--                 -- { -- Client Icons
--                 --     widget = wibox.container.margin,
--                 --     right = beautiful.taglist_padding_inline,
--                 --     {
--                 --         id = 'icons_role',
--                 --         layout = wibox.layout.fixed.horizontal,
--                 --     },
--                 -- },
--             -- },
--             -- layout = wibox.layout.fixed.horizontal,
--         },
--     },
--     -- create_callback = update_callback,
--     -- update_callback = update_callback,
-- }

local template = {
    layout = wibox.container.background,
    id = 'background_role',
    -- forced_width = 25,
    -- forced_height = 25,
    {
        widget = wibox.container.margin,
        top = 2,
        bottom = 2,
        left = 10,
        right = 10,
        {
            { -- Index number
                widget = wibox.container.background,
                bg = beautiful.taglist_bg_dark,
                forced_width = 25,
                forced_height = 25,
                shape = beautiful.taglist_shape,
                {
                    layout = wibox.container.margin,
                    margins = 2,
                    {
                        widget = wibox.widget.textbox,
                        -- id = 'index_role',
                        id = 'text_role',
                        align = "center",
                        valign = "center",
                    }
                },
            },
            {
                id = 'icons_role',
                layout = wibox.layout.fixed.horizontal,
            },
            layout = wibox.layout.fixed.horizontal,
        },
    },
    create_callback = create_callback,
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
