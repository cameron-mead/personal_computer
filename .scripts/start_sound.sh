#!/bin/sh

#
# Starts services necessary for sound to work
# Called from /home/cameron/.config/sway/config
#
#

pipewire &
while [ ! -S /run/user/$(id -u)/pipewire-0 ]; do sleep 0.1; done
wireplumber &
