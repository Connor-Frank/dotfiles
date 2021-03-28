#!/bin/sh

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

# add scripts to PATH
export PATH=$PATH:$(find ${XDG_DATA_HOME:-$HOME/scripts} -maxdepth 1 -type d | paste -sd ":" -)

dwmblocks &
#feh --bg-scale ${XDG_DATA_HOME:-$HOME}/sync/wallpapers/big-sur-low-quality.jpg
feh --bg-scale ${XDG_DATA_HOME:-$HOME}/sync/wallpapers/porsche_911.jpg &
#(sleep 0.1 && redshift -l manual) &
(sleep 0.1 && picom) &
(sleep 0.1 && dunst) &
exec dwm
