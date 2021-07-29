# colors
set     red="%{\033[1;31m%}"
set   green="%{\033[0;32m%}"
set  yellow="%{\033[1;33m%}"
set    blue="%{\033[1;34m%}"
set magenta="%{\033[1;35m%}"
set    cyan="%{\033[1;36m%}"
set   white="%{\033[0;37m%}"
set     end="%{\033[0m%}"

setenv GIT_BRANCH_CMD "sh -c 'git branch --no-color 2> /dev/null' | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1] /'"

set windowtitle = "%{\e]2;%N@%m:%~\a%}"
set prompt="${windowtitle}${blue}%? ${red}[${green}%N${blue}@%m${red}] ${yellow}%c ${cyan}`$GIT_BRANCH_CMD`${white}%%${end} "

unset red green yellow blue magenta cyan white end
