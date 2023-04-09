# Aliases
# Filesystem navigation

# Create and change into directory
mk() {
    mkdir $1 && cd $1
}

# Change into .dotfiles directory and commit changes
updot() {
  cd ~/.dotfiles;
  git add . && git commit -m "$1" && git push origin main;
  cd -
}

alias ..='cd ..'
alias ...='cd ../..'
alias cd.='cd ~/.dotfiles'
alias ls='ls -FG'
alias la='ls -aFG'
alias ll='ls -lFG' 
alias lla='ls -laFG'
alias l.='ls -dFG .*'
alias ll.='ls -ldFG .*'
alias sb='source ~/.bashrc'
alias grep='rg'

# Vim
alias v='vim -p'
alias va='vim -p *'
alias vbrc='vim ~/.bashrc'
alias vba='vim ~/.bash_aliases'

# Git
alias gc='git commit -m'
alias gst='git status'
alias ga='git add'
alias gl='git log'
alias gpuo='git push origin'
alias gplo='git pull origin'
alias gra='git remote add'
alias gb='git branch'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gm='git merge'
alias gcl='git clone'
alias gg='git log --oneline --abbrev-commit --all --graph --decorate --color'

# Docker
alias d='docker'
alias dps='d ps'
alias di='d image'
alias dils='d image ls'
alias dc='d container'
alias dcr='d container run'
alias drm='d rm'
alias dv='d volume'
alias dcc='docker compose'
alias dccu='dcc up'
alias dccud='dcc up -d'
alias dccd='dcc down'

# K8s
# Set up autocompletion and shortcut
source <(kubectl completion bash)
alias k='kubectl'
alias kg='k get'
alias kgp='kg pods'
alias kgn='kg nodes'
alias kgsvc='kg svc'
alias kd='k describe'
alias kdp='kd pods'
alias kdn='kd nodes'
alias kdsvc='kd svc'
alias ka='k apply'
alias kaf='ka -f'
alias krm='k delete'
alias krmp='krm pods'
alias krmn='krm nodes'
alias krmsvc='krm svc'
alias dry='--dry-run=client -o yaml'
complete -o default -F __start_kubectl k
