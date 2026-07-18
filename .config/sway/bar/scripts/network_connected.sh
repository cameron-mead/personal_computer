#!/bin/bash

connected=$(wpa_cli -i wlp2s0f0 status | grep wpa_state)
target="wpa_state=COMPLETED"

if [[ $connected == $target ]]; then
    echo "<span foreground=\"#00ff00\">"ᯤ"</span>"
else
    echo "<span foreground=\"#ff0000\">"×"</span>"
fi

