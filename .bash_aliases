#!/bin/bash

# Check if a command exists
cmd_exist () {
    builtin type -P "$1" &> /dev/null
}

# Aliases

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

# Vim{{{
alias v='vim'
alias v*='vim *'
alias vvrc='vim ~/.dotfiles/.vimrc'
alias v.='vim ~/.dotfiles/.bash_profile ~/.dotfiles/.bashrc ~/.dotfiles/.bash_aliases ~/.dotfiles/.vimrc ~/.dotfiles/.inputrc ~/.dotfiles/install.sh'
alias vbp='vim ~/.dotfiles/.bash_profile'
alias vbrc='vim ~/.dotfiles/.bashrc'
alias vba='vim ~/.dotfiles/.bash_aliases'
# }}}

# Git{{{
# Change into .dotfiles directory and commit changes
updot() {
        cd "$HOME/.dotfiles";
        git add . && git commit -m "$1" && git push origin main;
        cd -
}

gca() {
        git add . && git commit -m "$1";
}
alias gc='git commit -m'
alias gs='git status'
alias ga='git add'
alias gl='git log --pretty=oneline'
alias gll='git log --pretty=format:"[%h] %ae, %ar: %s" --stat'
alias gd='git diff --color-words'
alias gf='git fetch'
alias gp='git push'
alias gpl='git pull'
alias gfo='git fetch origin'
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
alias ml='multipass list'
alias mst='multipass start'
alias msp='multipass stop'
alias md='multipass delete'
alias mdp='multipass delete --purge'
# }}}
