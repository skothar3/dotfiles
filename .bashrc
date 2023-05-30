#!/bin/bash

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
export HISTSIZE=1000

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

# Check if a command exists
cmd_exist () {
    command -v $1 &> /dev/null
}

# FZF
if cmd_exist fzf; then
	# Enable fzf keybindings for Bash:
	. /opt/local/share/fzf/shell/key-bindings.bash
	# Enable fuzzy auto-completion for Bash:
	. /opt/local/share/fzf/shell/completion.bash
	# Custom fzf defaults
	export FZF_DEFAULT_OPTS="--height 60% --layout=reverse --border --preview 'bat -n --color=always {}'"
	if cmd_exist fd; then
		export FZF_DEFAULT_COMMAND="fd . --hidden --follow --exclude '.git' --ignore-file $HOME/.ignore $HOME"
		export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
	fi
	export FZF_COMPLETION_TRIGGER='--'
fi
