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
    { rule_any = {type = { "normal", "dialog" }},
      except_any = {
        class = {
            "Xfce4-terminal",
            "xterm",
            "Gnome-terminal",
            "lxterminal",
            "Pidgin",
            "firefox",
            "Firefox-esr",
            "Nightly",
            "Navigator",
            "iceweasel",
            "chrome",
            "chromium",
            "google-chrome",
            "konsole",
            "discord",
            "Mattermost",
            "telegram",
            "telegram-desktop",
            "TelegramDesktop",
            "Thunderbird"
        }
      }, properties = { titlebars_enabled = true }
    },
    { rule_any = {
        class = {
            "discord",
            "telegram",
            "telegram-desktop",
            "TelegramDesktop",
            "Mattermost"
        }
      }, properties = { tag = "1:im", screen = 1 }
    },
    { rule = { class = "firefox" },
      properties = { tag = "2:www", screen = 1 } },
    { rule = { class = "Nightly" },
      properties = { tag = "2:www", screen = 1 } },
    { rule = { class = "chrome" },
      properties = { tag = "2:www", screen = 1 } },
    { rule = { class = "chromium" },
      properties = { tag = "2:www", screen = 1 } },
    { rule = { class = "Thunderbird" },
      properties = { tag = "8:mail", screen = 1 } },
      -- For Pidgin
    { rule = { class = "Pidgin", role = "buddy_list" },
      properties = { tag = "1:im", screen = 1, switchtotag = true },
      callback = awful.client.setmaster },
    { rule = { class = "firefox" },
      properties = { tag = "2:www", screen = 1 } },
    { rule = { class = "xfce4-terminal" },
      properties = { tag = "3:code", screen = 1 } },
    { rule = { class = "Pidgin",
               role = "conversation"},
      properties = { tag = "1:im", screen = 1, switchtotag = true },
      callback = awful.client.setslave },
}
-- }}}

