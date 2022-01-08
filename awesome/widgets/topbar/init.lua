local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

local options = require("config.options")


local PADDING = 10

-- Create a textclock widget
-- local mytextclock = wibox.widget.textclock("%a %b %d, %-I:%M %p")
local date = wibox.widget({
    format = "%a %b %-d",
    align = "center",
    widget = wibox.widget.textclock
})
local time = wibox.widget({
    format = "%-I:%M %p",
    align = "center",
    widget = wibox.widget.textclock
})

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

local tasklist_buttons = gears.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  c:emit_signal(
                                                      "request::activate",
                                                      "tasklist",
                                                      {raise = true}
                                                  )
                                              end
                                          end),
                     awful.button({ }, 3, function()
                                              awful.menu.client_list({ theme = { width = 250 } })
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                          end))

awful.screen.connect_for_each_screen(function(s)
    -- Each screen has its own tag table.
    awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons,
    }

    -- Create the wibox
    s.topbar = awful.wibar({
        position = "top",
        screen = s,
        width = s.geometry.width - 2 * PADDING,
        height = 33,
        bg = "#3A3B3B",
        shape = function(cr, w, h)
            gears.shape.rounded_rect(cr, w, h, 10)
        end
    })

    s.topbar:setup {
        layout = wibox.container.margin,
        margins = 5,
        {
            layout = wibox.layout.align.horizontal,
            { -- Left widgets
                layout = wibox.layout.fixed.horizontal,
                s.mytaglist,
                s.mypromptbox,
            },
            {
                layout = wibox.container.background,
                time
            },
            { -- Right widgets
                layout = wibox.layout.fixed.horizontal,
                wibox.widget.systray(),
                date,
                s.mylayoutbox,
            }
        }
    }

    s.topbar.y = PADDING

end)
