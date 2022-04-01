
local awful = require("awful")

-- awful.spawn.with_shell("picom -f")
-- awful.spawn.with_shell("nitrogen --restore")
-- TODO have if condition check this and run if in vbox
-- awful.spawn.with_shell("VBoxClient-all") -- TODO this should be ran automatically with the below command \/

awful.spawn.with_shell(
    'if (xrdb -query | grep -q "^awesome\\.started:\\s*true$"); then exit; fi;' ..
    'xrdb -merge <<< "awesome.started:true";' ..

    'picom -f --no-vsync &;' ..
    'VBoxClient-all &;' .. -- TODO temorary for some reason the below command doesn't work
    'udiskie &;' ..

    'dex --environment Awesome --autostart --search-paths "$XDG_CONFIG_DIRS/autostart:$XDG_CONFIG_HOME/autostart"' -- https://github.com/jceb/dex
)
