#!/bin/bash

#
# Script to notify user of low battery
# Called from /home/cameron/.config/sway/config
#

# notifies with or without percentage
notify(){
    if [ -n "$1" ]; then
        echo $(yad --width=200 --height=100 --title="ALERT" --text="battery $1 %" --button="dismiss":0)
    else
        echo $(yad --width=200 --height=100 --title="ALERT" --text="battery low" --button="dismiss":0)
    fi
}

# return current battery level
get_battery(){
    printf "%s" "$(cat /sys/class/power_supply/BAT0/capacity)"
}

# helper for is_charging
get_batt_stat(){
    printf "%s" "$(cat /sys/class/power_supply/BAT0/status)"
}

# 1 for charging, 0 for discharging
is_charging(){
    if [[ $(get_batt_stat) == 'Charging' ]]; then
        echo 1
     else
         echo 0
     fi
}

battery_threshold=11
is_low=0

while true; do

    # current battery
    battery=$(get_battery)
    
    # reset low flag when battery exceeds threshold
    if [[ $is_low -eq 1 && $battery -gt $battery_threshold ]]; then
        is_low=0
    fi

    # notifies low battery and sets low battery flag
    if [[ $battery -lt $battery_threshold && $is_low -eq 0 && $(is_charging) -eq 0 ]]; then
        notify "$battery"
        is_low=1
    fi

    # resets flag when charging
    # allows for repeat notifications if unplugged while below threshold
    if [[ $(is_charging) -eq 1 && $is_low -eq 1 ]]; then
        is_low=0
    fi

    sleep 1
done

