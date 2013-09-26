# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

ZSH_THEME="kolo"

#rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

#completions
fpath=(/usr/local/share/zsh-completions $fpath)

# autojump
autoload -U compinit && compinit
export AUTOJUMP_IGNORE_CASE=1


#suggestions
autoload -U predict-on
zle -N predict-on
zle -N predict-off
bindkey '^Z' predict-on
bindkey '^X^Z' predict-off
zstyle ':predict' verbose 'yes'

bindkey -v

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
 export UPDATE_ZSH_DAYS=13

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
plugins=(git autojump brew github zsh-syntax-highlighting sublime rbenv rails4 rake ruby heroku go osx)

source $ZSH/oh-my-zsh.sh

#rbenv
eval "$(rbenv init -)"

# Customize to your needs...
export PATH=~/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
#export PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"

### GO
export GOROOT=/usr/local/go
export GOPATH=$HOME/Dev/gocode
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
