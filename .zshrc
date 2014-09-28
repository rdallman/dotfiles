
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="kolo"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
 export UPDATE_ZSH_DAYS=7

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git github fasd go heroku systemadmin)

source $ZSH/oh-my-zsh.sh

# VI mode
#bindkey -v
#bindkey -M vicmd '/' history-incremental-search-backward

#aliases
#everybody
alias vi=vim
alias gi='go install'
alias gir='go install && `basename $PWD`'

alias squash='git fetch origin && git rebase -i HEAD~`git cherry -v origin/master | wc -l | tr -d " "`'

alias tmux='tmux -2'

#mac attack
alias bb='brew update && brew upgrade'

#linux
alias uu='sudo apt-get update && sudo apt-get -y upgrade && sudo apt-get -y dist-upgrade'

export GOPATH=$HOME/Dev/gocode
export GOROOT=/usr/local/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
