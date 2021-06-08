## source general options ##
source ~/.config/zsh/.zshrc_generic

## specific options for arch linux ##

# macOS-like startup message
ll=$(last -1 $USER | head -1 | cut -c 40-55)
on=$(last -1 $USER | head -1 | cut -c 10-20)
echo "Last login: $ll on $on"

#eval "$(pyenv init -)"
#eval $(thefuck --alias)

alias s='source ~/.config/zsh/.zshrc > /dev/null 2>&1'
alias name='uname -snrmo'
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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
