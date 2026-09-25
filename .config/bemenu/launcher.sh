#!/bin/bash

# Get everything bemenu-run would normally show (executables in PATH)
normal_apps=$(compgen -c | sort -u)

# Your extra custom entries (name -> command)
extra_apps="
discord
spotify
settings
stm32cubeide
minecraft
"

choice=$(printf '%s\n%s\n' "$normal_apps" "$extra_apps" | sort -u | bemenu -i -p "run :")

case "$choice" in
    "discord") ~/packages/apps/Discord/run.sh & ;;
    "spotify") flatpak run com.spotify.Client & ;;
    "settings") ~/.scripts/settings/settings.sh & ;;
    "stm32cubeide") /home/cameron/packages/apps/st/stm32cubeide_1.19.0/stm32cubeide_wayland & ;;
    "minecraft") prismlauncher & ;;

    "") exit 1 ;;
    *) "$choice" & ;;   # fallback: run it as a normal command
esac
