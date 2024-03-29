local awful = require("awful")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts =
{
    -- awful.layout.suit.corner.nw,
    awful.layout.suit.tile,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.fair,
    -- awful.layout.suit.fair.horizontal,
    -- awful.layout.suit.spiral.dwindle
    awful.layout.suit.max
    -- awful.layout.suit.magnifier
}
-- }}}

-- {{{ Tags
-- Define a tag table which hold all screen tags.
tags = {
   names  = { "1:im",
              "2:www",
              "3:code",
              "4:code",
              "5:test",
              "6:test",
              "7:ssh",
              "8:mail",
              "9:music" },
   layout = { awful.layout.suit.max, -- 1)
              awful.layout.suit.max, -- 2)
              awful.layout.suit.tile, -- 3)
              awful.layout.suit.tile, -- 4)
              awful.layout.suit.tile, -- 5)
              awful.layout.suit.tile, -- 6)
              awful.layout.suit.tile, -- 7)
              awful.layout.suit.tile, -- 8)
              awful.layout.suit.tile  -- 9)
}}

local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

    -- For Pidgin IM
    if s == 1 then
        awful.tag.setnmaster (1, tags[s][1])
        awful.tag.setncol(3, tags[s][1])
    end

    -- Each screen has its own tag table.
    tags[s] = awful.tag(tags.names, s, tags.layout)

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, taglist_buttons)

end)
-- }}}
