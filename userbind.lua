local awful = require("awful")

-- {{{ User key bindings
globalkeys = awful.util.table.join(globalkeys,
    awful.key({ modkey,         }, "g",
        function () awful.spawn("thunar") end),
    awful.key({ modkey,         }, "i",
        function () awful.spawn("firefox") end),
    awful.key({ modkey,         }, "d",
        function ()
            awful.spawn(awful.util.getdir("config") ..
                "/scripts/dmenu_run.sh ")
        end),
    awful.key({ modkey, "Shift" }, "w",
        function ()
            awful.spawn(awful.util.getdir("config") ..
                "/scripts/winlist.sh ")
        end),
    awful.key({ modkey,         }, "w",
        function ()
            awful.spawn(awful.util.getdir("config") ..
                "/scripts/winctl.sh ")
        end),
    awful.key({ modkey,         }, "p",
        function () awful.spawn("xfce4-appfinder") end),
    awful.key({ modkey,         }, "s",
        function () awful.spawn("pavucontrol") end),
    awful.key({ modkey,         }, "e",
        function () awful.spawn("gvim") end),
    awful.key({ modkey,         }, "b",
        function () awful.spawn("./scripts/lock.sh") end)
)
-- }}}
