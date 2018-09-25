# vim: filetype=sh
# Set X keyboard layout to qgmlwy
setxkbmap qgmlwy
# Using typematic delay and rate
xset r rate 200 30
xrandr --output DP-0 --mode 2560x1440 -r 144 --primary --right-of HDMI-1
xsetwacom set 18 Area 0 0 7600 4750
xsetwacom set 18 MapToOutput 2560x1440+1920+0
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

eval $(ssh-agent)
exec i3
