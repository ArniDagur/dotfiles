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
xsetwacom set "$STYLUS" "Area" "144 450 4000 2250"
xsetwacom set "$STYLUS" "MapToOutput" "$DIMENSIONS"
