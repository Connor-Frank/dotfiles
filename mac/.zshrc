## source general config ##
source ~/.zshrc_generic

## specific options for mac ##

# macOS prompt
export PS1='%n@%m %1~ %# '

alias pubip='curl ifconfig.me; echo'

# x86 homebrew
alias xbrew='arch -x86_64 /usr/local/bin/brew'
# this is the way i always run this package, so i created an alias
alias mac_info='osx-cpu-temp -c -g -f -F'
