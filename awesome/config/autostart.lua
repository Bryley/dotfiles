
local awful = require("awful")

-- awful.spawn.with_shell("picom -f")
-- awful.spawn.with_shell("nitrogen --restore")
-- TODO have if condition check this and run if in vbox
-- awful.spawn.with_shell("VBoxClient-all") -- TODO this should be ran automatically with the below command \/

awful.spawn.with_shell(
    'if (xrdb -query | grep -q "^awesome\\.started:\\s*true$"); then exit; fi;' ..
    'xrdb -merge <<< "awesome.started:true";' ..

    -- 'picom -f --no-vsync &;' ..
    'picom -f --experimental-backends -b &;' ..
    'VBoxClient-all &;' .. -- TODO temorary for some reason the below command doesn't work
    'udiskie &;' ..
    'setxkbmap -option caps:ctrl_modifier &;' .. -- Remap caplocks to control
    -- 'xrandr --setprovideroutputsource modesetting NVIDIA-0 &;' .. -- Set nvidia as only graphics card to use
    'xrdb -merge ~/.Xresources &;' .. -- Use .Xresources (handy for high DPI screens
    'redshift -l 27.4705:153.0260 &;' .. -- Use redshift to reduce blue light for brisbane lat and longitude

    'dex --environment Awesome --autostart --search-paths "$XDG_CONFIG_DIRS/autostart:$XDG_CONFIG_HOME/autostart"' -- https://github.com/jceb/dex
)
