#!/bin/sh
set -xe

DEVICE="XP-PEN STAR G640 Pen"

# c0=0.8221052631578948
c0=1.2163892445582587
c1=0.0
# c2=0.7398947368421053
c2=1.3515436050647318
c3=0.0

xinput set-prop "$DEVICE" --type=float "libinput Calibration Matrix" $c0 0.0 $c1 0.0 $c2 $c3 0.0 0.0 1.0
