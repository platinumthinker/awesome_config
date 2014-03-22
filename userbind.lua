local awful = require("awful")

command = table.concat(
    {
            "gmpc", 
            "gvim", 
            "pidgin",
            "skype"
    }, "\n") 

-- {{{ Key bindings
globalkeys = awful.util.table.join(globalkeys,
    awful.key({ modkey,         }, ",",
        function () awful.util.spawn("xbacklight -10") end),
    awful.key({ modkey,         }, ".",
        function () awful.util.spawn("xbacklight +10") end),
    awful.key({ modkey, "Shift" }, ",",
        function () awful.util.spawn("xbacklight -2") end),
    awful.key({ modkey, "Shift" }, ".",
        function () awful.util.spawn("xbacklight +2") end),
    awful.key({ modkey,         }, "g",
        function () awful.util.spawn("thunar") end),
    awful.key({ modkey,         }, "i",
        function () awful.util.spawn("iceweasel") end),
    awful.key({ modkey,         }, "d",
        function () awful.util.spawn("dmenu_run") end),
    awful.key({ modkey,         }, "s",
        function () awful.util.spawn("pavucontrol") end),
    awful.key({ modkey,         }, "a",
        function () awful.util.spawn("gvim") end)
)

