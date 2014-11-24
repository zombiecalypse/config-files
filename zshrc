# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="dst"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

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
plugins=(gitfast ruby bundler rails autopep8 fasd catimg command-not-found coffee debian gem git-extras github jsontools lein pip python rvm sudo tmux vi-mode web-search)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="$PATH:/home/aaron/.cabal/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/aaron/config/bin"
# export MANPATH="/usr/local/man:$MANPATH"

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

unsetopt correct_all

export VISUAL=vim
export EDITOR=$VISUAL

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
alias p="git status"
alias gl="git log"

export PATH="$PATH:$HOME/.rvm/bin:$HOME/.bin" # Add RVM to PATH for scripting

if [ -f /usr/share/autojump/autojump.sh ]; then
  . /usr/share/autojump/autojump.sh
else
  echo "Please install autojump"
fi


autoload -U compinit && compinit -u

export pa="/home/akarper/Projects/Puzzle/weal_rails/"
export pav="/home/akarper/Projects/Puzzle/Versand_Modul/"
export pat="/home/akarper/Projects/Puzzle/weal_test/"
alias time="/usr/bin/time"
alias p='git status'
alias o='xdg-open'
alias pa='cd $pa'
alias pat='cd $pat'
alias pav='cd $pav'
alias ls='ls -h'
alias ll='ls -lh'

alias opa='oproj $pa'
alias gvim='UBUNTU_MENUPROXY= gvim'
alias opav='oproj $pav'

function flux() {
  ( "$@" 2>&1 >/dev/null & )
}
alias gl='git log'
alias gt='git tree'
alias gc='git cola'
alias clip='xclip -i -selection clipboard'
export GREP_COLOR='01;31'
alias today="date +'%y-%m-%d' "
zstyle ':completion:*' use-cache on
alias tst="rspec \`git diff-index HEAD --name-only | grep _spec.rb\`"
alias rc='rails c'
alias rs='rails s'
alias :q="echo \"Calm down, you're not in vim\""
alias gg='gitg'
alias clip='xclip -selection clipboard'
alias push='rspec spec && git push'
alias z='j'
alias ack='ack-grep'
export GOPATH=$GOPATH:~/.gopath:.
export PATH=$PATH:/usr/share/go/bin

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down
unalias ag
