local awful = require("awful")
awful.rules = require("awful.rules")
local beautiful = require("beautiful")

-- {{{ Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = {
          border_width = beautiful.border_width,
          border_color = beautiful.border_normal,
          focus = awful.client.focus.filter,
          raise = true,
          keys = clientkeys,
          buttons = clientbuttons,
          screen = awful.screen.preferred,
          placement = awful.placement.no_overlap+awful.placement.no_offscreen
      }
    },
      --For fullscreen apps
    -- { rule_any = { class = {"gimp", "vlc" } },
    --   properties = { floating = true } },
      -- For browser
    { rule_any = { class = {"Iceweasel", "Chromium", "Firefox"} },
      properties = { screen = 1, tag = "2:www" } },
    -- Floating clients.
    { rule_any = {
        instance = {
          "DTA",  -- Firefox addon DownThemAll.
          "copyq",  -- Includes session name in class.
        },
        class = {
          "Arandr",
          "Gpick",
          "Kruler",
          "MessageWin",  -- kalarm.
          "Sxiv",
          "Wpa_gui",
          "pinentry",
          "veromix",
          "xtightvncviewer"},

        name = {
          "Event Tester",  -- xev.
        },
        role = {
          "AlarmWindow",  -- Thunderbird's calendar.
          "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
        }
      }, properties = { floating = true }},
    -- Add titlebars to normal clients and dialogs
    { rule_any = {type = { "normal", "dialog" }
      }, properties = { titlebars_enabled = true }
    },
      -- For Pidgin
    { rule = { class = "Pidgin", role = "buddy_list" },
      properties = { tag = "1:im", screen = 1,
                     switchtotag = true },
      callback = awful.client.setmaster },
    { rule = { class = "Pidgin",
               role = "conversation"},
      properties = { tag = "1:im", screen = 1,
                     titlebars_enabled = false },
      callback = awful.client.setslave },
}
-- }}}

