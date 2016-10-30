#!/bin/bash

cp ~/.vimrc .
cp ~/.zshrc .
cp ~/.zshenv .
cp ~/.zprofile .
cp ~/.tmux.conf .
cp ~/.bashrc .
cp ~/.bash_profile .
cp ~/.gitconfig .
cp ~/.Xdefaults .
cp ~/.Xcolors .
cp ~/.valgrindrc .
cp --parents /etc/systemd/logind.conf .

rm -rf .config/
cp --parents -rf ~/.config/termite/ .
rm -rf .i3/
cp -rf ~/.i3/ .
