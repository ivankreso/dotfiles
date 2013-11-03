#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return
# start tmux session
[[ -z "$TMUX" ]] && exec tmux


export EDITOR="vim"
export VISUAL=gvim
export HISTIGNORE="&:[bf]g:exit"
export HISTCONTROL=ignoredups
export HISTFILESIZE=10000
export HISTSIZE=10000
export BROWSER=chromium
export PAGER=less
export MANPAGER=less

# less man page colors
export GROFF_NO_SGR=1
export LESS="FRSXQ"
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
export LESS_TERMCAP_ue=$'\E[0m'

# grep colors
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'

#export PATH=/home/kreso/Packages/mpich2-install/bin:$PATH;
#export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true"
#export PYTHONPATH=$PYTHONPATH:/usr/lib/python3.3/site-packages      - conflicts with python2


# aliases
alias cmakedebug='cmake $1 -DCMAKE_BUILD_TYPE=Debug'
alias cmakerelease='cmake $1 -DCMAKE_BUILD_TYPE=Release'
#alias nautilus="nautilus --no-desktop"
#alias pacman="pacman-color"

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

    clear #hmm, yeah we need this or else we get funky background collisions
fi


alias ls="ls -hF --color"
alias ll="ls -l"
alias la="ls -la"


function mkcd() { mkdir "$1" && cd "$1"; }
function calc(){ awk "BEGIN{ print $* }" ;}
function hex2dec { awk 'BEGIN { printf "%d\n",0x$1}'; }
function dec2hex { awk 'BEGIN { printf "%x\n",$1}'; }
function mktar() { tar czf "${1%%/}.tar.gz" "${1%%/}/"; }
function findf() { find . -type f -iname '*'$*'*' -ls; }
function findexec() { find . -type f -iname '*'${1:-}'*' -exec ${2:-file} {} \;; }


#Different colors for remote server
#if [ -z "$SSH_TTY" ]; then
#    PS1="\[\033[36m\]antares\[\033[37m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]$ "
#else
#    PS1="\[\033[35m\]antares\[\033[37m\]@\[\033[31m\]\h:\[\033[34;1m\]\w\[\033[m\]$ "
#fi
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

