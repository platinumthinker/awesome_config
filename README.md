#My beatufyl config for awesome wm 3.5.

##Screenshots:
![Screenshot1](https://db.tt/syN8qCTn)
![Screenshot2](https://db.tt/3pNMRBMo)

##Visual settings:
###AwesomeWM Theme:
 * [Dark solarized](https://github.com/cycojesus/awesome-solarized)
###GTK Theme and other settings:
 * [Dark solarized](https://bitbucket.org/platinumthinker/dotfiles)
###Vim Solarized theme:
 * [Solarized](https://github.com/altercation/vim-colors-solarized)
###Font:
 * DejaVu Sans Mono 

##Using program:
 * Terminal:        lxterm
 * IM:              pidgin
 * Browser:         iceweasel (with pentadactyl)
 * Backlight:       xbacklight
 * Menu:            dmenu from sucless tools

##GUI program:
* file manager:     thunar
* Menu:             xfce4-appfinder
* Editor:           gvim
* Pulse mixer:      pavucontrol


##Default shortcut
Using shortcuts: Win key + another keys
###Keys:
    w               -> Open menu
    Left, Right     -> Prev/Next tags,
    Esc             -> Prev history tags,
    Tab             -> Focus to prev client from history
    Ctrl r          -> Awesome restart
    Ctrl q          -> Awesome quit
    x               -> Run lua code

    j,k             -> Prev/Next client
    Ctrl j,k        -> Prev/Next screen
    Shift j,k       -> Replace client

    h,l             -> Resize master/slave part
    Shift h,l       -> Inc/Dec number client in master part
    Ctrl h,l        -> Inc/Dec column in slave part

    u               -> Focus to first urgent client
    Space           -> Next layout
    Shift Space     -> Prev layout

###Shortcut for focused client:
    Ctrl Space      -> Toggle floating
    n               -> Minimize
    Ctrl n          -> Restore client (Undo minimize)
    f               -> Toggle fullscreen
    Shift c         -> Kill focused client
    Ctrl Enter      -> Swap to master
    o               -> Send to next screen
    t               -> Toggle ontop
    m               -> Toggle maximized

###Tags:
    Num(1..9)       -> Switch to tag
    Shift Num(1..9) -> Replace focused client to tag
    Ctrl Num(1..9)  -> Toggle view Num tag in current tag

###Program shortcut:
    ,.              -> Inc/Dec backlight (hight step)
    Shift ,.        -> Inc/Dec backlight (small step)
    a               -> GVim
    s               -> Pavucontrol (sound mixer)
    d               -> Dmenu (programm menu)
    g               -> Thunar (file manager)
    i               -> Iceweasel (internet browser)
    p               -> Xfce-appfinder (GUI menu)
