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
[[ $(cmd_exist rbenv) ]] && eval "$(rbenv init -)"

# Export home directory for Java Tomcat
[[  $(cmd_exist catalina) ]] && export CATALINA_HOME=/usr/local/Cellar/tomcat/10.1.8/libexec

# Add $HOME/bin to path
pathprepend "$HOME/bin"

# Change prompt to host and working directory
if [[ "$(uname -v)" =~ Darwin ]]; then
    # [Green]User@Host[White]:[Red]WorkingDirectory[White]$
    export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;31m\]\W\[\033[00m\]\$ '
elif [[ "$(uname -v)" =~ Ubuntu|Fedora ]]
    # [Green]User@Host[White]:[Blue]WorkingDirectory[White]$
    export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
fi


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && . "$HOME/.sdkman/bin/sdkman-init.sh"
