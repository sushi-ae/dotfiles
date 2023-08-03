local _M = {}

local awful = require'awful'
local hotkeys_popup = require'awful.hotkeys_popup'
local beautiful = require'beautiful'
local dpi = beautiful.xresources.apply_dpi
local wibox = require'wibox'

local gears = require'gears'

-- cairo (whatever this is)
local cairo = require("lgi").cairo

local apps = require'config.apps'
local mod = require'bindings.mod'

_M.awesomemenu = {
   {'reload', awesome.restart},
   {'end', awesome.quit},
}

_M.mainmenu = awful.menu{
   items = {
      {'awesome', _M.awesomemenu},
      {'files', apps.files},
      {'browser', apps.browser},
      {'', wibox.widget.separator},
      {'wallpaper', apps.nitrogen},
      {'terminal', apps.terminal}
   }
}

_M.launcher = awful.widget.launcher{
   image = beautiful.awesome_icon,
   menu = _M.mainmenu
}

_M.cloc = wibox.widget {
    {
        format = '%I:%M PST',
        widget = wibox.widget.textclock
    },
    bg = beautiful.bg_normal,
    fg = beautiful.fg_focus,
    widget = wibox.container.background
}

_M.sushi = wibox.widget {
    image = beautiful.sushi_img,
    resize = true,
    widget = wibox.widget.imagebox
}


function _M.create_promptbox() return awful.widget.prompt() end

function _M.create_layoutbox(s)
   return awful.widget.layoutbox{
      screen = s,
      buttons = {
         awful.button{
            modifiers = {},
            button    = 1,
            on_press  = function() awful.layout.inc(1) end,
         },
         awful.button{
            modifiers = {},
            button    = 3,
            on_press  = function() awful.layout.inc(-1) end,
         },
         awful.button{
            modifiers = {},
            button    = 4,
            on_press  = function() awful.layout.inc(-1) end,
         },
         awful.button{
            modifiers = {},
            button    = 5,
            on_press  = function() awful.layout.inc(1) end,
         },
      }
   }
end

function _M.create_taglist(s)
   return awful.widget.taglist{
      screen = s,
      filter = awful.widget.taglist.filter.all,
      buttons = {
         awful.button{
            modifiers = {},
            button    = 1,
            on_press  = function(t) t:view_only() end,
         },
         awful.button{
            modifiers = {mod.super},
            button    = 1,
            on_press  = function(t)
               if client.focus then
                  client.focus:move_to_tag(t)
               end
            end,
         },
         awful.button{
            modifiers = {},
            button    = 3,
            on_press  = awful.tag.viewtoggle,
         },
         awful.button{
            modifiers = {mod.super},
            button    = 3,
            on_press  = function(t)
               if client.focus then
                  client.focus:toggle_tag(t)
               end
            end
         },
         awful.button{
            modifiers = {},
            button    = 4,
            on_press  = function(t) awful.tag.viewprev(t.screen) end,
         },
         awful.button{
            modifiers = {},
            button    = 5,
            on_press  = function(t) awful.tag.viewnext(t.screen) end,
         },
      }
   }
end

function _M.create_tasklist(s)
   return awful.widget.tasklist{
      screen = s,
      filter = awful.widget.tasklist.filter.currenttags,
      buttons = {
         awful.button{
            modifiers = {},
            button    = 1,
            on_press  = function(c)
               c:activate{context = 'tasklist', action = 'toggle_minimization'}
            end,
         },
         awful.button{
            modifiers = {},
            button    = 3,
            on_press  = function() awful.menu.client_list{theme = {width = 250}}   end,
         },
         awful.button{
            modifiers = {},
            button    = 4,
            on_press  = function() awful.client.focus.byidx(-1) end
         },
         awful.button{
            modifiers = {},
            button    = 5,
            on_press  = function() awful.client.focus.byidx(1) end
         },
      }
   }
end

function _M.create_wibox(s)
    local wb = awful.wibar { 
        position = beautiful.bar_pos,
        height = beautiful.bar_height,
        width = dpi(105),
        margins = { right = dpi(1320), bottom = dpi(10) }, 
    }

    wb:setup {
        layout = wibox.layout.align.horizontal,
        {
            {
                {
                    _M.launcher,
                    shape = function(cr,width,height)
                        gears.shape.rounded_rect(cr,width,height,2)
                    end,
                    widget = wibox.container.background
                },
                margins = dpi(7),
                widget = wibox.container.margin
            },
	        {
                _M.cloc,
		        margins = {top = dpi(1), left = dpi(3)},
		        widget = wibox.container.margin
            },
            layout = wibox.layout.fixed.horizontal,
        },
    }
end

return _M
