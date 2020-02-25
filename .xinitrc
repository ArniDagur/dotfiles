# vim: filetype=sh
# Set X keyboard layout to qgmlwy
setxkbmap qgmlwy
# Using typematic delay and rate
xset r rate 250 30
xrandr --output HDMI2 --mode 1920x1080 --left-of HDMI1
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh
eval $(ssh-agent)
exec i3
