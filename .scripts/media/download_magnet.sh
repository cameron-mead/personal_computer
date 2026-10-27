#!/bin/bash

printf "\n1. Movie\n2. Tv\nSelect Media Type : "
read media_type

path="/home/cameron/media/"

if [[ $media_type == 1 ]]; then
    path+="movies/"
elif [[ $media_type == 2 ]]; then
    path+="tv/"
else
    path="/home/cameron/downloads/"
fi

printf "\nEnter Magnet Link : "
read link

aria2c -d $path --seed-time=0 "$link"
