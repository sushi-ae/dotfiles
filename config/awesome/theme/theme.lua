---------------------------
-- colors and stuff lmao --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local rnotification = require("ruled.notification")
local dpi = xresources.apply_dpi
local xrdb = xresources.get_current_theme()

local gears = require'gears'
local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local theme = {}

theme.font = "Victor Mono Italic 10"

-- Values

theme.universal_border_color = "#fafafa"

theme.titlebar_height = dpi(45)
theme.titlebar_pos = "top"

theme.bar_height = dpi(40)
theme.bar_pos = "bottom"

theme.wibar_border_width = dpi(0)
theme.wibar_border_color = theme.universal_border_color

theme.tasklist_bg_focus = "#121212"
theme.taglist_fg_focus = "#fafafa"

theme.separator_thickness = dpi(1)
theme.separator_border_width = dpi(0)
theme.separator_color = theme.universal_border_color

-- Specific Colors
theme.titlebar_bg_normal = "#121212"
theme.titlebar_bg_focus = "#121212"

-- Colors
theme.bg_normal     = "#121212"
theme.bg_focus      = "#252525"
theme.bg_urgent     = "#121212"
theme.bg_minimize   = "#121212"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#777777"
theme.fg_focus      = "#fafafa"
theme.fg_urgent     = "#fffafa"
theme.fg_minimize   = "#080808"

theme.useless_gap         = dpi(5)
theme.border_width        = dpi(0)
theme.border_color_normal = "#dfdfdf"
theme.border_color_active = "#dfdfdf"
theme.border_color_marked = "#91231c"

-- Rightclick Menu
theme.menu_submenu_icon = themes_path.."default/submenu.png"
theme.menu_height = dpi(40)
theme.menu_width  = dpi(150)

-- Titlebar Icons
theme.titlebar_close_button_normal = themes_path.."icons/closenormal.svg"
theme.titlebar_close_button_focus  = themes_path.."icons/closeactive.svg"

-- I don't use this wtf
theme.layout_floating  = themes_path.."default/layouts/floatingw.png"
theme.layout_tile = themes_path.."default/layouts/tilew.png"

-- icon shit
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.fg_focus, theme.bg_focus
)

-- this shit nerdy af frfr
theme.icon_theme = nil

-- Set different colors for urgent notifications.
rnotification.connect_signal('request::rules', function()
    rnotification.append_rule {
        rule       = { urgency = 'critical' },
        properties = { bg = '#ff0000', fg = '#ffffff' }
    }
end)

return theme

--vim: filetype=lua:expandtab:shiftwidth=4:tabstop=4:softtabstop=4:textwidth=80
