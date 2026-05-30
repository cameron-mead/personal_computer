#!/bin/bash

#
# Sets background to input color or opens yad color picker
#

if [ -n "$1" ]; then
    color=$1
    echo $color > /home/cameron/.config/sway/resources/background_color #store color in file
    swaymsg "output * bg $color solid_color"
else
    color=$(yad --color --title="select new background color" --button="accept":0 --button="cancel":1)
    if [ $? -eq 0 ]; then #check exit code of yad
        echo $color > /home/cameron/.config/sway/resources/background_color #store color in file
        swaymsg "output * bg $color solid_color"
    fi
fi
