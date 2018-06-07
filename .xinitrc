setxkbmap qgmlwy
xrandr --output DP-0 --mode 2560x1440 -r 144 --primary --right-of HDMI-1
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
exec i3
