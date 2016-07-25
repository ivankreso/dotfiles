# Path to your oh-my-zsh installation.
export ZSH=/home/kivan/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
ZSH_THEME="gnzh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

#export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
#export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export PYTHONPATH=$PYTHONPATH:~/source/deep-learning/generative/
export PYTHONPATH=$PYTHONPATH:~/source/deep-learning/semantic_segmentation/tensorflow/
export LD_LIBRARY_PATH=/opt/libs/cudnn-7.5-linux-x64-v5.1-rc/lib64:$LD_LIBRARY_PATH


if ! pgrep -u $USER ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-thing
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
    eval $(<~/.ssh-agent-thing)
fi
ssh-add -l >/dev/null || alias ssh='ssh-add -l >/dev/null || ssh-add && unalias ssh; ssh'


alias vim="nvim"
alias ssh="ssh -Y"
alias yaourt_update="yaourt --noconfirm -Syua"


#source .tmux_update_display

## -- Improved X11 forwarding through GNU Screen (or tmux).
## If not in screen or tmux, update the DISPLAY cache.
## If we are, update the value of DISPLAY to be that in the cache.
#function update-x11-forwarding
#{
#    if [ -z "$STY" -a -z "$TMUX" ]; then
#        echo $DISPLAY > ~/.display.txt
#    else
#        export DISPLAY=`cat ~/.display.txt`
#    fi
#}
#
#
# This is run before every command.
#preexec() {
#    # Don't cause a preexec for PROMPT_COMMAND.
#    # Beware!  This fails if PROMPT_COMMAND is a string containing more than one command.
#    #[ "$BASH_COMMAND" = "$PROMPT_COMMAND" ] && return 
#
#    update-x11-forwarding
#
#    # Debugging.
#    #echo DISPLAY = $DISPLAY, display.txt = `cat ~/.display.txt`, STY = $STY, TMUX = $TMUX  
#}
#trap 'preexec' DEBUG

#. /home/kivan/source/libs/build/torch/distro/install/bin/torch-activate

