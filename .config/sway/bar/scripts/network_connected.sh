#!/bin/bash

network=$(wpa_cli -i wlp2s0f0 list_networks | grep "CURRENT" | awk '{print $2}')

connected=$(wpa_cli -i wlp2s0f0 status | grep wpa_state)
target="wpa_state=COMPLETED"

#latency=$(/home/cameron/.scripts/network_latency.sh)
#latency=${latency:0:2}
#if [[ $latency -lt 50 ]]; then
    latency="#00ff00"
#elif [[ $latency -lt 80 ]]; then
#    latency="#ffff00"
#else
#    latency="#ff0000"
#fi

network=$(printf "%-20s" "$network")

if [[ -n $( /home/cameron/.scripts/settings/vpn/status.sh | grep running) ]]; then
    vpn="🗝"
else
    vpn="    "
fi

if [[ $connected == $target ]]; then
    printf "%s   %s %s\n" "$vpn" "<span foreground=\"$latency\">"ᯤ"</span>" "$network"
else
    printf "%s   %s %s\n" "$vpn" "<span foreground=\"#ff0000\">"×"</span>" "$network"
fi
