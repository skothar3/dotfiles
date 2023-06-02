#!/bin/bash
# Source as . $HOME/dotfiles/install.sh

# Get sudo password for Linux package manager commands
[[ "$(uname -v)" =~ Ubuntu ]] && read -sp 'Enter the sudo password: ' PW

# Array of dot files to source
files=(.bash_aliases .bash_profile .bashrc .gitconfig .gitignore_global .inputrc .vimrc .vim)

# Define paths for dotfiles
OLD_DOTFILES=$HOME/.olddotfiles
DOTFILES=$HOME/.dotfiles

echo -e "\nChecking paths to dotfiles...\n"
# Get the current directory of install.sh
curr_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

if [[ -e $DOTFILES ]]; then
    # If the current directory is NOT already $DOTFILES, then clear $DOTFILES and move everything there
    if ! [[ $curr_dir -ef $DOTFILES ]]; then
        rm -rfv $DOTFILES 
        mkdir -v $DOTFILES
        mv -v $curr_dir $DOTFILES
    fi
else
    # Make $DOTFILES and move everything there
    mkdir -v $DOTFILES
    mv -v $curr_dir $DOTFILES
fi


# If $OLD_DOTFILES doesn't already exist, then create it
[[ -d $OLD_DOTFILES ]] || mkdir -v $OLD_DOTFILES
echo -e "Done...\n"

# Move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
echo -e "Moving any existing dotfiles from $HOME to $OLD_DOTFILES & creating symlinks to $DOTFILES...\n"
for file in "${files[@]}"; do
    # If a same-named file already exists in $HOME:
    # 1. Remove it, if it is a symlink or 
    # 2. Move it, if it's an actual file
    if [[ -h $HOME/$file ]]; then
            rm -rf $HOME/$file
    elif [[ -f $HOME/$file ]]; then
            mv -v $HOME/$file $OLD_DOTFILES/$file
    fi
    # Create a new symlink at $HOME to the dotfile
    ln -snfv $DOTFILES/$file $HOME/$file
done
echo -e "Done...\n"

# Some SSH configuration
echo -e "Configuring .ssh/ for future logins...\n"
mkdir -p $HOME/.ssh/keys
[[ -e $HOME/.ssh/config ]] || touch $HOME/.ssh/config
[[ -e $HOME/.ssh/authorized_keys ]] || touch $HOME/.ssh/authorized_keys

echo -e "Adding public key...\n"
# Add my public key to trust future remote logins
ssh_pubkey="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC/8++6ayyEShtB4BV6rXyMqOdFBYjcl/IVnaEy55Z4NGJ8COvRtIT998uTfB/QxxnR7toogIfalad2m7I9B4z4E9QValoQ/vJoEOY5ryeefMQDKHNMNKsavneNUkXun3f0R6COCDy9vRKV7NsqBqOcwLmmJyydFvMS3cEkfCnGYC8Hc+lb2dYYNe7ke6xzCrJLyTBuD4qtLoiaEoyMHO4Iq9tkwM4ubNbdDzDkto4dNBkVTlve+DtGLZiy9501/ylukFVRj6ZpzWJj3H/g+rSfJJdkp18RfBPi1xCWDbP2zg82ZIEx3gZ5S0vMds8f2jW8/pAty6pHxqHaTS9KQ+r8D7O7vZUg7ly5xDUiT1fdeAAd4tGvptiD5tsyEcHIX33/9mCCTDTZzgPdxcwWOBtsfeA4Y3JybnCKkFdHrFmt7r7DC8XmLELFtEspaTqNWA9wuWa9NEHOnVD7sEsRdGIyzVW9KJ7pdLmau3p6jK2wjBLD+DzqnugkUGKFSU9eSdTNk39CltpiFFrNb8t9AELu0EH+UkQihLO+zQXXJD+S4lS43M4obPY3cHapeDZXd5sTrcrH8PQNLwUfP4d2pO5vBJQ6iqp3F95YfQZcuCvhUfZH5tAwOK2A+YrYU3fGsL2rzKqgWy6PcPnPX4IkhaAJCDcuM0r14MRH2EcJxD9Suw== sid@home.local"
echo $ssh_pubkey >> $HOME/.ssh/authorized_keys
unset ssh_pubkey 
echo -e "Done...\n"

# Install necessary packages
if [[ "$(uname -v)" =~ Ubuntu ]]; then
    pkgs=(ripgrep bat fzf fd-find)
    echo -e "Installing packages: "
    printf '%s\n' "${pkgs[@]}"

    echo $PW | sudo apt -y update
    echo $PW | sudo apt -y upgrade
    echo $PW | sudo apt install "${pkgs[@]}"
    echo -e "Done...\n"
fi


echo -e "Installing vim plugins...\n"
vim -es -u $HOME/.vimrc -i NONE -c "PlugInstall" -c "qa"

# Symlink vim colorscheme after gruvbox plugin is installed
echo -e "Linking gruvbox colorscheme...\n"
ln -snfv $HOME/.vim/plugged/gruvbox/colors/gruvbox.vim $HOME/.vim/colors/gruvbox.vim
echo -e "Done...\n"

echo -e "\nSourcing $HOME/.bash_profile...\n"
. $HOME/.bash_profile

echo -e "Finished!\n"
