#!/bin/bash

fish_directory='/home/cameron/documents/storage/fish'

number=$((RANDOM % $(ls -1 $fish_directory | wc -l)))
cat "$fish_directory/fish-$number"
