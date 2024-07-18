# If not running interactively, don't do anything
[[ $- != *i* ]] && return

scriptDir=$(dirname -- "$(readlink -f -- "$BASH_SOURCE")")

source "$scriptDir/.aliasrc"
source "$scriptDir/.variablerc"

# https://superuser.com/a/664061/1867794
# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# https://stackoverflow.com/questions/9457233/unlimited-bash-history
HISTFILESIZE=
HISTSIZE=
HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
HISTFILE=~/.bash_eternal_history

alias dedup='history -n; history -w; history -c; history -r;'

# https://askubuntu.com/a/667787
HISTCONTROL=ignoredups:ignorespace:erasedups
shopt -s histappend
shopt -s cmdhist
function historymerge {
    dedup
}
trap historymerge EXIT
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

