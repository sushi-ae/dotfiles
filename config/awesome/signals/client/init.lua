local awful = require'awful'
local xres = require("beautiful.xresources")
local dpi = xres.apply_dpi
local beautiful = require'beautiful'
require'awful.autofocus'
local wibox = require'wibox'
local margin = wibox.container.margin

client.connect_signal('mouse::enter', function(c)
   c:activate{context = 'mouse_enter', raise = false}
end)

client.connect_signal('request::titlebars', function(c)
   -- buttons for the titlebar
   local buttons = {
      awful.button{
         modifiers = {},
         button    = 1,
         on_press  = function()
            c:activate{context = 'titlebar', action = 'mouse_move'}
         end
      },
      awful.button{
         modifiers = {},
         button    = 3,
         on_press  = function()
            c:activate{context = 'titlebar', action = 'mouse_resize'}
         end
      },
   }
	
   local top_titlebar = awful.titlebar(c, {size = beautiful.titlebar_height, position = beautiful.titlebar_pos})

   top_titlebar:setup {
      -- left
      {
	     {
	     --{
		 --{awful.titlebar.widget.closebutton(c), left = 0, widget = margin},
		 --{awful.titlebar.widget.maximizedbutton(c), top = 4, widget = margin},
		 --layout = wibox.layout.align.vertical
	     --},
         {
             {
                align = 'center',
                widget = awful.titlebar.widget.titlewidget(c)
             },
             direction = 'north',
             widget = wibox.container.rotate
         },
	     margins = 10,
	     widget = margin
	    },
         --buttons = buttons,
         layout  = wibox.layout.flex.horizontal(),
      },
      -- middle
      {
         -- title
         {
	        --{
            	--align = 'center',
            	--widget = awful.titlebar.widget.titlewidget(c),
            --},
	        bottom = dpi(3),
	        widget = wibox.container.margin
         },
         buttons = buttons,
         layout  = wibox.layout.flex.horizontal,
      },
      -- right
      {
	 --{
	     --{
		 --    awful.titlebar.widget.iconwidget(c),
	     --    layout = wibox.layout.fixed.horizontal
	     --},
	     --margins = dpi(12),
	     --widget = margin
	 --},
	 buttons = buttons,
         layout = wibox.layout.fixed.horizontal()
      },
      layout = wibox.layout.align.horizontal,
   }
   --awful.titlebar(c, {position = "top", size = dpi(2)})
   --awful.titlebar(c, {position = "bottom", size = dpi(2)})
   --awful.titlebar(c, {position = "left", size = dpi(2)})
   --awful.titlebar(c, {position = "right", size = dpi(2)})
end)
