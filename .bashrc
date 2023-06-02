#!/bin/bash

# Check if a command exists
cmd_exist () {
    builtin type -P "$1" &> /dev/null
}

## File aliases
# Open The Linux Cmd Line by W. Stotts
[[ -f  $HOME/Documents/CS/Books/TLCL-19.01.pdf ]] && \
    alias tlcl="open $HOME/Documents/CS/Books/TLCL-19.01.pdf"

# Open Vim reference page via browser
alias vwv='open http://linuxcommand.org/lc3_adv_vimvigor.php'

## Options

# Ignore duplicates in command history and increase
# history size to 1000 lines
export HISTCONTROL=ignoredups
export HISTSIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

## Docker Networking
# Export docker host to Linux VM ubuntu@welcome-liger
# export DOCKER_HOST=tcp://192.168.64.3:2376
# export DOCKER_TLS_VERIFY=1
export DOCKER_HOST=unix:///var/run/docker.sock
# export DOCKER_TLS_VERIFY=0

# Load nvm for Node.js version management
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# FZF
if cmd_exist fzf; then
    # Enable fzf keybindings for Bash:
    if [[ "$(uname -v)" =~ Darwin ]]; then
        . $HOME/.fzf.bash

        # Custom fzf defaults
        export FZF_DEFAULT_OPTS="--height 60% --layout=reverse --border --preview 'bat -n --color=always {}'"
        if cmd_exist fd; then
                export FZF_DEFAULT_COMMAND="fd . --hidden --follow --exclude '.git' --ignore-file $HOME/.ignore"
                export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
        fi
    elif [[ "$(uname -v)" =~ Ubuntu ]]; then
        . /usr/share/doc/fzf/examples/key-bindings.bash

        # Custom fzf defaults
        export FZF_DEFAULT_OPTS="--height 60% --layout=reverse --border --preview 'batcat -n --color=always {}'"
        if cmd_exist fdfind; then
                export FZF_DEFAULT_COMMAND="fdfind . --hidden --follow --exclude '.git' --ignore-file $HOME/.ignore"
                export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
        fi
    fi
    export FZF_COMPLETION_TRIGGER='--'
fi
