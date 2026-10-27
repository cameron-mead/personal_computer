#!/bin/bash

#swaymsg output eDP-1 disable

if [[ $(cat /home/cameron/.config/sway/resources/sleep_on_lid) == 1 ]]; then
    sudo zzz
fi

exec swaylock -f -c 000000
