local awful = require("awful")

-- Table of layouts to cover with awful.layout.inc, order matters.
layouts =
{
    --awful.layout.suit.floating,
    awful.layout.suit.tile,
    --awful.layout.suit.tile.left,
    --awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    --awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral,
    --awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max
    --awful.layout.suit.max.fullscreen,
    --awful.layout.suit.magnifier
}
-- }}}

-- {{{ Tags
-- Define a tag table which hold all screen tags.
tags = {
   names  = { "1:im", 
              "2:www",
              "3",
              "4",
              "5",
              "6",
              "7",
              "8",
              "9" },
   layout = { awful.layout.suit.fair, -- 1)
              awful.layout.suit.tile, -- 2)
              awful.layout.suit.tile, -- 3)
              awful.layout.suit.tile, -- 4)
              awful.layout.suit.tile, -- 5)
              awful.layout.suit.tile, -- 6)
              awful.layout.suit.tile, -- 7)
              awful.layout.suit.tile, -- 8)
              awful.layout.suit.tile  -- 9)
}}

for s = 1, screen.count() do
    -- Each screen has its own tag table.
    tags[s] = awful.tag(tags.names, s, tags.layout)
    -- For Pidgin IM
    awful.tag.setncol(2, tags[s][1])
    awful.tag.setnmaster (1, tags[s][1])
end

-- }}}
