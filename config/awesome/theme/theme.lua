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
local themes_path = gfs.get_configuration_dir()..'theme/'

local theme = {}

theme.font          = "Lato SemiBold 10"

-- Values
theme.titlebar_height = dpi(45)
theme.titlebar_pos = "top"

-- Specific Colors
theme.titlebar_bg_normal = "#ffffff"
theme.titlebar_bg_focus = "#ffffff"

-- Colors
theme.bg_normal     = "#ffffff"
theme.bg_focus      = "#dfdfdf"
theme.bg_urgent     = "#fefefe"
theme.bg_minimize   = "#444444"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#0d0d0d"
theme.fg_focus      = "#0d0d0d"
theme.fg_urgent     = "#0d0d0d"
theme.fg_minimize   = "#080808"

theme.useless_gap         = dpi(5)
theme.border_width        = dpi(0)
theme.border_color_normal = "#0d0d0d"
theme.border_color_active = "#252525"
theme.border_color_marked = "#91231c"

-- Titlebar Buttons
theme.close_color = "#ff544d"
theme.ontop_color = "#feb429"
theme.max_color = "#24c138"
theme.inac_color = "#e3dadb"

-- Generate taglist squares:
local taglist_square_size = dpi(0)

-- Rightclick Menu
theme.menu_submenu_icon = themes_path.."default/submenu.png"
theme.menu_height = dpi(40)
theme.menu_width  = dpi(150)

-- Titlebar Icons
theme.titlebar_close_button_normal = gears.color.recolor_image(themes_path.."icons/titlebar/circle.svg", theme.inac_color)
theme.titlebar_close_button_focus  = gears.color.recolor_image(themes_path.."icons/titlebar/circle.svg", theme.close_color)

theme.titlebar_ontop_button_normal_inactive = gears.color.recolor_image(themes_path.."icons/titlebar/circle.svg", theme.inac_color)
theme.titlebar_ontop_button_focus_inactive  = gears.color.recolor_image(themes_path.."icons/titlebar/circle.svg", theme.ontop_color)
theme.titlebar_ontop_button_normal_active = gears.color.recolor_image(themes_path.."icons/titlebar/circle.svg", theme.inac_color)
theme.titlebar_ontop_button_focus_active  = gears.color.recolor_image(themes_path.."icons/titlebar/circle.svg", theme.ontop_color)

theme.titlebar_maximized_button_normal_inactive = gears.color.recolor_image(themes_path.."icons/titlebar/circle.svg", theme.inac_color)
theme.titlebar_maximized_button_focus_inactive  = gears.color.recolor_image(themes_path.."icons/titlebar/circle.svg", theme.max_color)
theme.titlebar_maximized_button_normal_active = gears.color.recolor_image(themes_path.."icons/titlebar/circle.svg", theme.inac_color)
theme.titlebar_maximized_button_focus_active  = gears.color.recolor_image(themes_path.."icons/titlebar/circle.scg", theme.max_color)

--theme.wallpaper = themes_path.."wallpapers/goofybeach.jpg"

-- You can use your own layout icons like this:
theme.layout_floating  = themes_path.."default/layouts/floatingw.png"
theme.layout_tile = themes_path.."default/layouts/tilew.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
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
