#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#PS1='[\u@\h \W]\$ '
#PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'

export EDITOR="vim"
#PATH=/home/kreso/Packages/mpich2-install/bin:$PATH;
#export PATH
#export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true"

if [ -t 0 -a -t 1 ]; then
    #kill flow control
    stty -ixon
    stty -ixoff
    if [ ${BASH_VERSINFO[0]} -ge 4 ]; then
        shopt -s cdspell
        shopt -s extglob
        shopt -s cmdhist
        shopt -s checkwinsize
        shopt -s no_empty_cmd_completion
        shopt -u promptvars
        shopt -s histappend
        set -o noclobber
        shopt -s dirspell
        #don't echo ^C
        stty -ctlecho
    fi
fi

if [ "$TERM" = "linux" ]; then
    #Black / Light black
    echo -en "\e]P0222222"
    echo -en "\e]P8666666"
    #Red / Light red
    echo -en "\e]P1cc4747"
    echo -en "\e]P9bf5858"
    #Green / Light green
    echo -en "\e]P2a0cf5d"
    echo -en "\e]PAb8d68c"
    #Yellow / Light yellow
    echo -en "\e]P3e0a524"
    echo -en "\e]PBedB85c"
    #Blue / Light blue
    echo -en "\e]P44194d9"
    echo -en "\e]PC60aae6"
    #Purple / Light purple
    echo -en "\e]P5cc2f6e"
    echo -en "\e]PDdb588c"
    #Cyan / Light cyan
    echo -en "\e]P66d878d"
    echo -en "\e]PE42717b"
    #White / Light white...?
    echo -en "\e]P7dedede"
    echo -en "\e]PFf2f2f2"

     #this is an attempt at working utf8 line drawing chars in the linux-console
#    export TERM=linux+utf8
    clear #hmm, yeah we need this or else we get funky background collisions
fi


alias ls="ls -hF --color"
alias ll="ls -l"
alias la="ls -a"


function mkcd() { mkdir "$1" && cd "$1"; }
function calc(){ awk "BEGIN{ print $* }" ;}
function hex2dec { awk 'BEGIN { printf "%d\n",0x$1}'; }
function dec2hex { awk 'BEGIN { printf "%x\n",$1}'; }
function mktar() { tar czf "${1%%/}.tar.gz" "${1%%/}/"; }
function findf() { find . -type f -iname '*'$*'*' -ls; }
function findexec() { find . -type f -iname '*'${1:-}'*' -exec ${2:-file} {} \;; }


#Different colors for remote server
if [ -z "$SSH_TTY" ]; then
    PS1="\[\033[36m\]\u\[\033[37m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]$ "
else
    PS1="\[\033[35m\]\u\[\033[37m\]@\[\033[31m\]\h:\[\033[34;1m\]\w\[\033[m\]$ "
fi

for f in '/usr/share/bash-completion/bash_completion' '/etc/bash_completion'; do
    if [ -e "$f" ]; then
        . "$f"
    fi
done
