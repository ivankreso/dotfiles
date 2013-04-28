#!/bin/bash

cp ~/.gvimrc .
cp ~/.vimrc .
cp ~/.xinitrc .
cp ~/.bashrc .
cp ~/.bash_profile .
cp ~/.zshrc .
cp ~/.tmux.conf .
cp ~/.gitconfig .
cp ~/.emacs .
cp ~/.conkyrc .
cp ~/.compton.conf . 
cp ~/.gtkrc-2.0 .
cp ~/.gtkrc-2.0.mine .

rm -rf bin/
cp -rf ~/bin/ .
rm -rf .config/
mkdir .config
cp -rf ~/.config/openbox .config/openbox
rm -rf .vim/
cp -rf ~/.vim .
#rm -rf .xmonad/
#cp -rf ~/.xmonad/ .
rm -rf .i3/
cp -rf ~/.i3/ .