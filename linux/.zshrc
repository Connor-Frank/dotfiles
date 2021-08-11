## source general options ##
source ~/.config/zsh/.zshrc_generic

## specific options for linux ##

alias name='uname -snrmo'
alias logins='last -f /var/log/wtmp | less'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
