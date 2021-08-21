## source general config ##
source $HOME/.config/zsh/.zshrc_generic

eval "$(pyenv init -)"
eval $(thefuck --alias)

## specific options for mac ##

alias update='brew update && brew upgrade --fetch-HEAD'

alias s='source ~/.zshrc > /dev/null 2>&1'

alias build-cmake='~/.local/bin/cmake/build-cmake'
alias run-cmake='~/.local/bin/cmake/run-cmake'
alias git-update='~/.local/bin/git-update'
alias git-clean='~/.local/bin/git-clean'

alias pubip='curl ifconfig.me; echo'

# x86 homebrew
alias xbrew='arch -x86_64 /usr/local/bin/brew'
# this is the way i always run this package, so i created an alias
alias mac_info='osx-cpu-temp -c -g -f -F'

export PATH=$HOME/.config/nvim/utils/bin:$PATH
export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"
export GROOVY_HOME=/opt/homebrew/opt/groovy/libexec

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
