# Auto-completion
autoload -U compinit
compinit

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
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "\e[A" history-beginning-search-backward-end
bindkey "\e[B" history-beginning-search-forward-end

# Aliases
alias l='ls -l'
alias ll='ls -lA'
alias zshrc='vim ~/.zshrc'
alias gobowling='ssh -A alex@bowler'

# Add local paths over /usr/bin
PATH=/usr/local/bin:$PATH

# disable C-s and C-q
stty stop undef
stty start undef

# Fix lost SSH agents
ssh-reagent() {
  for agent in /tmp/ssh-*/agent.*; do
    echo Trying $agent
    export SSH_AUTH_SOCK=$agent
    if $HOME/.bash/timeout3 -t 1 ssh-add -l &> /dev/null; then
      echo Found working SSH Agent:
      ssh-add -l
      return
    else
      echo 'Looks dead; removing'
      rm -r $agent
    fi
  done
  echo Cannot find ssh agent - maybe you should reconnect and forward it?
}

PS1="%{$fg[yellow]%}%~%{$reset_color%} $ "

clear;
