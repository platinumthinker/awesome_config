#My beatufyl config for awesome wm 4.0

##Screenshots:
![Screenshot1](https://dl.dropboxusercontent.com/u/25179463/screen/For%20README%20in%20git/awesome/1.png)
![Screenshot2](https://dl.dropboxusercontent.com/u/25179463/screen/For%20README%20in%20git/awesome/2.png)

###Clone this repo:
> git clone git@bitbucket.org:platinumthinker/awesomeconfig.git ~/.config/awesome
###Update submodule:
> git submodule update --init --recursive

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
 * Terminal:        xfce4-terminal
 * Browser:         firefox
 * Backlight:       xbacklight
 * Menu:            rofi

##GUI program:
* File manager:     thunar
* Pulse mixer:      pavucontrol
* Block X:          slock from sucless tools
* xfsettingsd


##Default shortcut
Using shortcuts: Win key + another keys
###Keys:
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

###Shortcut for focused floating client:
    PgUp,PgDn       -> Resize by vertical (Inc/Dec)
    Home,End        -> Resize by horizontal (Inc/Dec)
    Shift Arrow     -> Replace by direction Left/Right/Up/Down

###Tags:
    Num(1..9)       -> Switch to tag
    Shift Num(1..9) -> Replace focused client to tag
    Ctrl Num(1..9)  -> Toggle view Num tag in current tag

###Program shortcut:
    ,.              -> Inc/Dec backlight (hight step)
    Shift ,.        -> Inc/Dec backlight (small step)
    e               -> GVim
    s               -> Pavucontrol (sound mixer)
    d               -> Dmenu (programm menu)
    g               -> Thunar (file manager)
    i               -> Iceweasel (internet browser)
    p               -> Xfce-appfinder (GUI menu)
    b               -> slock (block X)
    w               -> list all opened windows (in dmenu)
    W               -> list all opened windows in current desktop (in dmenu)
