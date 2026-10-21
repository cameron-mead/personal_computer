#!/bin/bash

#
# determine which output the current workspace is assigned to ( either eDP-1 or DP-3 )
# and switch output to the other, effectively swapping it between laptop and projector
#

laptop_output="eDP-1"
projector_output="DP-3" # hardcoded to display port 3 (left side)

current_output=$(swaymsg -p -t get_outputs | awk '/^Output/ && /\(focused\)/ {print $2}')

if [[ $current_output = $laptop_output ]]; then
    swaymsg move workspace to output "$projector_output"
else
    swaymsg move workspace to output "$laptop_output"
fi
