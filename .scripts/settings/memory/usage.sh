#!/bin/bash

while [[ $exit_code -ne 5 ]]; do

data="$(/home/cameron/.widgets/scripts/free.sh)"
yad --text "<tt>$data</tt>" --text-align=left \
                            --title memory_usage \
                            --fixed \
                            --width 650 \
                            --height 50 \
                            --button 'dismiss':5 \
                            --timeout=1 &
exit_code=$?
sleep 1

done
