#!/bin/bash

# return status of battery
# Charging, Discharging, Full
get_batt_stat(){
    printf "%s" "$(cat /sys/class/power_supply/BAT0/status)"
}

is_charging(){
    if [[ $(get_batt_stat) == 'Charging' ]]; then
        echo 1
    else
        echo 0
    fi
}

# return current battery percentage
get_batt_percent(){
    printf "%s" "$(cat /sys/class/power_supply/BAT0/capacity)"
}

# return current battery percentage and colored bar
#
# takes a single parameter to indicate whether or not the rightmost segment
# of the bar should blink to indicate charging
#       0 for no blink
#       1 for blink
get_batt(){

    local blink=${1:-0}
    
    battery_level=$(cat /sys/class/power_supply/BAT0/capacity)
    bars=$((battery_level/10))

    bar_open="["
    bar_close="]"
    bar_block="#"
    
    #Initialize Bar String
    bar="$bar_open"
    #Bar Creation Loop
    for ((i=0; i<10; i++)); do
        #Assign Color
        if [ "$i" -lt 1 ]; then
            color="red"
        elif [ "$i" -lt 4 ]; then
            color="yellow"
        else
            color="green"
        fi
        #Print Block
        if [ "$i" -lt "$bars" ];then
            bar+="<span foreground=\"$color\">"$bar_block"</span>"
        else
            #Blink if Charging
            if [ "$i" -eq "$bars" ] && [ $blink -eq 1 ]; then
                bar+="<span foreground=\"$color\">"$bar_block"</span>"
            else
                bar+=" "
            fi
        fi
    done
    #Close Bar String
    bar+="$bar_close"

    charge_control=" "
    if [[ $(cat /home/cameron/.config/sway/resources/charge_control) == 1  ]]; then
        charge_control="♻"
    fi

    
    printf "%s %3d%% %s " "$charge_control" "$battery_level" "$bar"
}


battery_low_path=/home/cameron/.config/sway/resources/battery_low
battery_threshold=11
# notify low battery
batt_low=$(cat $battery_low_path)
if [[ $(is_charging) -eq 0 && $(get_batt_percent) -lt $battery_threshold && "$batt_low" -eq 0 ]]; then
    echo 1 > $battery_low_path
    /home/cameron/.config/sway/scripts/notify_battery_low.sh $(get_batt_percent) &
fi
# reset low battery flag
if [[ $(is_charging) -eq 1 && $(get_batt_percent) -gt $battery_threshold && "$batt_low" -eq 1 ]]; then
    echo 0 > $battery_low_path
fi


if [[ $(is_charging) -eq 1 ]]; then # if charging
    blink_path=/home/cameron/.config/sway/resources/battery_blink
    blink=$(cat $blink_path)
    if [[ $blink -eq 1 ]]; then
        echo 0 > $blink_path # set flag
        printf "%s" "$(get_batt 1)"
    else
        echo 1 > $blink_path # set flag
        printf "%s" "$(get_batt)"
    fi
else # if not charging
    printf "%s" "$(get_batt)"
fi

printf "\n"
