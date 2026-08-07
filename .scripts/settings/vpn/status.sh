#!/bin/bash

sudo -v

status=$(sudo wg show)

if [[ -n $status ]]; then
    status=$(curl ifconfig.me)
    echo "running\n$status"
else
    echo "disabled"
fi
