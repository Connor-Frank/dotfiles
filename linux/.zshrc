## source general options ##
source ~/.config/zsh/.zshrc_generic

## specific options for linux ##

# macOS-like startup message
ll=$(last -1 $USER | head -1 | cut -c 40-55)
on=$(last -1 $USER | head -1 | cut -c 10-20)
echo "Last login: $ll on $on"

alias name='uname -snrmo'
alias logins='last -f /var/log/wtmp | less'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
