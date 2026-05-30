#!/bin/bash

interface="wlp2s0f0"

height=300
width=500

wpa_cli -i $interface scan
yad --title="NETWORK REGISTRATION" --text="Scanning for Networks..." --width=$width --height=$height --timeout=3 --button="dismiss:1" &
sleep 3

scan_results=$(wpa_cli -i $interface scan_results \
  | awk 'NR>1 && $5 != "" && !seen[$5]++ {
      if ($4 ~ /WPA|WEP/)
          print "  -  " $5 "\t[protected]"
      else
          print "  -  " $5
  }')

result=$(yad --title="NETWORK REGISTRATION" \
    --text="ssid :\n$scan_results\n" \
    --form \
    --field="ssid" \
    --field="password" \
    --button="re-scan:2" \
    --button="cancel:1" \
    --button="accept:0" \
    --width=$width \
    --height=$height \
    )

exit_code=$?

if [[ $exit_code -eq 2 ]]; then
    /home/cameron/.scripts/network/add_network.sh    
elif [[ $exit_code -eq 0 ]]; then
    id=$(wpa_cli -i $interface add_network)
    IFS='|' read -r SSID PASSWORD <<< "$result"
    wpa_cli -i $interface set_network $id ssid "\"$SSID\""
    if [[ -n "$PASSWORD" ]]; then
        wpa_cli -i $interface set_network $id psk "\"$PASSWORD\""
    else
        wpa_cli -i $interface set_network $id key_mgmt NONE
    fi
    wpa_cli -i $interface enable_network $id
    wpa_cli -i $interface save_config
fi
