set_background(){
    /home/cameron/.scripts/set_background.sh "$1"
}

interval=0.1

while true; do
    set_background "#bba700"
    sleep $interval
    set_background "#d84400"
    sleep $interval
done
