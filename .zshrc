# Auto-completion
autoload -U compinit
compinit

# Don't auto-complete these
alias mv='nocorrect mv'
alias sudo='nocorrect sudo'
alias which='nocorrect which'

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
alias gobowling='ssh-add && ssh -A alex@bowler'
alias active='vim ~/notes/active.mdown'
alias passive='vim ~/notes/passive.mdown'
alias random='vim ~/notes/random.mdown'
alias todo='vim ~/notes/todo.mdown'
alias work='vim ~/notes/work.mdown'

alias cdc='cd ~/causes'
alias stark='cd ~/stark'

# Add paths in order: ~/local, /usr/local
PATH=~/local/bin:$PATH
PATH=/usr/local/bin:$PATH
PATH=$HOME/local/bin:$PATH

# disable C-s and C-q
stty stop undef
stty start undef

# Faster, Ruby, kill, kill!
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=100000000
export RUBY_HEAP_FREE_MIN=500000

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

clear;
