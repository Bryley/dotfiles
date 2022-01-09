local awful = require("awful")
local gears = require("gears")
local hotkeys_popup = require("awful.hotkeys_popup")

local naughty = require("naughty")

local options = require("config.options")

local keys = {}

-- TODO this is a debug function so please remove
-- Convert a lua table into a lua syntactically correct string
function table_to_string(tbl)
    local result = "{"
    for k, v in pairs(tbl) do
        -- Check the key type (ignore any numerical keys - assume its an array)
        if type(k) == "string" then
            result = result.."[\""..k.."\"]".."="
        end

        -- Check the value type
        if type(v) == "table" then
            result = result..table_to_string(v)
        elseif type(v) == "boolean" then
            result = result..tostring(v)
        else
            result = result.."\""..v.."\""
        end
        result = result..","
    end
    -- Remove leading commas from the result
    if result ~= "" then
        result = result:sub(1, result:len()-1)
    end
    return result.."}"
end

-- Mouse Bindings --
root.buttons(gears.table.join(
    -- awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))

-- Key Bindings --
keys.globalkeys = gears.table.join(
    awful.key({ options.modkey,           }, "s",      hotkeys_popup.show_help,
              {description="show help", group="awesome"}),
    awful.key({ options.modkey,           }, "Escape", awful.tag.history.restore,
              {description = "go back", group = "tag"}),

    ---------------------------
    -- Start my key bindings --
    ---------------------------

    -- Tags
    awful.key(
        {options.modkey, "Control"}, "h",
        awful.tag.viewprev,
        {description = "Select previous tag", group = "tag"}
    ),
    awful.key(
        {options.modkey, "Control"}, "l",
        awful.tag.viewnext,
        {description = "Select next tag", group = "tag"}
    ),

    -- Focusing windows
    awful.key(
        {options.modkey}, "h",
        function ()
            awful.client.focus.bydirection("left")
        end,
        {description = "Focus to the left", group = "client"}
    ),
    awful.key(
        {options.modkey}, "j",
        function ()
            awful.client.focus.bydirection("down")
        end,
        {description = "Focus downwards", group = "client"}
    ),
    awful.key(
        {options.modkey}, "k",
        function ()
            awful.client.focus.bydirection("up")
        end,
        {description = "Focus upwards", group = "client"}
    ),
    awful.key(
        {options.modkey}, "l",
        function ()
            awful.client.focus.bydirection("right")
        end,
        {description = "Focus to the right", group = "client"}
    ),

    -- Moving windows
    awful.key(
        {options.modkey, "Shift"}, "h",
        function ()
            awful.client.swap.bydirection("left")
        end,
        {description = "Swap with the left", group = "client"}
    ),
    awful.key(
        {options.modkey, "Shift"}, "j",
        function ()
            awful.client.swap.bydirection("down")
        end,
        {description = "Swap downwards", group = "client"}
    ),
    awful.key(
        {options.modkey, "Shift"}, "k",
        function ()
            awful.client.swap.bydirection("up")
        end,
        {description = "Swap upwards", group = "client"}
    ),
    awful.key(
        {options.modkey, "Shift"}, "l",
        function ()
            awful.client.swap.bydirection("right")
        end,
        {description = "Swap with the right", group = "client"}
    ),

    -- Resizing windows TODO not working
    -- awful.key(
    --     {options.modkey}, "Right",
    --     function ()
    --         awful.client.incwfact(0.05)
    --     end,
    --     {description = "Resize window vertically", group = "client"}
    -- ),

    ---------------------------
    -- END of my keybindings --
    ---------------------------

    -- Standard program
    awful.key(
        {options.modkey}, "Return",
        function ()
            awful.spawn(options.terminal)
        end,
        {description = "Open a terminal", group = "launcher"}
    ),
    awful.key(
        {options.modkey}, "b",
        function ()
            awful.spawn(options.browser)
        end,
        {description = "Open a web browser", group = "launcher"}
    ),
    awful.key({ options.modkey, "Control" }, "r", awesome.restart,
              {description = "Reload awesome", group = "awesome"}),
    awful.key({ options.modkey, "Shift"   }, "q", awesome.quit,
              {description = "Quit awesome", group = "awesome"}),


    -- TODO look into this
    awful.key({ options.modkey,           }, "space", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),
    awful.key({ options.modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"}),

    -- awful.key({ options.modkey, "Control" }, "n",
    --           function ()
    --               local c = awful.client.restore()
    --               -- Focus restored client
    --               if c then
    --                 c:emit_signal(
    --                     "request::activate", "key.unminimize", {raise = true}
    --                 )
    --               end
    --           end,
    --           {description = "restore minimized", group = "client"}),

    -- Prompt
    awful.key(
        {options.modkey}, "r",
        function ()
            -- awful.screen.focused().mypromptbox:run()
            awful.spawn(options.search)
        end,
        {description = "Run rofi app menu", group = "launcher"}),

    awful.key({ options.modkey }, "x",
              function ()
                  awful.prompt.run {
                    prompt       = "Run Lua code: ",
                    textbox      = awful.screen.focused().mypromptbox.widget,
                    exe_callback = awful.util.eval,
                    history_path = awful.util.get_cache_dir() .. "/history_eval"
                  }
              end,
              {description = "lua execute prompt", group = "awesome"})
)

keys.clientkeys = gears.table.join(
    -- MY KEYS --

    -- Resizing
    awful.key(
        {options.modkey}, "Up",
        function (c)
            if c.floating then
                c:relative_move(0, 0, 0, -20)
            else
                awful.client.incwfact(0.025)
            end
        end,
        {description = "Resize window vertically", group = "client"}
    ),
    awful.key(
        {options.modkey}, "Down",
        function (c)
            if c.floating then
                c:relative_move(0, 0, 0, 20)
            else
                awful.client.incwfact(-0.025)
            end
        end,
        {description = "Resize window vertically", group = "client"}
    ),
    awful.key(
        {options.modkey}, "Left",
        function (c)
            if c.floating then
                c:relative_move(0, 0, -20, 0)
            else
                awful.tag.incmwfact(-0.025)
            end
        end,
        {description = "Resize window horizontally", group = "client"}
    ),
    awful.key(
        {options.modkey}, "Right",
        function (c)
            if c.floating then
                c:relative_move(0, 0, 20, 0)
            else
                awful.tag.incmwfact(0.025)
            end
        end,
        {description = "Resize window horizontally", group = "client"}
    ),
    -- End of resizing

    -- Move client to next / prev tag
    awful.key(
        {options.modkey, "Shift", "Control"}, "h",
        function (c)
            local current_tag = c.first_tag or nil
            if current_tag == nil then
                return
            end
            local tag = c.screen.tags[(current_tag.index - 2) % 9 + 1]
            awful.client.movetotag(tag)
            awful.tag.viewprev()
        end,
        {description = "Move client to previous tag", group = "client"}
    ),
    awful.key(
        {options.modkey, "Shift", "Control"}, "l",
        function (c)
            local current_tag = c.first_tag or nil
            if current_tag == nil then
                return
            end
            local tag = c.screen.tags[current_tag.index % 9 + 1]
            awful.client.movetotag(tag)
            awful.tag.viewnext()
        end,
        {description = "Move client to next tag", group = "client"}
    ),


    awful.key(
        {options.modkey}, "q",
        function (c)
            c:kill()
        end,
        {description = "Quit application", group = "client"}
    ),

    -- END OF MY KEYS --

    -- awful.key({ options.modkey,           }, "f",
    --     function (c)
    --         c.fullscreen = not c.fullscreen
    --         c:raise()
    --     end,
    --     {description = "toggle fullscreen", group = "client"}),
    awful.key({ options.modkey, "Control" }, "space",  awful.client.floating.toggle                     ,
              {description = "toggle floating", group = "client"}),
    -- awful.key({ options.modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
    --           {description = "move to master", group = "client"}),
    -- awful.key({ options.modkey,           }, "o",      function (c) c:move_to_screen()               end,
    --           {description = "move to screen", group = "client"}),
    -- awful.key({ options.modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
    --           {description = "toggle keep on top", group = "client"}),
    awful.key({ options.modkey,           }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "(un)maximize", group = "client"})
    -- awful.key({ options.modkey, "Control" }, "m",
    --     function (c)
    --         c.maximized_vertical = not c.maximized_vertical
    --         c:raise()
    --     end ,
    --     {description = "(un)maximize vertically", group = "client"}),
    -- awful.key({ options.modkey, "Shift"   }, "m",
    --     function (c)
    --         c.maximized_horizontal = not c.maximized_horizontal
    --         c:raise()
    --     end ,
    --     {description = "(un)maximize horizontally", group = "client"})
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    keys.globalkeys = gears.table.join(keys.globalkeys,
        -- View tag only.
        awful.key({ options.modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        -- Toggle tag display.
        awful.key({ options.modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key({ options.modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"}),
        -- Toggle tag on focused client.
        awful.key({ options.modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

keys.clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ options.modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ options.modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

-- Set keys
root.keys(keys.globalkeys)

return keys
