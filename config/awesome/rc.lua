-- awesome_mode: api-level=4:screen=on

--------------
-- awful :( --
--------------
local awful = require'awful'

--------------------------------------
-- load luarocks if installed (huh) --
--------------------------------------
pcall(require, 'luarocks.loader')

-------------
-- L theme --
-------------
local beautiful = require'beautiful'
local gears = require'gears'

local themeName = 'theme/darktheme.lua'

beautiful.init(gears.filesystem.get_configuration_dir() .. themeName)

-------------------
-- bindings lmao --
-------------------
require'bindings'

----------------
-- load rules --
----------------
require'rules'

------------------
-- load signals --
------------------
require'signals'

---------------------
-- autostart wowee --
---------------------
awful.spawn.with_shell("xrdb merge ~/.Xresources")
awful.spawn.with_shell("nitrogen --restore &")
awful.spawn.with_shell("picom -b &")
--awful.spawn.with_shell("nemo-desktop &")
