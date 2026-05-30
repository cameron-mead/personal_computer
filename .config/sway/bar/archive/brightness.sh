#!/bin/bash

# return current display brightness as bar
get_brightness(){

    brightness=$(($(brightnessctl g) / 4))

    bar_open="["
    bar_close="]"
    bar_block="#"
    
    bar="$bar_open"
    bars=$((brightness / 10))

    for ((i=0; i<10; i++)); do
        if [ "$i" -lt "$bars" ];then
            bar+="$bar_block"
        else
            bar+=" "
        fi
    done
    bar+="$bar_close"
    
    printf "💡%s" "$bar"

}

echo $(get_brightness)