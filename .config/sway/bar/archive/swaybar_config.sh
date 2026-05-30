#!/bin/bash
#Script for status bar
set -u

#filepaths
main=/home/cameron/.config/sway/bar/

# returns a number of tab spaces equal to the input parameter
tabs(){
    for ((i=0; i<$1; i++)); do
        printf "\t"
    done
}

# main loop
while true; do
    date=$(${main}date.sh)
    time=$(${main}time.sh)
    volume=$(${main}volume.sh)
    battery=$(${main}battery.sh)
    brightness=$(${main}brightness.sh)
    echo -e " $date $(tabs 8) $time $(tabs 6) $volume $(tabs 3) $battery "
    sleep 0.05
done
