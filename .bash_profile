# Include .bashrc
if [[ -f $HOME/.bashrc ]]; then
	. $HOME/.bashrc
fi

# Include bash aliases
if [[ -f $HOME/.bash_aliases ]]; then
	. $HOME/.bash_aliases
fi

# Load rbenv to manage Ruby versions on startup
eval "$(rbenv init -)"

# Add $HOME/bin to path
export PATH="$HOME/bin:$PATH"

# MacPorts Installer addition on 2023-04-09_at_20:57:46: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

# Change prompt to host and working directory
# export PS1="\e[1;32m\u@\h\e[97m:\e[34m\W\e[0;97m \$ "
export PS1="\u@\h:\W \$ "

## Bindings for tab completion
# If there are multiple matches for completion, Tab should cycle through them
bind 'TAB:menu-complete'
# And Shift-Tab should cycle backwards
bind '"\e[Z": menu-complete-backward'

# Display a list of the matching files
bind "set show-all-if-ambiguous on"

# Perform partial (common) completion on the first Tab press, only start
# cycling full results on the second Tab press (from bash version 5)
bind "set menu-complete-display-prefix on"

# Cycle through history based on characters already typed on the line
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

# Keep Ctrl-Left and Ctrl-Right working when the above are used
bind '"\e[1;5C":forward-word'
bind '"\e[1;5D":backward-word'

