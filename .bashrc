# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[hemlo@\h \W]\$ '
alias screenoff="xset dpms force suspend"
alias suspend="systemctl suspend"
alias hibernate="systemctl hibernate"
alias chromium_proxy='chromium --proxy-server="http://127.0.0.1:8085" --ignore-certificate-errors-spki-list --incognito'
alias PowerTunnel='java -jar /opt/PowerTunnel/PowerTunnel.jar -console'

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export PATH="/home/reyuki/Android/Sdk/ndk/26.2.11394342/:/home/reyuki/Android/Sdk/cmdline-tools/latest/bin/:/home/reyuki/Android/Sdk/platform-tools/:/home/reyuki/Android/Sdk/build-tools/34.0.0:/opt/VSCode-linux-x64/bin/:$PATH"
#export LD_LIBRARY_PATH="/usr/local/lib"
export EDITOR='nvim' # for git editor

# pnpm
export PNPM_HOME="/home/reyuki/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# https://superuser.com/a/664061/1867794
# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# https://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history

# https://askubuntu.com/a/667787
HISTCONTROL=ignoredups:erasedups
shopt -s histappend
PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"
