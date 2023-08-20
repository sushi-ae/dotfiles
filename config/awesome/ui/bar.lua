local awful = require'awful'
local beautiful = require'beautiful'
local wibox = require'wibox'

local dpi = beautiful.xresources.apply_dpi

local cairo = require("lgi").cairo

local helpers require'config.helpers'
local apps = require'config.apps'
   
local awesomemenu = {
   {'reload', awesome.restart},
   {'end', awesome.quit},
}

local mainmenu = awful.menu{
   items = {
      {'awesome', awesomemenu},
      {'files', apps.files},
      {'browser', apps.browser},
      {'wallpaper', apps.nitrogen},
      {'terminal', apps.terminal}
   }
}

local cloc = wibox.widget {
    {
        format = '%I:%M PST',
        widget = wibox.widget.textclock
    },
    bg = beautiful.bg_normal,
    fg = beautiful.fg_focus,
    widget = wibox.container.background
}

local launcher = awful.widget.launcher{
   image = beautiful.awesome_icon,
   menu = mainmenu
}

screen.connect_signal('request::desktop_decoration', function(s)

s.taglist = awful.widget.taglist {
    screen = s,
    filter  = awful.widget.taglist.filter.all,
    widget_template = {
        {
            {
                id = "text_role",
                widget = wibox.widget.textbox
            },
            margins = {left = dpi(3), right = dpi(13),top = dpi(2),bottom = dpi(2)},
            widget = wibox.container.margin
        },
        layout = wibox.layout.align.horizontal
    },
}

s.tasklist = awful.widget.tasklist {
        screen  = s,
        --style = { shape = helpers.rrect(dpi(4)) },
        filter  = awful.widget.tasklist.filter.currenttags,
		widget_template = {
			{
                {
                    {
                        {
                            id = "text_role",
                            forced_width = dpi(150),
                            widget = wibox.widget.textbox,
                        },
                        margins = { right = dpi(15) },
                        widget = wibox.container.margin,
                    },
                    layout = wibox.layout.align.horizontal
                },
				halign = "center",
				widget = wibox.container.place
			},
			id     = "background_role",
			widget = wibox.container.background
    	},
        buttons = {
            awful.button({ }, 1, function (c)
                c:activate { context = "tasklist", action = "toggle_minimization" }
            end)
        },
}

s.mainbar = awful.wibar({
    screen = s,
    position = "top",
    height = dpi(45),
    stretch = false,
    margins = { top = dpi(10) },
    width = dpi(1000),

-- bar config
}):setup {
        {
            launcher,
            systray,
            margins = dpi(12),
            widget = wibox.container.margin
        },
        {
            s.tasklist,
            margins = dpi(11),
            widget = wibox.container.margin
        },
        {
            s.taglist,
            margins = 10,
            widget = wibox.container.margin
        },
        layout = wibox.layout.align.horizontal
    }


end)
