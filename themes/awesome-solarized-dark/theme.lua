---------------------------------
--  "Solarized" awesome theme  --
--     By Gwenhael Le Moine    --
---------------------------------

-- Alternative icon sets and widget icons:
--  * http://awesome.naquadah.org/wiki/Nice_Icons

local dpi = xresources.apply_dpi

-- {{{ Main
theme = {}
theme.default_themes_path = "/usr/share/awesome/themes"
theme.wallpaper_cmd = { "awsetbg " .. awful.util.getdir("config") .. "/wallpaper1.png" }
theme.colors = {}
theme.colors.base3   = "#002b36ff"
theme.colors.base2   = "#073642ff"
theme.colors.base1   = "#586e75ff"
theme.colors.base0   = "#657b83ff"
theme.colors.base00  = "#839496ff"
theme.colors.base01  = "#93a1a1ff"
theme.colors.base02  = "#eee8d5ff"
theme.colors.base03  = "#fdf6e3ff"
theme.colors.yellow  = "#b58900ff"
theme.colors.orange  = "#cb4b16ff"
theme.colors.red     = "#dc322fff"
theme.colors.magenta = "#d33682ff"
theme.colors.violet  = "#6c71c4ff"
theme.colors.blue    = "#268bd2ff"
theme.colors.cyan    = "#2aa198ff"
theme.colors.green   = "#859900ff"
-- }}}

-- {{{ Styles
theme.font = "xdt:DejaVu Sans Mono for Powerline 12"

-- {{{ Colors
theme.fg_normal  = theme.colors.base01
theme.fg_focus   = theme.colors.base01
theme.fg_urgent  = theme.colors.base3
--}}}

theme.bg_normal  = theme.colors.base3
theme.bg_focus   = theme.colors.base1
theme.bg_urgent  = theme.colors.red
theme.bg_systray = theme.bg_normal
-- }}}

-- {{{ Borders
theme.useless_gap   = dpi(1)
theme.border_width  = dpi(2)
theme.border_normal = theme.colors.base2
theme.border_focus  = theme.colors.yellow
theme.border_marked = theme.bg_urgent
-- }}}

-- {{{ Taglist
theme.taglist_fg_focus = theme.colors.base03
-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color = theme.colors.green
-- mouse_finder_[timeout|animate_timeout|radius|factor]
-- }}}

-- {{{ Menu
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height = "15"
theme.menu_width  = "100"
-- }}}

-- {{{ Icons
-- {{{ Taglist
theme.taglist_squares_sel   = theme.default_themes_path.."/zenburn/taglist/squarefz.png"
theme.taglist_squares_unsel = theme.default_themes_path.."/zenburn/taglist/squarez.png"
--theme.taglist_squares_resize = "false"
-- }}}

-- {{{ Misc
theme.awesome_icon           = theme.default_themes_path.."/zenburn/awesome-icon.png"
theme.menu_submenu_icon      = theme.default_themes_path.."/default/submenu.png"
-- }}}

-- {{{ Layout
theme.layout_tile       = theme.default_themes_path.."/zenburn/layouts/tile.png"
theme.layout_tileleft   = theme.default_themes_path.."/zenburn/layouts/tileleft.png"
theme.layout_tilebottom = theme.default_themes_path.."/zenburn/layouts/tilebottom.png"
theme.layout_tiletop    = theme.default_themes_path.."/zenburn/layouts/tiletop.png"
theme.layout_fairv      = theme.default_themes_path.."/zenburn/layouts/fairv.png"
theme.layout_fairh      = theme.default_themes_path.."/zenburn/layouts/fairh.png"
theme.layout_spiral     = theme.default_themes_path.."/zenburn/layouts/spiral.png"
theme.layout_dwindle    = theme.default_themes_path.."/zenburn/layouts/dwindle.png"
theme.layout_max        = theme.default_themes_path.."/zenburn/layouts/max.png"
theme.layout_fullscreen = theme.default_themes_path.."/zenburn/layouts/fullscreen.png"
theme.layout_magnifier  = theme.default_themes_path.."/zenburn/layouts/magnifier.png"
theme.layout_floating   = theme.default_themes_path.."/zenburn/layouts/floating.png"
-- }}}

-- {{{ Titlebar
theme.titlebar_close_button_focus  = theme.default_themes_path.."/zenburn/titlebar/close_focus.png"
theme.titlebar_close_button_normal = theme.default_themes_path.."/zenburn/titlebar/close_normal.png"

theme.titlebar_ontop_button_focus_active  = theme.default_themes_path.."/zenburn/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = theme.default_themes_path.."/zenburn/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive  = theme.default_themes_path.."/zenburn/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = theme.default_themes_path.."/zenburn/titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active  = theme.default_themes_path.."/zenburn/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = theme.default_themes_path.."/zenburn/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive  = theme.default_themes_path.."/zenburn/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = theme.default_themes_path.."/zenburn/titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active  = theme.default_themes_path.."/zenburn/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = theme.default_themes_path.."/zenburn/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive  = theme.default_themes_path.."/zenburn/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = theme.default_themes_path.."/zenburn/titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active  = theme.default_themes_path.."/zenburn/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = theme.default_themes_path.."/zenburn/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = theme.default_themes_path.."/zenburn/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme.default_themes_path.."/zenburn/titlebar/maximized_normal_inactive.png"
-- }}}
-- }}}

return theme
