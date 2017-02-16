# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="frisk"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

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
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git github pyenv z)

source $ZSH/oh-my-zsh.sh

export PATH=$PATH:$HOME/bin

if [ `uname -o` = "Cygwin" ]; then
    export DISPLAY=:0.0
    proxy=proxy.mazdausa.com:80

    export http_proxy=$proxy
    export HTTP_PROXY=$proxy
        
    export https_proxy=$proxy
    export HTTPS_PROXY=$proxy
fi

# Customize to your needs...
source $HOME/.aliases
source $HOME/.functions

# This file is not tracked in the repo and is used to store sensitive info
source $HOME/.profile

export EDITOR=/usr/bin/vim

PYTHONDONTWRITEBYTECODE=True
export PYTHONDONTWRITEBYTECODE

BREWERYDB_API=a45c140826828cc4f7518818b714e17f
export BREWERYDB_API

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

# added by travis gem
[ -f /home/chris/.travis/travis.sh ] && source /home/chris/.travis/travis.sh

if [[ `uname -n` == 'chips.whatbox.ca' ]]; then
    source ~/env/bin/activate
fi

# ------------------------------------------------------------------
# Set git config settings
# ------------------------------------------------------------------
git config --global ghi.token $GH_TOKEN
git config --global ghi.editor vim
git config --global user.name $GH_NAME
git config --global user.email $GH_EMAIL
git config --global alias.co checkout
git config --global alias.ci commit -a
git config --global alias.pretty-log 'log --graph --pretty=format:"%Cred%h%Creset%C(bold yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset"'
git config --global commit.verbose true

