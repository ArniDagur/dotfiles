#!/usr/bin/env python3
#
# Copyright (C) 2016 James Murphy
# Licensed under the GPL version 2 only
#
# A battery indicator blocklet script for i3blocks

import re
from subprocess import check_output

try:
    status = check_output(['acpi'], universal_newlines=True)
except FileNotFoundError as exc:
    print("'acpi' not installed")
    exit(33)

if not status:
    # no battery found
    fulltext = ""
    percentleft = 100
else:
    # if there is more than one battery in one laptop, the percentage left is 
    # available for each battery separately, although state and remaining 
    # time for overall block is shown in the status of the first battery 
    batteries = status.split("\n")
    state_batteries=[]
    commasplitstatus_batteries=[]
    percentleft_batteries=[]
    time = ""
    for battery in batteries:
        if battery!='':
            state_batteries.append(battery.split(": ")[1].split(", ")[0])
            commasplitstatus = battery.split(", ")
            if not time:
                time = commasplitstatus[-1].strip()
                # check if it matches a time
                time = re.match(r"(\d+):(\d+)", time)
                if time:
                    time = ":".join(time.groups())
                    timeleft = " ({})".format(time)
                else:
                    timeleft = ""
            p = int(commasplitstatus[1].rstrip("%\n"))
            if p>0:
                percentleft_batteries.append(p)
            commasplitstatus_batteries.append(commasplitstatus)
    state = state_batteries[0]
    commasplitstatus = commasplitstatus_batteries[0]
    if percentleft_batteries:
        percentleft = int(sum(percentleft_batteries)/len(percentleft_batteries))
    else:
        percentleft = 0
    
    # at this point we have defined percentleft, state, and timeleft
    label = ""

    if state == "Discharging":
        label = "Discharging:"
    elif state == "Full":
        label = "Battery full:"
        timeleft = ""
    elif state == "Unknown":
        label = "?:"
        timeleft = ""
    else: # Charging
        label = "Charging:"
    
    def color(percent):
        if percent < 10:
            # exit code 33 will turn background red
            return "#FFFFFF"
        if percent < 20:
            return "#FF3300"
        if percent < 30:
            return "#FF6600"
        if percent < 40:
            return "#FF9900"
        if percent < 50:
            return "#FFCC00"
        if percent < 60:
            return "#FFFF00"
        if percent < 70:
            return "#FFFF33"
        if percent < 80:
            return "#FFFF66"
        return "#FFFFFF"
    
    form = '<span color="{}">{} {}%</span>'
    fulltext = form.format(color(percentleft), label, percentleft)
    fulltext += timeleft

print(fulltext)
# Don't know why there were two prints
#  print(fulltext)
if percentleft < 10:
    exit(33)