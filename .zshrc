# Auto-completion
autoload -U compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Don't auto-complete these
alias mv='nocorrect mv'
alias sudo='nocorrect sudo'
alias which='nocorrect which'
alias knife='nocorrect knife'
alias bundle='nocorrect bundle'
alias grunt='nocorrect grunt'
alias rails='bundle exec rails'

# Colorful
autoload -U colors
colors

# Word boundaries
autoload -U select-word-style
select-word-style bash

# Random settings
setopt autocd
setopt autoparamslash
setopt correct
setopt correctall
setopt noflowcontrol
setopt nonomatch
setopt histignorealldups
setopt histignorespace
setopt histverify
setopt sharehistory
setopt PROMPT_SUBST

# History
export HISTSIZE=100000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE
autoload history-search-end

# Quick history searching
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "\e[A" history-beginning-search-backward-end
bindkey "\e[B" history-beginning-search-forward-end

# Aliases
alias l='ls -l'
alias ll='ls -lA'
alias rc='rails console'
alias zshrc='vim ~/.zshrc'
alias refresh-master='git fetch && git reset --hard origin/master && git sub update --init'

# Add paths in order: ~/local, /usr/local
PATH=~/bin:$PATH
PATH=~/local/bin:$PATH
PATH=/usr/local/bin:$PATH
PATH=$HOME/local/bin:$PATH
PATH=$HOME/Library/Python/2.7/bin:$PATH

# disable C-s and C-q
stty stop undef
stty start undef
stty -ixon

# Fix lost SSH agents
ssh-reagent () {
  for agent in /tmp/ssh-*/agent.*; do
    export SSH_AUTH_SOCK=$agent
    if ssh-add -l 2>&1 > /dev/null; then
      echo Found working SSH Agent:
      ssh-add -l
      return
    fi
  done
  echo "Cannot find ssh agent - maybe you should reconnect and forward it?"
}

PS1="%{$fg[yellow]%}%~%{$reset_color%} $ "

if [ -f "${HOME}/.gpg-agent-info" ]; then
  . "${HOME}/.gpg-agent-info"
  export GPG_AGENT_INFO
  export SSH_AUTH_SOCK
fi
export GPG_TTY=$(tty)

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export NVM_DIR="/Users/alex/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

clear;
