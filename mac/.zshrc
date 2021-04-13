## specific options for mac ##

alias build-cmake='~/.local/bin/cmake/build-cmake'
alias run-cmake='~/.local/bin/cmake/run-cmake'

# macOS prompt
PS1='%n@%m %1~ %# '

alias pubip='curl ifconfig.me; echo'

# x86 homebrew
alias xbrew='arch -x86_64 /usr/local/bin/brew'
# this is the way i always run this package, so i created an alias
alias mac_info='osx-cpu-temp -c -g -f -F'

## source general config ##
source ~/.config/zsh/.zshrc_generic
export PATH=$HOME/.config/nvcode/utils/bin:$PATH
export PATH=$HOME/.config/nvcode/utils/bin:$PATH
