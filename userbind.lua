local awful = require("awful")

-- {{{ User key bindings
globalkeys = awful.util.table.join(globalkeys,
    awful.key({ modkey,         }, "g",
        function () awful.spawn("thunar") end,
        {description="file explorer", group = "user"}),
    awful.key({ modkey,         }, "i",
        function () awful.spawn("firefox") end,
        {description="web browser", group = "user"}),
    awful.key({ modkey,         }, "d",
        function () awful.spawn("rofi -show run -matching fuzzy") end,
        {description="run program", group = "user"}),
    awful.key({ modkey,         }, "w",
        function () awful.spawn("rofi -show window -matching fuzzy") end,
        {description="switch to windows", group = "user"}),
    awful.key({ modkey,         }, "s",
        function () awful.spawn("pavucontrol") end,
        {description="sound control", group = "user"}),
    awful.key({ modkey,         }, "b",
        function () awful.spawn("slock") end,
        {description="lock PC", group = "user"})
)
-- }}}
