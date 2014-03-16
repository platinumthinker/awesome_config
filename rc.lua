-- Standard awesome library
awful = require("awful")
require("awful.autofocus")
-- Theme handling library
require("beautiful")
-- Notification library
require("naughty")
--Hide unused tags
require("modules/eminent")

awful.util.spawn_with_shell("wmname LG3D")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.add_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = err })
        in_error = false
    end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, and wallpapers
beautiful.init( awful.util.getdir("config") .. "/themes/awesome-solarized/dark/theme.lua" )
theme.wallpapers_cmd = {}
theme.font = "xdt:DejaVu Sans Mono for Powerline 8"
-- Themes for notifications
naughty.config.default_preset.font = beautiful.notify_font
naughty.config.default_preset.fg = beautiful.notify_fg
naughty.config.default_preset.bg = beautiful.notify_bg
naughty.config.presets.normal.border_color = beautiful.notify_border
naughty.config.presets.normal.opacity = 0.8
naughty.config.presets.low.opacity = 0.8
naughty.config.presets.critical.opacity = 0.8
---}}}


terminal = "lxterm"
editor = os.getenv("EDITOR") or "editor"
editor_cmd = terminal .. " -e " .. editor

modkey = "Mod4"

require("layouts")
require("menu")
require("widgets")

-- Set keys
require("bindings")
require("userbind")
root.keys(globalkeys)
-- }}}

require("rules")

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.add_signal("manage", function (c, startup)
    -- Add a titlebar
    -- awful.titlebar.add(c, { modkey = modkey })

    -- Enable sloppy focus
    c:add_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end
end)

client.add_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.add_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}
