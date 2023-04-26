# Include .bashrc
[[ -f $HOME/.bashrc ]] && . $HOME/.bashrc

# Include bash aliases
[[ -f $HOME/.bash_aliases ]] && . $HOME/.bash_aliases

# Include bash key bindings
[[ -f $HOME/.bash_key_bindings ]] && . $HOME/.bash_key_bindings

# Load rbenv to manage Ruby versions on startup
eval "$(rbenv init -)"

# Add $HOME/bin to path
export PATH="$HOME/bin:$PATH"

# MacPorts Installer addition on 2023-04-09_at_20:57:46: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

# Change prompt to host and working directory
# export PS1="\e[1;32m\u@\h\e[97m:\e[34m\W\e[0;97m \$ "
export PS1="\u@\h:\W \$ "


