#!/bin/bash

# Only exported variables can be used within the timer's command.
export PRIMARY_DISPLAY="$(xrandr | awk '/ primary/{print $1}')"

exec xidlehook \
    --not-when-fullscreen \
    --not-when-audio \
    --timer 60 \
        'xrandr --output "$PRIMARY_DISPLAY" --brightness .1' \
        'xrandr --output "$PRIMARY_DISPLAY" --brightness 1' \
    --timer 180 \
        'i3lock' \
        ''
