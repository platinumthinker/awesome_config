local awful = require("awful")
-- Notification library
local naughty = require("naughty")

-- {{{ User key bindings
globalkeys = awful.util.table.join(globalkeys,
    awful.key({ modkey,         }, "g",
        function () awful.spawn("thunar") end,
        {description="file explorer", group = "user"}),
    awful.key({ modkey,         }, "i",
        function () awful.spawn("firefox") end,
        {description="web browser", group = "user"}),
    awful.key({ modkey,         }, "d",
        function () awful.spawn("zsh -c 'PATH=$PATH:$HOME/bin:$HOME/.dotfiles/scripts rofi -show run -matching fuzzy'") end,
        {description="run program", group = "user"}),
    awful.key({ modkey,         }, "w",
        function () awful.spawn("rofi -show window -matching fuzzy") end,
        {description="switch to windows", group = "user"}),
    awful.key({ modkey,         }, "x",
        function () awful.spawn("/home/ate/.dotfiles/scripts/rofi-kill") end,
        {description="find and kill program", group = "user"}),
    awful.key({ modkey,         }, "b",
        function () awful.spawn("slock") end,
        {description="lock PC", group = "user"}),
    awful.key({ modkey, "Shift" }, "p",
        function ()
            naughty.toggle()
        end,
        {description="kill first notification", group = "user"}),
    awful.key({ modkey,         }, "a",
        function () awful.spawn("sh -c 'CM_LAUNCHER=rofi clipmenu'") end,
        {description="clipboard manager", group = "user"}),
    awful.key({ modkey,         }, "s",
        function () awful.spawn("pavucontrol") end,
        {description="sound control", group = "volume"}),
    awful.key({}, "XF86AudioRaiseVolume",
        function () awful.util.spawn("pactl set-sink-volume @DEFAULT_SINK@ +1%", false) end,
        {description="volume up", group = "volume"}),
    awful.key({}, "XF86AudioLowerVolume",
        function () awful.util.spawn("pactl set-sink-volume @DEFAULT_SINK@ -1%", false) end,
        {description="volume down", group = "volume"}),
    awful.key({}, "XF86AudioMute",
        function () awful.util.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle", false) end,
        {description="audio mute", group = "volume"}),
    awful.key({}, "XF86AudioMicMute",
        function () awful.util.spawn("pactl set-source-mute @DEFAULT_SOURCE@ toggle", false) end,
        {description="mic mute", group = "volume"})
)
-- }}}
