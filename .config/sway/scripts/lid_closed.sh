#!/bin/bash

if [[ $(cat /home/cameron/.config/sway/resources/sleep_on_lid) == 1 ]]; then
    sudo zzz
else
    swaymsg output eDP-1 disable
fi

exec swaylock -f -c 000000
