#!/usr/bin/bash
# Source as . $HOME/dotfiles/install.sh

# Make sure errors are caught
set -o errexit
set -o nounset
set -o pipefail

# Get sudo password for Linux package manager commands
[[ "$(uname -v)" =~ Ubuntu ]] && read -sp 'Enter the sudo password: ' PW

# Array of dot files to source
files=(.bash_aliases .bash_profile .bashrc .gitconfig .gitignore_global .inputrc .vimrc .vim)

# Define paths for dotfiles
OLD_DOTFILES="$HOME/.olddotfiles"
DOTFILES="$HOME/.dotfiles"

echo -e "\nChecking paths to dotfiles...\n"
# Get the parent directory of install.sh
curr_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ -e $DOTFILES ]]; then
    # If the current directory is NOT already $DOTFILES, then clear $DOTFILES and move everything there
    if ! [[ $curr_dir -ef $DOTFILES ]]; then
        rm -rfv $DOTFILES 
        mv -v $curr_dir $DOTFILES
    fi
else
    # Make $DOTFILES and move everything there
    mv -v $curr_dir $DOTFILES
fi


# If $OLD_DOTFILES doesn't already exist, then create it
[[ -d $OLD_DOTFILES ]] || mkdir -v $OLD_DOTFILES
echo -e "Done...\n"

# Move any existing dotfiles in $HOME to $OLD_DOTFILES, then create new symlinks from $HOME to $DOTFILES
echo -e "Moving any existing dotfiles from $HOME to $OLD_DOTFILES & creating symlinks to $DOTFILES...\n"
for file in "${files[@]}"; do
    # If a same-named file already exists in $HOME:
    # 1. Remove it, if it is a symlink or 
    # 2. Move it, if it's anything else
    if [[ -L "$HOME/$file" ]]; then
            rm -rfv "$HOME/$file"
    elif [[ -e "$HOME/$file" ]]; then
            mv -v "$HOME/$file" "$OLD_DOTFILES/$file"
    fi
    # Create a new symlink at $HOME to $file
    ln -snfv "$DOTFILES/$file" "$HOME/$file"
done
echo -e "Done...\n"

# Some SSH configuration
echo -e "Configuring .ssh/ for future logins...\n"
[[ -d "$HOME/.ssh/keys" ]] || mkdir -p "$HOME/.ssh/keys"
[[ -e "$HOME/.ssh/config" ]] || touch "$HOME/.ssh/config"
[[ -e "$HOME/.ssh/authorized_keys" ]] || touch "$HOME/.ssh/authorized_keys"
   
 # Check for my public key
 if ! grep -wq "sid@home" "$HOME/.ssh/authorized_keys"; then
    echo -e "Attempting to add public key...\n"
    # Add my public key to trust future remote logins
    if [[ -f "$DOTFILES/.public_key" ]]; then
        cat "$DOTFILES/.public_key" >> "$HOME/.ssh/authorized_keys"
    fi
    echo -e "Done...\n"
fi

# Install necessary packages
if [[ "$(uname -v)" =~ Ubuntu ]]; then
    pkgs=(ripgrep bat fzf fd-find)
    echo -e "Installing packages:\n"
    printf '%s\n' "${pkgs[@]}"

    # Passes $PW obtained at start into each sudo call
    echo $PW | sudo apt -y update
    echo $PW | sudo apt -y upgrade
    echo $PW | sudo apt install "${pkgs[@]}"
    echo -e "Done...\n"
fi


echo -e "Installing vim plugins...\n"
# Vim ex mode and silent mode, load my .vimrc, execute PlugInstall from vim-plug, and then quit
vim -es -u "$HOME/.vimrc" -i NONE -c "PlugInstall" -c "qa"

# Symlink vim colorscheme after gruvbox plugin is installed
echo -e "Linking gruvbox colorscheme...\n"
ln -snfv "$HOME/.vim/plugged/gruvbox/colors/gruvbox.vim" "$HOME/.vim/colors/gruvbox.vim"
echo -e "Done...\n"

echo -e "\nSourcing $HOME/.bash_profile...\n"
. "$HOME/.bash_profile"

echo -e "Finished!\n"
