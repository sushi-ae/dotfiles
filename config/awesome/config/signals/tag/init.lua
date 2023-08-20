local awful = require'awful'

screen.connect_signal('request::desktop_decoration', function(s)

    tag.connect_signal('request::default_layouts', function()
        awful.layout.append_default_layouts({
            awful.layout.suit.floating, 
            awful.layout.suit.tile,
        })
    end)

    awful.tag({"一","二","三","四"}, s , awful.layout.layouts[1])

end)
