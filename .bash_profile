#!/bin/bash

# Check if a command exists
cmd_exist () {
    builtin type -P "$1" &> /dev/null
}
# Append to $PATH if not already present
pathappend() {
    for ARG in "$@"; do
        if [ -d "$ARG" ] && [[ ":$PATH:" != *":$ARG:"* ]]; then
            PATH="${PATH:+"$PATH:"}$ARG"
        fi
    done
    export PATH
}
# Prepend to $PATH if not already present
pathprepend() {
    for ((i=$#; i>0; i--)); do
        ARG=${!i}
        if [ -d "$ARG" ] && [[ ":$PATH:" != *":$ARG:"* ]]; then
            PATH="$ARG${PATH:+":$PATH"}"
        fi
    done
    export PATH
}

# Include .bashrc
[[ -f $HOME/.bashrc ]] && . $HOME/.bashrc

# Include bash aliases
[[ -f $HOME/.bash_aliases ]] && . $HOME/.bash_aliases

# Include bash autocompletion
[[ -f /usr/local/etc/bash_completion ]] && . /usr/local/etc/bash_completion

# Load rbenv to manage Ruby versions on startup
if cmd_exist rbenv; then
    eval "$(rbenv init -)"
fi

# Export home directory for Java Tomcat
if cmd_exist catalina; then
    export CATALINA_HOME=/usr/local/Cellar/tomcat/10.1.8/libexec
fi

# Add $HOME/bin to path
pathprepend "$HOME/bin"

# Change prompt to host and working directory
# export PS1="\e[1;32m\u@\h\e[97m:\e[34m\W\e[0;97m \$ "
export PS1="\u@\h:\W \$ "


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && . "$HOME/.sdkman/bin/sdkman-init.sh"
