# vim: filetype=sh
# Set X keyboard layout to qgmlwy
setxkbmap qgmlwy
# Using typematic delay and rate
xset r rate 200 30
xrandr --output DP-0 --mode 2560x1440 -r 144 --primary --right-of HDMI-1
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
exec i3
