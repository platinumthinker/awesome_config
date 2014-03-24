require("vicious")
local awful = require("awful")
awful.widget.tasklist = require("awful.widget.tasklist")
local wibox = require("wibox")
-- MPD
--local awesompd = require("modules.awesompd.awesompd")

---- Create awesompd widget
--musicwidget = awesompd:create() 
---- Set widget font 
--musicwidget.font = "DejaVu Sans Mono"
---- If true, the text in the widget will be scrolled
--musicwidget.scrolling = true
---- Set the size of widget in symbols
--musicwidget.output_size = 30
---- Set the update interval in seconds
--musicwidget.update_interval = 10
---- Set the folder where icons are located (change username to your login name)
--musicwidget.path_to_icons = awful.util.getdir("config") .. "/modules/awesompd/icons" 
---- Set the default music format for Jamendo streams. You can change
---- this option on the fly in awesompd itself.
---- possible formats: awesompd.FORMAT_MP3, awesompd.FORMAT_OGG
--musicwidget.jamendo_format = awesompd.FORMAT_OGG
---- If true, song notifications for Jamendo tracks and local tracks will also contain
---- album cover image.
--musicwidget.show_album_cover = true
---- Specify how big in pixels should an album cover be. Maximum value
---- is 100.
--musicwidget.album_cover_size = 50
---- This option is necessary if you want the album covers to be shown
---- for your local tracks.
--musicwidget.mpd_config = os.getenv("HOME") .. "/.mpd/config"
---- Specify the browser you use so awesompd can open links from
---- Jamendo in it.
--musicwidget.browser = "iceweasel"
---- Specify decorators on the left and the right side of the
---- widget. Or just leave empty strings if you decorate the widget
---- from outside.
--musicwidget.ldecorator = " "
--musicwidget.rdecorator = " "
---- Set all the servers to work with (here can be any servers you use)
--musicwidget.servers = {
   --{ server = "localhost",
        --port = 6600 },
   ----{ server = "192.168.0.72",
        ----port = 6600 } 
--}
---- Set the buttons of the widget
--musicwidget:register_buttons({ 
    --{ "", awesompd.MOUSE_LEFT, musicwidget:command_playpause() },
    --{ "Control", awesompd.MOUSE_SCROLL_UP, musicwidget:command_prev_track() },
    --{ "Control", awesompd.MOUSE_SCROLL_DOWN, musicwidget:command_next_track() },
    --{ "", awesompd.MOUSE_SCROLL_UP, musicwidget:command_volume_up() },
    --{ "", awesompd.MOUSE_SCROLL_DOWN, musicwidget:command_volume_down() },
    --{ "", awesompd.MOUSE_RIGHT, musicwidget:command_show_menu() },
    --{ "", "XF86AudioLowerVolume", musicwidget:command_volume_down() },
    --{ "", "XF86AudioRaiseVolume", musicwidget:command_volume_up() },
    --{ modkey, "Pause", musicwidget:command_playpause() } })
--musicwidget:run() -- After all configuration is done, run the widget

-- Grab environment we need
local capi = { screen = screen,
               client = client }

-- {{{ Wibox
-- Create a textclock widget
mytextclock = awful.widget.textclock()

-- Create mem usage widget
memwidget = wibox.widget.textbox()
vicious.cache(vicious.widgets.mem)
vicious.register(memwidget, vicious.widgets.mem, "|$1% ($2Mb/$3Mb)", 10)

-- Create cpu usage widget
cpuwidget = wibox.widget.textbox()
vicious.register(cpuwidget, vicious.widgets.cpu, " |$1%|", 60)

-- Create a wibox for each screen and add it
mywibox     = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist   = {}
mytasklist  = {}

for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which 
    -- layout we're using.  We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
        awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
        awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
        awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
        awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))

    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, 
        mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(s,
        awful.widget.tasklist.filter.focused, mytasklist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "top", height = "20", screen = s })
    -- Widgets that are aligned to the left
    local left_layout = wibox.layout.fixed.horizontal()
    left_layout:add(mylauncher)
    left_layout:add(mytaglist[s])
    left_layout:add(mypromptbox[s])

    -- Widgets that are aligned to the right
    local right_layout = wibox.layout.fixed.horizontal()
    right_layout:add(memwidget)
    right_layout:add(cpuwidget)
    --right_layout:add(musicwidget.widget)
    if s == 1 then right_layout:add(wibox.widget.systray()) end
    right_layout:add(mytextclock)
    right_layout:add(mylayoutbox[s])

    -- Now bring it all together (with the tasklist in the middle)
    local layout = wibox.layout.align.horizontal()
    layout:set_left(left_layout)
    layout:set_middle(mytasklist[s])
    layout:set_right(right_layout)

    mywibox[s]:set_widget(layout)
end
-- }}}

