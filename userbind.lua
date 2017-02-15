local awful = require("awful")

dmenu = "dmenu_run -fn 'DejaVu Mono-11:normal' -nb '#002b36' -nf '#657b83' -sb '#002b36' -sf '#fdce59'"

-- {{{ User key bindings
globalkeys = awful.util.table.join(globalkeys,
    awful.key({ modkey,         }, "g",
        function () awful.util.spawn("thunar") end),
    awful.key({ modkey,         }, "i",
        function () awful.util.spawn("firefox") end),
    awful.key({ modkey,         }, "d",
        function () awful.util.spawn(dmenu) end),
    awful.key({ modkey, "Shift" }, "w",
        function ()
            awful.util.spawn(awful.util.getdir("config") ..
                "/scripts/winlist.sh ")
        end),
    awful.key({ modkey,         }, "w",
        function ()
            awful.util.spawn(awful.util.getdir("config") ..
                "/scripts/winctl.sh ")
        end),
    awful.key({ modkey,         }, "p",
        function () awful.util.spawn("xfce4-appfinder") end),
    awful.key({ modkey,         }, "s",
        function () awful.util.spawn("pavucontrol") end),
    awful.key({ modkey,         }, "e",
        function () awful.util.spawn("gvim") end),
    awful.key({ modkey,         }, "b",
        function () awful.util.spawn("./scripts/lock.sh") end)
)
-- }}}
