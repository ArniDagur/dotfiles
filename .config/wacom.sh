#!/bin/sh

DEVICE="Wacom One by Wacom S Pen"
STYLUS="$DEVICE stylus"

if [ -f $HOME/.WACOM_MAPTOOUTPUT ]; then
    DIMENSIONS=$(cat $HOME/.WACOM_MAPTOOUTPUT)
else
    echo "Please put your MapToOutput dimensions into a file called ~/.WACOM_MAPTOOUTPUT"
    echo "Example: echo \"1920x1080+0+0\" > ~/.WACOM_MAPTOOUTPUT"
    exit 1
fi

# -- Stylus --
# Previous areas: 144 450 4000 2250
# xsetwacom set "$STYLUS" "Area" "144 266 4800 2885"
xsetwacom set "$STYLUS" "Area" "0 0 6160 3465"
xsetwacom set "$STYLUS" "MapToOutput" "$DIMENSIONS"
xsetwacom set "$STYLUS" "Mode" "Absolute"

# Set the sample window size (a sliding average sampling window) for incoming
# tool raw data points. Default: 4, range of 1 to 20.
xsetwacom set "$STYLUS" "RawSample" "1"

# Set the delta (difference) cutoff level for further processing of incoming
# input tool coordinates. Suppress is a tablet wide parameter; a specified delta
# for one input tool is applied to all input tool coordinates. Do disable
# suppression, use a level of 0. Default: 2, range of 0 to 100.
xsetwacom set "$STYLUS" "Suppress" "0"
