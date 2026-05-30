#!/bin/bash

# return current time in 24hr format
get_time(){
    date +%T
}

echo $(get_time)