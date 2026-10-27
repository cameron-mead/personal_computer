#!/bin/bash

sudo -v

status=$(sudo wg show | grep endpoint)

if [[ -n $status ]]; then
    printf "$status"
else
    printf "disabled"
fi
