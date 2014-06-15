#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR="gvim"
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export QT_STYLE_OVERRIDE=gtk

eval $(ssh-agent -s) > /dev/null
