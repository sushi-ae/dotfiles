-------------------
-- awesome theme --
-------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local gcs = require("gears.color")
local gfs = require("gears.filesystem")
local themes_path = gfs.get_configuration_dir() .. "theme/"

local theme = {}

theme.font          = "Iosevka Nerd Font Medium 12"

-- Stuff
theme.tasklist_plain_task_name = true
theme.tasklist_disable_task_name = true

-- Colors
theme.bg_normal     = "#44475a"
theme.bg_focus      = "#dfdfdf"
theme.titlebar_bg_normal = "#44475a"
theme.titlebar_bg_focus  = "#44475a"
theme.tasklist_bg_focus  = theme.bg_normal
theme.bg_urgent     = "#fefefe"
theme.bg_minimize   = "#fefefe"
theme.bg_systray    = theme.bg_normal
theme.fg_focus      = "#dfdfdf"
theme.bg_focus      = "#44475a"
theme.textclock_fg  = "#c5d5e1"
theme.accent2       = "#dfdfdf"
theme.accent3       = "#c5d5e1"

theme.taglist_bg_focus  = theme.accent2
theme.taglist_fg_focus  = theme.bg_normal
theme.fg_normal     = "#101010"
theme.fg_focus      = "#101010"
theme.fg_urgent     = "#101010"
theme.fg_minimize   = "#101010"
theme.fg_focus      = "#ffffff"
theme.useless_gap   = dpi(20)
theme.border_width  = dpi(0)
theme.border_normal = "#fefefe"
theme.border_focus  = "#dfdfdf"
theme.border_marked = "#91231c"

local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.textclock_fg
)

theme.menu_submenu_icon = themes_path.."default/submenu.png"
theme.menu_height = dpi(40)
theme.menu_width  = dpi(180)

-- Titlebar Button Icons
theme.titlebar_close_button_normal = themes_path.."icons/inac.png"
theme.titlebar_close_button_focus  = themes_path.."icons/close.png"

theme.titlebar_ontop_button_normal_inactive = themes_path.."icons/inac.png"
theme.titlebar_ontop_button_focus_inactive  = themes_path.."icons/ontop.png"
theme.titlebar_ontop_button_normal_active = themes_path.."icons/inac.png"
theme.titlebar_ontop_button_focus_active  = themes_path.."icons/top.png"

theme.titlebar_maximized_button_normal_inactive = themes_path.."icons/inac.png"
theme.titlebar_maximized_button_focus_inactive  = themes_path.."icons/max.png"
theme.titlebar_maximized_button_normal_active = themes_path.."icons/inac.png"
theme.titlebar_maximized_button_focus_active  = themes_path.."icons/max.png"
theme.titlebar_floating_button_normal_inactive = themes_path.."default/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = themes_path.."default/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = themes_path.."default/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = themes_path.."default/titlebar/floating_focus_active.png"
theme.wallpaper = themes_path.."Wallpaper/background.png"

-- Layout Icons
theme.layout_floating  = themes_path.."icons/floating.png"
theme.layout_tile = themes_path.."icons/tile.png"

-- Idek
theme.taglist_squares_sel = "none.png"
theme.taglist_squares_unsel = "non.png"
theme.taglist_spacing = 13

-- Awesome Icon
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.accent3, theme.bg_normal
)
theme.icon_theme = nil
return theme
