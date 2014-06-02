local awful = require("awful")

command = table.concat(
    {
            "gmpc", 
            "gvim", 
            "sylpheed",
            "pidgin",
            "skype"
    }, " ") 
dmenu = "dmenu_run -fn 'DejaVu Mono-10:normal' -nb '#002b36' -nf\
    '#657b83' -sb '#002b36' -sf '#fdce59'"
-- {{{ Key bindings
globalkeys = awful.util.table.join(globalkeys,
    awful.key({ modkey,         }, "g",
        function () awful.util.spawn("thunar") end),
    awful.key({ modkey,         }, "i",
        function () awful.util.spawn("x-www-browser") end),
    awful.key({ modkey,         }, "d",
        function () awful.util.spawn(dmenu) end),
    awful.key({ modkey, "Shift" }, "d",
        function () 
            awful.util.spawn(awful.util.getdir("config") ..
                "/scripts/dmenu.sh " .. command) 
        end),
    awful.key({ modkey,         }, "p",
        function () awful.util.spawn("xfce4-appfinder") end),
    awful.key({ modkey,         }, "s",
        function () awful.util.spawn("pavucontrol") end),
    awful.key({ modkey,         }, "a",
        function () awful.util.spawn("gvim") end),
    awful.key({ modkey, "Ctrl"  }, "l", function () awful.util.spawn("slock") end)
)
-- }}}
