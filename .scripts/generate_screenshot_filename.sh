#!/bin/bash

#
# Generates properly formatted screenshot filename
# Called from /home/cameron/.config/sway/config
#

date_code="$(date +%d%b%Y)"
time_code="$(date +%H%M%S)"
echo "${date_code}_${time_code}"
