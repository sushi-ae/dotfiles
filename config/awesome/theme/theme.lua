---------------------------
-- Default awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_configuration_dir() .. "theme/"

local theme = {}

theme.font          = "VictorMono Nerd Font Medium 11"

theme.bg_normal     = "#efefef"
theme.bg_focus      = "#efefef"
theme.bg_urgent     = "#efefef"
theme.bg_minimize   = "#444444"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#101010"
theme.fg_focus      = "#101010"
theme.fg_urgent     = "#101010"
theme.fg_minimize   = "#ffffff"

theme.useless_gap   = dpi(20)
theme.border_width  = dpi(0)
theme.border_normal = "#efefef"
theme.border_focus  = "#efefef"
theme.border_marked = "#91231c"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path.."default/submenu.png"
theme.menu_height = dpi(50)
theme.menu_width  = dpi(150)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = themes_path.."icons/inacsmall2.png"
theme.titlebar_close_button_focus  = themes_path.."icons/closesmall.png"

theme.titlebar_ontop_button_normal_inactive = themes_path.."icons/inac.png"
theme.titlebar_ontop_button_focus_inactive  = themes_path.."icons/ontop.png"
theme.titlebar_ontop_button_normal_active = themes_path.."icons/inac.png"
theme.titlebar_ontop_button_focus_active  = themes_path.."icons/ontop.png"

theme.titlebar_maximized_button_normal_inactive = themes_path.."icons/inac.png"
theme.titlebar_maximized_button_focus_inactive  = themes_path.."icons/max.png"
theme.titlebar_maximized_button_normal_active = themes_path.."icons/inac.png"
theme.titlebar_maximized_button_focus_active  = themes_path.."icons/max.png"

theme.wallpaper = themes_path.."walls/snowy.png"

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

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
