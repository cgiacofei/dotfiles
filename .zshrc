# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="frisk"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git github pyenv)

source $ZSH/oh-my-zsh.sh

# ------------------------------------------------------------------
# Non oh-my-zsh stuff starts here
# ------------------------------------------------------------------
source $HOME/.aliases
source $HOME/.functions

export PATH=$PATH:$HOME/bin
export EDITOR=/usr/bin/vim
export PYTHONDONTWRITEBYTECODE=True
export TZ=/usr/share/zoneinfo/America/New_York

# ------------------------------------------------------------------
# Setup SSH agent
# ------------------------------------------------------------------
SSH_ENV="$HOME/.ssh/environment"

function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

alias script_update='sh $HOME/.scripts/tools/install.sh'
if [[ -f $HOME/.script_update ]] ; then
    MOD=$(date -r $HOME/.script_update +%s)
    NOW=$(date +%s)
    DAYS=days=$(expr \( $NOW - $MOD \) / 86400)

    if [[ $DAYS -gt 7 ]] ; then
        sh $HOME/.scripts/tools/install.sh
        touch $HOME/.script_update
    fi
else
    sh $HOME/.scripts/tools/install.sh
    touch $HOME/.script_update
fi

# Emulate bash PROMPT_COMMAND
direnv_hook () {
    eval "$PROMPT_COMMAND"
}
[[ -z $precmd_functions ]] && precmd_functions=()
precmd_functions=($precmd_functions direnv_hook)

# This file is not tracked in the repo and is used to store sensitive info
source $HOME/.profile

# ------------------------------------------------------------------
# Set git config settings
# ------------------------------------------------------------------
git config --global ghi.token $GH_TOKEN
git config --global ghi.editor vim
git config --global user.name $GH_NAME
git config --global user.email $GH_EMAIL
git config --global alias.co checkout
git config --global alias.ci 'commit -a'
git config --global alias.pretty-log 'log --graph --pretty=format:"%Cred%h%Creset%C(bold yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset"'
git config --global commit.verbose true
