#!/bin/bash

# Check if a command exists
cmd_exist () {
    builtin type -P "$1" &> /dev/null
}

# Aliases
# Enable alias expansion even when shell is non-interactive to access aliases across system
shopt -s expand_aliases

# Functions{{{

# Create and change into directory
mk() {
	mkdir $1 && cd $1
}

# Change into .dotfiles directory and commit changes
updot() {
	cd $HOME/.dotfiles;
	git add . && git commit -m "$1" && git push origin main;
	cd -
}
# }}}

# Command line {{{
alias sudo='sudo '
if cmd_exist rg; then
	alias grep='rg'
fi
if cmd_exist bat; then
	alias cat='bat'
	alias less='bat'
fi

alias ..='cd ..'
alias ...='cd ../..'
alias cdr='cd ~/repos'
alias cd.='cd ~/.dotfiles'
alias ls='ls -FG'
alias la='ls -aFG'
alias ll='ls -lFG' 
alias lla='ls -laFG'
alias l.='ls -dFG .*'
alias ll.='ls -ldFG .*'
alias .b='. ~/.bash_profile'
# }}}

# Vim{{{
alias v='vim'
alias va='vim *'
alias vvrc='vim ~/.vimrc'
alias vbsh='vim ~/.bash_profile ~/.bashrc ~/.bash_aliases ~/.vimrc ~/.inputrc ~/.dotfiles/install.sh'
alias vbp='vim ~/.bash_profile'
alias vbrc='vim ~/.bashrc'
alias vba='vim ~/.bash_aliases'
# }}}

# Git{{{
gca() {
	git add . && git commit -m "$1";
}
alias gc='git commit -m'
alias gs='git status'
alias ga='git add'
alias gl='git log --pretty=oneline'
alias gll='git log --pretty=format:"[%h] %ae, %ar: %s" --stat'
alias gd='git diff --color-words'
alias gpo='git push origin'
alias gplo='git pull origin'
alias gra='git remote add'
alias gb='git branch'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gm='git merge'
alias gcl='git clone'
alias gg='git log --oneline --abbrev-commit --all --graph --decorate --color'
# }}}

# Docker{{{
alias d='docker'
alias dps='docker ps'
alias di='docker image'
alias dils='docker image ls'
alias dc='docker container'
alias dcr='docker container run'
alias drm='docker rm'
alias dv='docker volume'
alias dcc='docker compose'
alias dccu='docker compose up'
alias dccud='docker compose up -d'
alias dccd='docker compose down'
# }}}

# Kubernetes{{{
if cmd_exist kubectl; then
	# Set up autocompletion and shortcut
	source <(kubectl completion bash)
	alias k='kubectl'
	alias kg='kubectl get'
	alias kgp='kubectl get pods'
	alias kgn='kubectl get nodes'
	alias kgsvc='kubectl get svc'
	alias kd='kubectl describe'
	alias kdp='kubectl describe pods'
	alias kdn='kubectl describe nodes'
	alias kdsvc='kubectl describe svc'
	alias ka='kubectl apply'
	alias kaf='kubectl apply -f'
	alias krm='kubectl delete'
	alias krmp='kubectl delete pods'
	alias krmn='kubectl delete nodes'
	alias krmsvc='kubectl delete svc'
	alias dry='--dry-run=client -o yaml'
	complete -o default -F __start_kubectl k
fi
# }}}

# Multipass{{{
alias m='multipass'
# }}}
