#Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh


# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="daveverwer"

export DEFAULT_USER="reed"

LS_COLORS='di=01;33' ; export LS_COLORS

CORRECT_IGNORE="vim, subl"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
 export UPDATE_ZSH_DAYS=6

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export GOROOT=/usr/local/Cellar/go/1.1.1/
export GOPATH=$GOROOT/bin
export PATH=:/usr/local/bin:/usr/local/sbin:/opt/local/bin:/opt/local/sbin:/$GOPATH:/Users/reed/.rvm/gems/ruby-2.0.0-p0/bin:/Users/reed/.rvm/gems/ruby-2.0.0-p0@global/bin:/Users/reed/.rvm/rubies/ruby-2.0.0-p0/bin:/Users/reed/.rvm/bin:/Applications/Postgres.app/Contents/MacOS/bin:/usr/bin:/bin:/usr/sbin::/usr/local/git/bin:/Users/reed/android-sdks/platform-tools


PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'
