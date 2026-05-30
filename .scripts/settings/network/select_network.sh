#!/bin/bash

interface="wlp2s0f0"

mapfile -t options < <(wpa_cli -i $interface list_networks | awk 'NR>1 {print $1; print $2}')

choice=$(yad \
    --width=500 \
    --height=300 \
    --list \
    --title="NETWORK CONFIGURATION" \
    --column="id" \
    --column="ssid" "${options[@]}" \
    --buttons-layout=edge \
    --button="cancel:1" \
    --button="remove:4" \
    --button "add:2" \
    --button="accept:0" \
    )
exit_code=$?
network_id=$(echo "$choice" | cut -d'|' -f1)

echo $choice

if [[ $exit_code -eq 0 ]]; then
    wpa_cli -i $interface select_network ${choice:0:1}
    wpa_cli -i $interface save_config
elif [[ $exit_code -eq 2 ]]; then
    /home/cameron/.scripts/settings/network/add_network.sh
elif [[ $exit_code -eq 4 ]]; then
    wpa_cli -i $interface remove_network ${choice:0:1}
    wpa_cli -i $interface save_config
    /home/cameron/.scripts/settings/network/select_network.sh
fi
