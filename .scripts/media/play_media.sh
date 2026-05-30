#!/bin/bash

status=0
file=/home/cameron/media/

# main loop
while [[ $status -eq 0 ]]; do
    # query for media file
    file=$(yad --title='media player' \
        --width=800 --height=500 \
        --button='view history':2 --button='play':0 --button='exit':1 \
        --file --filename="$file")
    status=$?
    # case if file selected
    if [[ $status -eq 0 ]]; then
        # save to history
        text_to_trim="/home/cameron/media/"
        proper_name="${file#$text_to_trim}" 
        echo "$proper_name" | cat - /home/cameron/media/.history > /tmp/.history_tmp \
  && mv /tmp/.history_tmp /home/cameron/media/.history
        # play media
        mpv --save-position-on-quit "$file"
    # case if view history
    elif [[ $status -eq 2 ]]; then
        mapfile -t items < /home/cameron/media/.history
        yad --title='media history' \
            --width=800 --height=500 \
            --button='clear':1 --button='return':0 \
            --list --no-headers --no-selection --selectable-labels \
            --column='items' "${items[@]}"
            status=$?
        # clear history
        if [[ $status -eq 1 ]]; then
            datestamp=$(date +%F)
            timestamp=$(date +%T)
            printf '\nlast cleared %s %s' "$datestamp" "$timestamp" > /home/cameron/media/.history
        fi
        status=0
    fi
done
