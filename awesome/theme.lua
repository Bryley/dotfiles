----------------------------
-- Bryley's awesome theme --
----------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local wibox = require("wibox")

local awful = require("awful")
local naughty = require("naughty")

local gears  = require("gears")
local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local config_home = gfs.get_configuration_dir()

local theme = {}

theme.dpi = dpi
theme.scripts_folder = config_home.."../scripts/"

-- Colors --

theme.bg_normal = "#000000" .. "66"
theme.bg_alternate = "#000000" .. "11"
theme.bg_hover = "#000000" .. "21"
theme.bg_down = "#000000" .. "17"

theme.bg_light = "#ffffff" .. "2d"
theme.bg_light = "#ffffff" .. "2d"

theme.bg_btn = "#000000" .. "11"
theme.bg_btn_down = "#000000" .. "3f"
theme.bg_btn_hover = theme.bg_btn_down


-- Number Settings --

theme.border_radius = dpi(20)
theme.margin = dpi(7)

theme.topbar_height = dpi(40)


-- Taglist Stuff --

local taglist_shape = function (cr, w, h)
    -- return gears.shape.rounded_rect(cr, w, h, theme.border_radius)
    return gears.shape.rounded_rect(cr, w, h, theme.border_radius)
end

theme.taglist_shape = taglist_shape
theme.taglist_spacing = dpi(3)

theme.taglist_bg_focus = theme.bg_btn_down
theme.taglist_bg_occupied = theme.bg_btn

theme.taglist_padding_inline = 10


-- Fonts --

theme.material_icon_font = "Material Icons 12"
theme.icon_color = "#ffffff"

theme.wifi_icon = wibox.widget{
    markup = ' <span color="'.. theme.icon_color ..'">\u{e63e}</span> ',
    align  = 'center',
    valign = 'center',
    widget = wibox.widget.textbox
}


theme.font          = "Inter Font Regular 12"
theme.titlefont     = "Inter Font Bold 12"
theme.fontname      = "Inter Font Regular 12"

theme.fonts = {
    medium = "RobotoMono Nerd Font Mono Regular 11",
    large = "RobotoMono Nerd Font Mono Regular 16",
    very_large = "RobotoMono Nerd Font Mono Regular 30"
}

-- Icons --

-- Use some icons from Material Icons and Font Awesome 5
theme.material_icon_font = "Material Icons 12"
theme.icon_font = "Font Awesome 5 Free-Solid-900 12"


local function icon(unicode, font_awesome)
    -- Helper function for creating an icon
    font_awesome = font_awesome or false

    local w = wibox.widget{
        markup = ' <span color="'.. theme.icon_color ..'">'..unicode..'</span> ',
        align  = 'center',
        valign = 'center',
        widget = wibox.widget.textbox
    }
    w.font = font_awesome and theme.font_awesome_font or theme.material_icon_font

    return w
end

theme.icons = {
    clients = {
        browser = icon("\u{f268}", true),
        terminal = icon("\u{eb8e}", false),
        slack = icon("\u{f198}", true),
        emacs = icon("\u{e244}", false),
        database = icon("\u{f1c0}", true),
        lens = icon("\u{e4e2}", true),
        mail = icon("\u{f0e0}", true),
        other = icon("\u{f192}", true),
    },
    network = {
        wifi = icon("\u{e63e}", false),
        wired = icon("\u{eb2f}", false),
        off = icon("\u{e648}", false),
    },
    volume = {
        mute = icon("\u{e04f}", false),
        low = icon("\u{e04e}", false),
        mid = icon("\u{e04d}", false),
        high = icon("\u{e050}", false),
    },
    battery = {
        charging = icon("\u{e1a3}", false),
        full = icon("\u{e1a4}", false),
        levels = { -- List starting at lowest battery symbol to highest
            icon("\u{ebdc}", false),
            icon("\u{ebd9}", false),
            icon("\u{ebe0}", false),
            icon("\u{ebdd}", false),
            icon("\u{ebe2}", false),
            icon("\u{ebd4}", false),
        },
    },
    menu = icon("\u{e5d2}", false),
}


-- Font Awesome Icons (Old) --

-- theme.icon_size = 12
-- theme.icon_font = "Font Awesome 5 Free-Solid-900 " -- attention to space at the end!
-- theme.icon_color = "#ffffff"
--
-- theme.icons = {
--     browser = wibox.widget{
--         markup = ' <span color="'.. theme.icon_color ..'">\u{f268}</span> ',
--         align  = 'center',
--         valign = 'center',
--         widget = wibox.widget.textbox
--     },
--     terminal = wibox.widget{
--         markup = ' <span color="'.. theme.icon_color ..'">\u{f120}</span> ',
--         align  = 'center',
--         valign = 'center',
--         widget = wibox.widget.textbox
--     },
--     slack = wibox.widget{
--         markup = ' <span color="'.. theme.icon_color ..'">\u{f198}</span> ',
--         align  = 'center',
--         valign = 'center',
--         widget = wibox.widget.textbox
--     },
--     emacs = wibox.widget{
--         markup = ' <span color="'.. theme.icon_color ..'">\u{f044}</span> ',
--         align  = 'center',
--         valign = 'center',
--         widget = wibox.widget.textbox
--     },
--     database = wibox.widget{
--         markup = ' <span color="'.. theme.icon_color ..'">\u{f1c0}</span> ',
--         align  = 'center',
--         valign = 'center',
--         widget = wibox.widget.textbox
--     },
--     lens = wibox.widget{
--         markup = ' <span color="'.. theme.icon_color ..'">\u{e4e2}</span> ',
--         align  = 'center',
--         valign = 'center',
--         widget = wibox.widget.textbox
--     },
--     mail = wibox.widget{
--         markup = ' <span color="'.. theme.icon_color ..'">\u{f0e0}</span> ',
--         align  = 'center',
--         valign = 'center',
--         widget = wibox.widget.textbox
--     },
--     client_other = wibox.widget{
--         markup = ' <span color="'.. theme.icon_color ..'">\u{f192}</span> ',
--         align  = 'center',
--         valign = 'center',
--         widget = wibox.widget.textbox
--     },
-- }
--
-- for i, icon in ipairs(theme.icons) do
--     icon.font = theme.icon_font.. theme.icon_size
-- end

-- theme.font          = "RobotoMono Nerd Font Mono Regular 11"
-- theme.titlefont     = "RobotoMono Nerd Font Mono Bold 11"
-- theme.fontname      = "RobotoMono Nerd Font Mono Regular 11"
--
-- theme.fonts = {
--     medium = "RobotoMono Nerd Font Mono Regular 11",
--     large = "RobotoMono Nerd Font Mono Regular 16",
--     very_large = "RobotoMono Nerd Font Mono Regular 30"
-- }

-- Colours --
-- theme.bg_normal     = "#3A3B3B"
-- theme.bg_normal     = "#1C1E26"
-- theme.bg_focus      = theme.bg_normal
-- theme.bg_urgent     = theme.bg_normal
-- theme.bg_minimize   = "#aaaaaa"--theme.bg_normal
-- theme.bg_systray    = theme.bg_normal
-- theme.bg_light      = "#232530"
-- theme.bg_very_light = "#2E303E"
-- theme.bg_dark       = "#1A1C23"

theme.fg_normal     = "#dddddd"
theme.fg_dark       = "#cccccc"
theme.fg_focus      = "#ffffff"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"

theme.highlight     = "#F43E5C"
theme.highlight_alt = "#B877DB"

theme.misc1         = "#6C6F93"
theme.misc2         = "#2f3240"
theme.transparent   = "#282A3600"

theme.custom_colours = {
    bg          = "#3A3B3B",
    bg_light    = "#5c5e5e",
    bg_dark     = "#2d2e2e",
}

-- theme.bg_normal     = "#1C1E26"
-- theme.bg_focus      = theme.bg_normal
-- theme.bg_urgent     = theme.bg_normal
-- theme.bg_minimize   = "#aaaaaa"--theme.bg_normal
-- theme.bg_systray    = theme.bg_normal
-- theme.bg_light      = "#232530"
theme.bg_very_light = "#2E303E"
-- theme.bg_dark       = "#1A1C23"
-- 
-- theme.fg_normal     = "#dddddd"
-- theme.fg_dark       = "#cccccc"
-- theme.fg_focus      = "#ffffff"
-- theme.fg_urgent     = "#ffffff"
-- theme.fg_minimize   = "#ffffff"
-- 
-- theme.highlight = "#F43E5C"
-- theme.highlight_alt = "#B877DB"
-- 
-- theme.misc1 = "#6C6F93"
-- theme.misc2 = "#2f3240"
-- theme.transparent = "'#282A3600"

-- terminal colors
theme.blue = "#26BBD9"
theme.blue_light = "#3FC6DE"
theme.cyan = "#59E3E3"
theme.cyan_light = "#6BE6E6"
theme.green = "#29D398"
theme.green_light = "#3FDAA4"
theme.purple = "#EE64AE"
theme.purple_light = "#F075B7"
theme.red = "#E95678"
theme.red_light = "#EC6A88"
theme.yellow = "#FAB795"
theme.yellow_light = "#FBC3A7"


-- Border Options --
theme.useless_gap   = dpi(15)
theme.border_width  = dpi(0)
theme.border_normal = theme.bg_very_light
theme.border_focus  = theme.bg_very_light
theme.border_marked = theme.bg_very_light

-- TODO Need to get below code working
-- theme.rounded_corners = true
-- theme.border_radius = dpi(6)
-- Bar Options --
-- theme.bar_position = "top"
-- theme.bar_height = dpi(28)
-- theme.bar_item_radius = dpi(10)
-- theme.bar_item_padding = dpi(3)


-- Generate taglist squares:

-- local taglist_square_size = dpi(4)
-- theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
--     taglist_square_size, theme.fg_normal
-- )
-- theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
--     taglist_square_size, theme.fg_normal
-- )

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path.."default/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
-- TODO remove as it is not used
theme.titlebar_close_button_normal = themes_path.."default/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = themes_path.."default/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = themes_path.."default/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = themes_path.."default/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = themes_path.."default/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = themes_path.."default/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = themes_path.."default/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = themes_path.."default/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = themes_path.."default/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = themes_path.."default/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = themes_path.."default/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = themes_path.."default/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = themes_path.."default/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = themes_path.."default/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = themes_path.."default/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = themes_path.."default/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = themes_path.."default/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = themes_path.."default/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = themes_path.."default/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = themes_path.."default/titlebar/maximized_focus_active.png"

theme.wallpaper = config_home .. "wallpapers/wallpaper2.jpg"

-- You can use your own layout icons like this:
theme.layout_fairh = themes_path.."default/layouts/fairhw.png"
theme.layout_fairv = themes_path.."default/layouts/fairvw.png"
theme.layout_floating  = themes_path.."default/layouts/floatingw.png"
theme.layout_magnifier = themes_path.."default/layouts/magnifierw.png"
theme.layout_max = themes_path.."default/layouts/maxw.png"
theme.layout_fullscreen = themes_path.."default/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path.."default/layouts/tilebottomw.png"
theme.layout_tileleft   = themes_path.."default/layouts/tileleftw.png"
theme.layout_tile = themes_path.."default/layouts/tilew.png"
theme.layout_tiletop = themes_path.."default/layouts/tiletopw.png"
theme.layout_spiral  = themes_path.."default/layouts/spiralw.png"
theme.layout_dwindle = themes_path.."default/layouts/dwindlew.png"
theme.layout_cornernw = themes_path.."default/layouts/cornernww.png"
theme.layout_cornerne = themes_path.."default/layouts/cornernew.png"
theme.layout_cornersw = themes_path.."default/layouts/cornersww.png"
theme.layout_cornerse = themes_path.."default/layouts/cornersew.png"

-- Generate Awesome icon: TODO maybe remove
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil



-- DEBUG Stuff

function dump(o)
    if type(o) == 'table' then
        local s = '{ '
        for k,v in pairs(o) do
            if type(k) == 'function' then k = tostring(k) end
            if type(k) ~= 'number' then k = '\\"'..k..'\\"' end
            s = s .. '['..k..'] = ' .. dump(v) .. ','
        end
        return s .. '} '
    else
        return tostring(o)
    end
end

theme.debug = function (data)
    awful.spawn.with_shell("echo \""..dump(data).."\" > ~/.awesome_output")
    naughty.notify({text = "Sent data to file"})
end



return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
