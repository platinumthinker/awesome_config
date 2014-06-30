local awful = require("awful")
--local shifty = require("shifty")

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

shifty.config.tags = {
    ["1:im"] = {
        layout    = awful.layout.suit.fair,
        mwfact    = 0.60,
        --exclusive = false,
        position  = 1,
        init      = true,
        persist   = true,
        slave     = true,
    },
    ["2:www"] = {
        layout      = awful.layout.suit.tile,
        mwfact      = 0.65,
        --exclusive   = true,
        max_clients = 2,
        position    = 4,
        spawn       = browser,
    },
    ["3:code"] = {
        layout    = awful.layout.suit.tile,
        mwfact    = 0.55,
        --exclusive = false,
        position  = 3,
        spawn     = mail,
        slave     = true
    },
    ["8:music"] = {
        layout    = awful.layout.suit.tile,
        --exclusive = false,
        position  = 8,
    },
    ["9:cal"] = {
        layout   = awful.layout.suit.tile,
        position = 9,
    },
}
-- {{{ Tags
-- Define a tag table which hold all screen tags.
--tags = {
   --names  = { "1:im", 
              --"2:www",
              --"3:code",
              --"4:code",
              --"5:myc",
              --"6:ds",
              --"7:cocon",
              --"8:music",
              --"9:cal" },
   --layout = { awful.layout.suit.fair, -- 1)
              --awful.layout.suit.tile, -- 2)
              --awful.layout.suit.tile, -- 3)
              --awful.layout.suit.tile, -- 4)
              --awful.layout.suit.tile, -- 5)
              --awful.layout.suit.tile, -- 6)
              --awful.layout.suit.tile, -- 7)
              --awful.layout.suit.tile, -- 8)
              --awful.layout.suit.tile  -- 9)
--}}

--for s = 1, screen.count() do
    ---- Each screen has its own tag table.
    --tags[s] = awful.tag(tags.names, s, tags.layout)
    ---- For Pidgin IM
    --awful.tag.setncol(2, tags[s][1])
    --awful.tag.setnmaster (1, tags[s][1])
--end

-- SHIFTY: application matching rules
-- order here matters, early rules will be applied first
shifty.config.apps = {
    {
        match = {
            "Navigator",
            "Vimperator",
            "Gran Paradiso",
        },
        tag = "web",
    },
    {
        match = {
            "Shredder.*",
            "Thunderbird",
            "mutt",
        },
        tag = "mail",
    },
    {
        match = {
            "pcmanfm",
        },
        slave = true
    },
    {
        match = {
            "OpenOffice.*",
            "Abiword",
            "Gnumeric",
        },
        tag = "office",
    },
    {
        match = {
            "Mplayer.*",
            "Mirage",
            "gimp",
            "gtkpod",
            "Ufraw",
            "easytag",
        },
        tag = "media",
        nopopup = true,
    },
    {
        match = {
            "MPlayer",
            "Gnuplot",
            "galculator",
        },
        float = true,
    },
    {
        match = {
            terminal,
        },
        honorsizehints = false,
        slave = true,
    },
    {
        match = {""},
        buttons = awful.util.table.join(
            awful.button({}, 1, function (c) client.focus = c; c:raise() end),
            awful.button({modkey}, 1, function(c)
                client.focus = c
                c:raise()
                awful.mouse.client.move(c)
                end),
            awful.button({modkey}, 3, awful.mouse.client.resize)
            )
    },
}

shifty.config.defaults = {
    layout = awful.layout.suit.tile.bottom,
    ncol = 1,
    mwfact = 0.60,
    floatBars = true,
    guess_name = true,
    guess_position = true,
}
-- }}}
