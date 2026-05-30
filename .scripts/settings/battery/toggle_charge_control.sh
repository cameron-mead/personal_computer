current=$(cat /home/cameron/.config/sway/resources/charge_control)

if [ $current -eq 1 ]; then
    echo 0 > /home/cameron/.config/sway/resources/charge_control 
    echo 90 | sudo tee /sys/class/power_supply/BAT0/charge_control_start_threshold
    echo 100 | sudo tee /sys/class/power_supply/BAT0/charge_control_end_threshold
else
    echo 1 > /home/cameron/.config/sway/resources/charge_control
    echo 80 | sudo tee /sys/class/power_supply/BAT0/charge_control_start_threshold
    echo 90 | sudo tee /sys/class/power_supply/BAT0/charge_control_end_threshold
fi
