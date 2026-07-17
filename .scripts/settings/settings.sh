#!/bin/bash

selection=$(yad \
  --title="settings" \
  --width=500 \
  --height=300 \
  --button="cancel":1 \
  --list \
  --no-headers \
  --tree \
  --column="settings" \
  --column="id" \
  --hide-column=2 \
  --print-column=2 \
  \
  "100" "network" "100" \
    "101:100" "network info" "101" \
    "102:100" "list networks" "102" \
  \
  "200" "battery" "200" \
    "201:200" "toggle charge control" "201" \
  \
  "300" "vpn" "300" \
    "301:300" "start vpn" "301" \
    "302:300" "stop vpn" "302" \
  \
  "400" "memory" "400" \
    "401:400" "memory usage" "401" \

  )

if [[ $? -eq 1 ]]; then
    exit
fi

case $selection in

# network
"100|" | "101|")
    /home/cameron/.scripts/settings/network/get_network_info.sh
    ;;
"102|")
    /home/cameron/.scripts/settings/network/select_network.sh
    ;;

# battery
"200|")
    yad \
    --width=200 --height=100 \
    --title="battery" \
    --button="dismiss":0 \
    --text="$(/home/cameron/.scripts/settings/battery/get_battery_info.sh)"
    ;;
"201|")
    /home/cameron/.scripts/settings/battery/toggle_charge_control.sh
    ;;

# vpn
"300|")
    yad \
    --width=200 --height=100 \
    --title="vpn" \
    --button="dismiss":0 \
    --text="$(/home/cameron/.scripts/settings/vpn/status.sh)"
    ;;
"301|")
    /home/cameron/.scripts/settings/vpn/start.sh
    ;;
"302|")
    /home/cameron/.scripts/settings/vpn/stop.sh
    ;;
# memory
"400|" | "401|")
    /home/cameron/.scripts/settings/memory/usage.sh
    ;;
    

esac
