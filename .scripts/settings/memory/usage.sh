#!/bin/bash

data="$(/home/cameron/.widgets/scripts/free.sh)"
yad --text "<tt>$data</tt>" --text-align=left \
                            --title memory_usage \
                            --fixed \
                            --width 650 \
                            --height 50 \
                            --button 'refresh':1 \
                            --button 'dismiss':0
                            
exit_code=$?

if [[ $exit_code = 1 ]]; then
    /home/cameron/.scripts/settings/memory/usage.sh
fi
