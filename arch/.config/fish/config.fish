## source general config ##
source ~/.config/fish/config_general.fish

## specific options for arch linux ##

export GDK_DPI_SCALE=1.75
export QT_AUTO_SCREEN_SCALE_FACTOR=1.75
export ELM_SCALE=1.75

alias name='uname -snrmo'
alias comp='picom'
# --no-fading-openclose & disown

# refresh package info in dwmbar
alias refreshlist='~/scripts/arch-linux/list-packages-once'

# ncmatrix works with transparency
alias cmatrix='ncmatrix'

alias upd='sudo reflector --verbose --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist && fish_update_completions && cat /etc/pacman.d/mirrorlist'

# change cpu speeds
alias performance='sudo cpupower frequency-set -g performance'
alias powersave='sudo cpupower frequency-set -g powersave'

# build all suckless software
alias sbuild='~/scripts/arch-linux/sbuild'

# store pacman package info
function pacdump
  pacgraph -f ~/pacgraph
  pacman -Qe | cut -d' ' -f1 > ~/pacman-list
end
funcsave pacdump

pyenv init - | source

if status is-login
  if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
    exec startx -- -keeptty
  end
end
