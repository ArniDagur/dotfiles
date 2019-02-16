#!/usr/bin/env python3
#
# Copyright (C) 2016 James Murphy
# Licensed under the GPL version 2 only
#
# A battery indicator blocklet script for i3blocks

import re
import os
from subprocess import check_output, DEVNULL

try:
    # Redirect stderr to the void!
    status = check_output(['acpi'], universal_newlines=True, stderr=DEVNULL)
except FileNotFoundError as exc:
    # ACPI is not installed
    pass

if not status:
    # no battery found
    fulltext = ""
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
    
    FA_FORM  = "%{{T1}}{}%{{T-}}"
    FA_CFORM = "%{{F{}}}%{{F-}}"

    BATTERY_0   = FA_FORM.format("\uf244")
    BATTERY_25  = FA_FORM.format("\uf243")
    BATTERY_50  = FA_FORM.format("\uf242")
    BATTERY_75  = FA_FORM.format("\uf241")
    BATTERY_100 = FA_FORM.format("\uf240")

    if 0 <= percentleft < 13:
        BATTERY = BATTERY_0
    elif 13 <= percentleft < 38:
        BATTERY = BATTERY_25
    elif 38 <= percentleft < 63:
        BATTERY = BATTERY_50
    elif 63 <= percentleft < 88:
        BATTERY = BATTERY_75
    elif 88 <= percentleft <= 100:
        BATTERY = BATTERY_100
    else:
        BATTERY = BATTERY_0

    LIGHTNING = FA_CFORM.format("#00ffff", FA_FORM.format("\uf0e7"))
    PLUG      = FA_FORM.format("\uf1e6")
    QUESTION  = FA_FORM.format("\uf128")
    
    if True:
        if state == "Discharging":
            label = BATTERY
        elif state == "Full":
            label = PLUG
            timeleft = ""
        elif state == "Unknown":
            label = QUESTION+" "+BATTERY
            timeleft = ""
        else: # Charging
            label = LIGHTNING+" "+PLUG
    else:
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
        if percent < 30:
            if percent < 10:
                return '#FFFFFF'
            elif percent < 20:
                return '#FF3300'
            else:
                return '#FF6600'
        else:
            if percent < 40:
                return '#FF9900'
            else:
                return '#FFFFFF'
            #  return "#FFCC00"
        #  if percent < 60:
            #  return "#FFFF00"
        #  if percent < 70:
            #  return "#FFFF33"
        #  if percent < 80:
            #  return "#FFFF66"
        return "#FFFFFF"
    
    form = 'BAT: %{{F{}}}{} {}%%{{F-}}'
    fulltext = form.format(color(percentleft), label, percentleft)
    fulltext += timeleft

    if percentleft < 10:
        fulltext = "%{{B#F00}}{}%{{B-}}".format(fulltext)

print(fulltext)
