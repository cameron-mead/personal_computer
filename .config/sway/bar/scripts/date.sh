#!/bin/bash

# return current day of the week
get_day(){
    date +%A
}

# return current date in
#   DD Month, YYYY
get_date(){
    date +'%d %B, %Y'
}

echo $(get_day), $(get_date)