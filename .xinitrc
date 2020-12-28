# vim: filetype=sh
# Set X keyboard layout to qgmlwy
setxkbmap qgmlwy
# Using typematic delay and rate
xset r rate 250 30
xrandr --output DP-0 --mode 1920x1080 -r 240 --left-of DP-2 --output DP-2 --mode 3840x2160
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

eval $(ssh-agent)
exec dbus-launch --exit-with-session i3
