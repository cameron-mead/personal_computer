#!/bin/bash

yad --title='sleep on lid?' \
    --button="sleep":1 \
    --button="no sleep":2

value=$?

if [[ $value == 1 ]]; then
    echo 1 > /home/cameron/.config/sway/resources/sleep_on_lid
else
    echo 0 > /home/cameron/.config/sway/resources/sleep_on_lid
fi
