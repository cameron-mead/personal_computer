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
  "1000" "battery" "1000" \
    "1001:1000" "toggle charge control" "1001" \
  \
  "10000" "vpn" "10000" \
    "10001:10000" "start vpn" "10001" \
    "10002:10000" "stop vpn" "10002" \
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
"1000|")
    yad \
    --width=200 --height=100 \
    --title="battery" \
    --button="dismiss":0 \
    --text="$(/home/cameron/.scripts/settings/battery/get_battery_info.sh)"
    ;;
"1001|")
    /home/cameron/.scripts/settings/battery/toggle_charge_control.sh
    ;;

# vpn
"10000|")
    yad \
    --width=200 --height=100 \
    --title="vpn" \
    --button="dismiss":0 \
    --text="$(/home/cameron/.scripts/settings/vpn/status.sh)"
    ;;
"10001|")
    /home/cameron/.scripts/settings/vpn/start.sh
    ;;
"10002|")
    /home/cameron/.scripts/settings/vpn/stop.sh
    ;;
    

esac
