## source general options ##
source ~/.zshrc_generic

## specific options for arch linux ##

# macOS prompt
ll=$(last -1 $USER | head -1 | cut -c 40-55)
on=$(last -1 $USER | head -1 | cut -c 10-20)
echo "Last login: $ll on $on"
PS1='%n@%m %1~ %# '

export GDK_DPI_SCALE=1.75
export QT_AUTO_SCREEN_SCALE_FACTOR=1.75
export ELM_SCALE=1.75

eval "$(pyenv init -)"
eval $(thefuck --alias)

alias name='uname -snrmo'
alias comp='picom'
alias logins='last -f /var/log/wtmp | less'

## things that autoreload dwmblocks
function yay {
  command yay "$@"
  kill -37 $(pidof dwmblocks) # dwm-packages signal 3
}
function nmcli {
  command nmcli "$@"
  kill -35 $(pidof dwmblocks) # dwm-misc signal 1
}
function energy { # change cpu frequencies
  sudo cpupower frequency-set -g "$@"
  kill -35 $(pidof dwmblocks) # dwm-misc signal 1
}
function neomutt {
  command neomutt "$@"
  kill -35 $(pidof dwmblocks) # dwm-misc signal 1
}

# ncmatrix works with transparency
alias cmatrix='ncmatrix'

alias upd='sudo reflector --verbose --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist && cat /etc/pacman.d/mirrorlist'

pacdump() {
  pacgraph -f ~/pacgraph
  pacman -Qe | cut -d' ' -f1 > ~/pacman-list
}

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi
