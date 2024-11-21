#!/bin/bash

# Check if a command exists
cmd_exist () {
    builtin type -P "$1" &> /dev/null
}

# Aliases
# AWS{{{
alias ae="aws ec2 "
alias aec="aws ec2 create-"
alias aed="aws ec2 describe-"
alias aeg="aws ec2 get-"
alias asl="aws sso login"
# }}}

# Command line {{{
# Create and change into directory
mk() {
    mkdir $1 && cd $1
}

if cmd_exist rg; then
    alias grep='rg'
fi
if [[ "$(uname -v)" =~ Ubuntu ]]; then
    if cmd_exist fdfind; then
        alias fd='fdfind'
    fi
    if cmd_exist batcat; then
        alias cat='batcat'
        alias less='batcat'
    fi
elif [[ "$(uname -v)" =~ Darwin ]]; then
    if cmd_exist bat; then
        alias cat='bat'
        alias less='bat'
    fi
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

# Docker{{{
alias d='docker'
alias dc='docker container'
alias dcc='docker compose'
alias dccd='docker compose down'
alias dccu='docker compose up'
alias dccud='docker compose up -d'
alias dcls='docker container ls'
alias dcr='docker container run'
alias di='docker image'
alias dils='docker image ls'
alias dn='docker network'
alias dnls='docker network ls'
alias dps='docker ps'
alias dr='docker run'
alias dri='docker run -it'
alias drm='docker rm'
alias dv='docker volume'
alias dvls='docker volume ls'
# }}}

# Git{{{
# Change into .dotfiles directory and commit changes
updot() {
    if [[ $# -lt 1 ]]; then
        printf "%s\n\n" "This function adds, commits, and pushes all changes made to the ~/.dotfiles repo"
        printf "%s\n" "Usage: updot \"commit message\"";
        return 1
    fi

    cd "$HOME/.dotfiles" || { echo "No ~/.dotfiles directory found" && return 1; };
    git add . && git commit -m "$1" && git push origin main;
    cd - || return 1;
}

gca() {
    git add . && git commit -m "$1";
}
alias ga='git add'
alias gb='git branch'
alias gbd='git branch -d'
alias gc='git commit -m'
alias gcam='git commit --amend'
alias gcb='git checkout -b'
alias gco='git checkout'
alias gcom='git checkout main'
alias gcl='git clone'
alias gd='git diff --color-words'
alias gdm='git diff --color-words main'
alias gf='git fetch'
alias gfo='git fetch origin'
alias gg='git log --oneline --abbrev-commit --all --graph --decorate --color'
alias gl='git log --pretty=oneline'
alias gll='git log --pretty=format:"[%h] %ae, %ar: %s" --stat'
alias gm='git merge'
alias gmm='git merge main'
alias gpl='git pull'
alias gplo='git pull origin'
alias gp='git push'
alias gpo='git push origin'
alias gpom='git push origin main'
alias grb='git rebase -i'
alias gra='git remote add'
alias gs='git status'
alias gt='git tag -a'
alias gtd='git tag -d'
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
alias ml='multipass launch'
alias mls='multipass list'
alias msh='multipass shell'
alias mst='multipass start'
alias msp='multipass stop'
alias md='multipass delete'
alias mdp='multipass delete --purge'
alias mp='multipass purge'
# }}}

# Python{{{
alias p='python3'
# }}}

# Vim{{{
alias v='vim'
alias v\*='vim *'
alias vvrc='vim ~/.dotfiles/.vimrc'
alias v.='vim ~/.dotfiles/.bash_profile ~/.dotfiles/.bashrc ~/.dotfiles/.bash_aliases ~/.dotfiles/.vimrc ~/.dotfiles/.inputrc ~/.dotfiles/install.sh'
alias vbp='vim ~/.dotfiles/.bash_profile'
alias vbrc='vim ~/.dotfiles/.bashrc'
alias vba='vim ~/.dotfiles/.bash_aliases'
alias vft='vim ~/.vim/ftplugin/*'
# }}}




