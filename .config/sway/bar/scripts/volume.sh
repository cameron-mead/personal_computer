#!/bin/bash

output=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)

volume=$(echo "$output" | awk '{print int($2 * 100)}')

bar_open="["
bar_close="]"
bar_block="#"

bar="$bar_open"
bars=$((volume / 5))

for ((i=0; i<20; i++)); do
    # print halfway separator
    if [ "$i" -eq 10 ]; then
        bar+="|"
    fi
    # print block or empty space
    if [ "$i" -lt "$bars" ];then
        bar+="$bar_block"
    else
        bar+=" "
    fi
done
bar+="$bar_close"

if echo "$output" | grep -q MUTED; then
    bar="[        MUTE         ]"
fi

printf "%s\n" "$bar"
