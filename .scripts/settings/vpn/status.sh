#!/bin/bash

sudo -v

status=$(sudo wg show)

if [[ -n $status ]]; then
    echo $status
else
    echo "disabled"
fi
