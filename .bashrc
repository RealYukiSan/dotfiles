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

export PATH="/home/reyuki/Android/Sdk/ndk/26.2.11394342/:/home/reyuki/Android/Sdk/cmdline-tools/latest/bin/:/home/reyuki/Android/Sdk/platform-tools/:/home/reyuki/Android/Sdk/build-tools/34.0.0:$PATH"
#export LD_LIBRARY_PATH="/usr/local/lib"

