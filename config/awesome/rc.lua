
-- awful :(
local awful = require'awful'

-- load luarocks if installed (huh)
pcall(require, 'luarocks.loader')

-- L theme
local beautiful = require'beautiful'
local gears = require'gears'

local themeName = 'theme/theme.lua'

beautiful.init(gears.filesystem.get_configuration_dir()..themeName)

-- bindings lmao
require'binds'

-- load rules
require'rules'

-- load config
require'config'

-- load ui
require'ui'

-- autostart wowee
awful.spawn.with_shell("~/.config/awesome/start")
