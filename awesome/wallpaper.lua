local beautiful = require("beautiful")
local awful = require("awful")
local gears = require("gears")

local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        -- `beautiful.wallpaper` is set with the theme
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, false)
    end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

end)
