local awful = require("awful")
awful.rules = require("awful.rules")
local beautiful = require("beautiful")

-- {{{ Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     keys = clientkeys,
                     buttons = none} },
    { rule = { class = "MPlayer" },
      properties = { floating = true } },
    { rule = { class = "pinentry" },
      properties = { floating = true } },
    { rule = { class = "gimp" },
      properties = { floating = true } },
      -- For browser
    { rule = { class = "Iceweasel" },
      properties = { tag = tags[1][2] } },
      -- For Pidgin
    { rule = { class = "Pidgin", role = "buddy_list" },
    properties = {switchtotag = true, floating=true,
                  maximized_vertical=true, maximized_horizontal=false },
    callback = function (c)
        local cl_width = 250    -- width of buddy list window
        local def_left = true   -- default placement. note: you have to restart
                                -- pidgin for changes to take effect

        local scr_area = screen[c.screen].workarea
        local cl_strut = c:struts()
        local geometry = nil

        -- adjust scr_area for this client's struts
        if cl_strut ~= nil then
            if cl_strut.left ~= nil and cl_strut.left > 0 then
                geometry = {x=scr_area.x-cl_strut.left, y=scr_area.y,
                            width=cl_strut.left}
            elseif cl_strut.right ~= nil and cl_strut.right > 0 then
                geometry = {x=scr_area.x+scr_area.width, y=scr_area.y,
                            width=cl_strut.right}
            end
        end
        -- scr_area is unaffected, so we can use the naive coordinates
        if geometry == nil then
            if def_left then
                c:struts({left=cl_width, right=0})
                geometry = {x=scr_area.x, y=scr_area.y,
                            width=cl_width}
            else
                c:struts({right=cl_width, left=0})
                geometry = {x=scr_area.x+scr_area.width-cl_width, y=scr_area.y,
                            width=cl_width}
            end
        end
        c:geometry(geometry)
    end },
    { rule = { class = "Pidgin", role = "conversation"},
      properties = { tag = tags[1][1] }, 
      callback = awful.client.setslave}
}
-- }}}

