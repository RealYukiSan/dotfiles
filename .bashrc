#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
alias screenoff="xset dpms force suspend"
alias chromium_nnn='XDG_CURRENT_DESKTOP=KDE chromium ""'
