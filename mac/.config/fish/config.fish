## source general config ##
source ~/.config/fish/config_general.fish

## specific options for mac ##

alias pubip='curl ifconfig.me; echo'

# vscode insiders runs on M1 but i want to use it the same way as the traditional one
alias code='code-insiders'

# launch vscode insiders at current directory and close terminal
alias vs='code-insiders . && exit'

# x86 homebrew
alias xbrew='arch -x86_64 /usr/local/bin/brew'
# this is the way i always run this package, so i created an alias
alias mac_info='osx-cpu-temp -c -g -f -F'

test -e /Users/connorfrank/.iterm2_shell_integration.fish ; and source /Users/connorfrank/.iterm2_shell_integration.fish ; or true
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
set -g fish_user_paths "/opt/homebrew/opt/qt/bin" $fish_user_paths
set -g fish_user_paths "/opt/homebrew/opt/curl/bin" $fish_user_paths
set -g fish_user_paths "/opt/homebrew/opt/python@3.8/bin" $fish_user_paths
