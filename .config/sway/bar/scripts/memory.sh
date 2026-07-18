#!/bin/bash

########################
# parse memory data
########################

gib=$(( 1024 * 1024 * 1024 ))

data=$(free -b)                     # call free command and get output in bytes

memory_data=${data#*Mem:}           # parse memory and swap lines
swap_data=${memory_data#*Swap:}     # parse swap from memory
memory_data=${memory_data%%Sw*}     # parse memory from memory and swap

mem_array=($memory_data)            # cast memory data to array
swp_array=($swap_data)              # cast swap data to array

total_memory=${mem_array[0]}        # parse total memory in bytes
available_memory=${mem_array[-1]}   # parse available memory in bytes

total_swap=${swp_array[0]}          # parse total swap in bytes
available_swap=${swp_array[-1]}     # parse available swap in bytes

########################
# calculate GiB
#######################

total_memory=$(echo "scale=2; $total_memory / $gib" | bc)
available_memory=$(echo "scale=2; $available_memory / $gib" | bc)   
total_swap=$(echo "scale=2; $total_swap / $gib" | bc)
available_swap=$(echo "scale=2; $available_swap / $gib" | bc)

########################
# calculate percentages of used
########################

percent_memory=$(echo "scale=4; 100 - $available_memory / $total_memory * 100" | bc)
percent_swap=$(echo "scale=4; 100 - $available_swap / $total_swap * 100" | bc)

percent_memory=${percent_memory:0:2}        # round down to nearest percent
percent_swap=${percent_swap:0:2}            # round down to nearest percent

########################
# reformat values
########################

printf -v total_memory "%5.2f" "$total_memory"
printf -v available_memory "%5.2f" "$available_memory"
printf -v total_swap "%5.2f" "$total_swap"
printf -v available_swap "%5.2f" "$available_swap"

########################
# assemble bars
########################

# memory
scaled_memory=$percent_memory/4
memory_bar="["
for((i = 0; i < 25; i++))
do
    if [[ $i -gt $scaled_memory ]]; then
        memory_bar=$memory_bar"-"
    else
        memory_bar=$memory_bar"#"
    fi
done
memory_bar=$memory_bar"]"
used_memory=$(echo "$total_memory - $available_memory" | bc) 
printf -v used_memory "%5.2f" "$used_memory"
memory_stats="$used_memory / $total_memory GiB" 
memory_available="$available_memory"
#echo ""

#swap
scaled_swap=$percent_swap/4
swap_bar="["
for((i = 0; i < 25; i++))
do
    if [[ $i -gt $scaled_swap ]]; then
        swap_bar=$swap_bar"-"
    else
        swap_bar=$swap_bar"#"
    fi
done
swap_bar=$swap_bar"]"
used_swap=$(echo "$total_swap - $available_swap" | bc)
printf -v used_swap "%5.2f" "$used_swap"
swap_stats="$used_swap / $total_swap GiB" 
swap_available="$available_swap"
#echo "swp $swap_bar$swap_stats  $swap_available GiB available"


echo "$memory_available GiB available ($percent_memory% used)"
