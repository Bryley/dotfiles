
local awful = require("awful")

awful.spawn.with_shell("picom -f")
-- awful.spawn.with_shell("nitrogen --restore")
-- TODO have if condition check this and run if in vbox
awful.spawn.with_shell("VBoxClient-all")
