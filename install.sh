#!/bin/bash

files=(.bash_aliases .bash_profile .bashrc .gitconfig .gitignore_global .inputrc .vimrc .vim)

OLDDOTFILES=$HOME/.olddotfiles
DOTFILES=$HOME/dotfiles

mkdir OLDDOTFILES && mkdir DOTFILES

# move any existing dotfiles in homedir to dotfiles_old directory, then create
# symlinks
echo -e "Moving any existing dotfiles from $HOME to $OLDDOTFILES & creating symlinks...\n"
for file in "${files[@]}"; do
    if [[ -e $HOME/$file ]]; then
	mv -v $HOME/$file $OLDDOTFILES/$file
    fi
    ln -snfv $DOTFILES/$file $HOME/$file
done

echo -e "\nSourcing $HOME/.bash_profile\n"
. $HOME/.bash_profile
