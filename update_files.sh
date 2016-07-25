#!/bin/bash

cp ~/.vimrc .
cp ~/.zshrc .
cp ~/.zshenv .
cp ~/.zprofile .
cp ~/.tmux.conf .
cp ~/.bashrc .
cp ~/.bash_profile .
cp ~/.screenrc .
cp ~/.gitconfig .
cp ~/.Xdefaults .
cp ~/.Xcolors .
cp ~/.valgrindrc .
cp ~/.i3blocks .
cp ~/.pylintrc .

rm -rf .config/
cp -rf ~/.config/nvim .config/nvim
