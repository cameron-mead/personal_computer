#!/bin/bash

network=$(wpa_cli -i wlp2s0f0 list_networks | grep "CURRENT" | awk '{print $2}')

connected=$(wpa_cli -i wlp2s0f0 status | grep wpa_state)
target="wpa_state=COMPLETED"

if [[ $connected == $target ]]; then
    connected="CONNECTED"
else
    connected="NOCONNECT"
fi

info="$network\n\t$connected"

yad --width=200 --height=25 --title="NETWORK INFO" --text="$info" --button="refresh":1 --button="dismiss":0

exit_code=$?
if [[ $exit_code -eq 1 ]]; then
    /home/cameron/.scripts/settings/network/get_network_info.sh
fi
