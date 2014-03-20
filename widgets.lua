require("vicious")
require("awful")
require("awful.widget.tasklist")
--local dmenu = require("modules/dmenu")

-- {{{ Wibox
-- Create a textclock widget
mytextclock = awful.widget.textclock({ align = "right" })

-- Create a systray
mysystray = widget({ type = "systray" })

-- Create battery widget
batwidget = widget({ type = "textbox" })
vicious.register(batwidget, vicious.widgets.bat, "$1$2%:$3|", 120, "BAT0")

-- Create cpu usage widget
cpuwidget = widget({ type = "textbox" })
vicious.register(cpuwidget, vicious.widgets.cpu, " |$1%|", 60)

-- Create dmenu for my favorite programm
--dmenu_favorite = dmenu({
        --iceweasel = "iceweasel",
        --gvim = "gvim",
        --pidgin = "pidgin",
        --pavucontrol = "pavucontrol"
    --})

-- Create a wibox for each screen and add it
mywibox = {}
--mywibox:set_widget(dmenu_favorite.textbox)
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}

mytasklist = {}
mytasklist = awful.widget.tasklist(function(c)
    local tmptask = { awful.widget.tasklist.label.currenttags(c, myscreen) }
    return tmptask[1], tmptask[2], tmptask[3], nil
end, mytasklist.buttons)
--mytasklist = awful.widget.tasklist(1, awful.widget.tasklist.filter.focused,{}, {})
for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt({ layout = awful.widget.layout.horizontal.leftright })
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.label.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(function(c)
                                              return awful.widget.tasklist.label.currenttags(c, s)
                                          end, mytasklist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "top", height = "20", screen = s })
    -- Add widgets to the wibox - order matters
    mywibox[s].widgets = {
        {
            mylauncher,
            mytaglist[s],
            mypromptbox[s],
            layout = awful.widget.layout.horizontal.leftright
        },
        mylayoutbox[s],
        mytextclock,
        batwidget,
        cpuwidget,
        s == 1 and mysystray or nil,
        mytasklist[s],
        layout = awful.widget.layout.horizontal.rightleft
    }
end
-- }}}

