---------------------------
-- Default awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_configuration_dir() .. "theme/"

local theme = {}

theme.font          = "Iosevka Nerd Font Bold 10"

-- Number Stuff
theme.titlebar_height = dpi(36)
theme.bar_height      = dpi(40)
theme.titlebar_button_spacing = dpi(5)

-- Specific Colors
theme.taglist_bg_focus  = "#ffffff"
theme.taglist_fg_normal = "#dddddd"
theme.taglist_fg_focus  = "#999999"

theme.titlebar_bg_focus = "#101010"
theme.titlebar_bg_normal = "#101010"

-- Main Colors
theme.bg_normal     = "#101010"
theme.bg_focus      = "#161616"
theme.bg_urgent     = "#101010"
theme.bg_minimize   = "#161616"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#ffffff"
theme.fg_focus      = "#ffffff"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"

theme.useless_gap   = dpi(5)
theme.border_width  = dpi(0)
theme.border_normal = "#efefef"
theme.border_focus  = "#ffffff"
theme.border_marked = "#efefef"

-- Taglist Squares
local taglist_square_size = dpi(0)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

theme.menu_submenu_icon = themes_path.."default/submenu.png"
theme.menu_height = dpi(50)
theme.menu_width  = dpi(150)

-- Define the image to load
theme.titlebar_close_button_normal = themes_path.."icons/inac.png"
theme.titlebar_close_button_focus  = themes_path.."icons/close.png"

theme.titlebar_ontop_button_normal_inactive = themes_path.."icons/inac.png"
theme.titlebar_ontop_button_focus_inactive  = themes_path.."icons/ontop.png"
theme.titlebar_ontop_button_normal_active = themes_path.."icons/inac.png"
theme.titlebar_ontop_button_focus_active  = themes_path.."icons/ontop.png"

theme.titlebar_maximized_button_normal_inactive = themes_path.."icons/inac.png"
theme.titlebar_maximized_button_focus_inactive  = themes_path.."icons/max.png"
theme.titlebar_maximized_button_normal_active = themes_path.."icons/inac.png"
theme.titlebar_maximized_button_focus_active  = themes_path.."icons/max.png"

theme.wallpaper = themes_path.."walls/absolutelynothing.jpeg"

-- You can use your own layout icons like this:
theme.layout_floating  = themes_path.."default/layouts/floatingw.png"
theme.layout_tile = themes_path.."default/layouts/tilew.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.fg_focus, theme.bg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
