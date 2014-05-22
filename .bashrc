#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR="gvim"
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

eval $(ssh-agent -s) > /dev/null
