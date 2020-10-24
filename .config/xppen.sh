#!/bin/sh
set -xe

DEVICE="XP-PEN STAR G640 Pen"

if [ "$1" = "full" ]; then
    c0=1.0
    c1=0.0
    c2=1.0
    c3=0.0
else
    c0=1.2163892445582587
    c1=0.0
    c2=1.3515436050647318
    c3=0.0
fi


xinput set-prop "$DEVICE" --type=float "libinput Calibration Matrix" $c0 0.0 $c1 0.0 $c2 $c3 0.0 0.0 1.0
notify-send -u low -t 5000 'Set area'
