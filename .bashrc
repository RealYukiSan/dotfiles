#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[hemlo@\h \W]\$ '
alias screenoff="xset dpms force suspend"
alias suspend="systemctl suspend"
alias hibernate="systemctl hibernate"
alias chromium_nnn='XDG_CURRENT_DESKTOP=KDE chromium'
alias chromium_proxy='chromium --proxy-server="http://127.0.0.1:8085" --ignore-certificate-errors-spki-list --incognito'
alias PowerTunnel='java -jar /opt/PowerTunnel/PowerTunnel.jar -console'
