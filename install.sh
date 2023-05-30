#!/bin/bash

files=(.bash_aliases .bash_profile .bashrc .gitconfig .gitignore_global .inputrc .vimrc .vim)

OLDDOTFILES=~/.olddotfiles
DOTFILES=~/dotfiles
# move any existing dotfiles in homedir to dotfiles_old directory, then create
# symlinks
echo -e "Moving any existing dotfiles from ~ to $OLDDOTFILES & creating symlinks...\n"
for file in $files; do
    if [ -e ~/$file ]; then
	mv -v ~/$file $OLDDOTFILES/
    fi
    ln -snfv $DOTFILES/$file ~/$file
done

echo -e "\nSourcing ~/.bash_profile\n"
. ~/.bash_profile
