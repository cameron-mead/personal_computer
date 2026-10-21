#!/bin/bash

yad --title "projection type" \
    --button "mirror":1 \
    --button "extend":2 

type=$?

if   [[ $type == 1 ]]; then
    /home/cameron/.scripts/settings/audio-video/mirror.sh
elif [[ $type == 2 ]]; then
    /home/cameron/.scripts/settings/audio-video/extend.sh
fi 
