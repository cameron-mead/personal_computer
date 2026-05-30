#!/bin/bash

selection=$(yad \
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
    --button="dismiss":0 \
    --text="$(/home/cameron/.scripts/settings/battery/get_battery_info.sh)"
    ;;
"1001|")
    /home/cameron/.scripts/settings/battery/toggle_charge_control.sh
    ;;

esac
