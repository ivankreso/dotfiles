#!/bin/bash

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
cp ~/.Xdefaults .
cp ~/.Xcolors .
cp --parents /etc/samba/smb.conf .
cp --parents /etc/systemd/logind.conf .

rm -rf bin/
cp -rf ~/bin/ .
rm -rf scripts/
cp -rf ~/scripts/ .
cp /usr/local/bin/rc.local scripts/
rm -rf .mpd/
mkdir .mpd
cp -rf ~/.mpd/mpd.conf .mpd/mpd.conf
rm -rf .config/
mkdir .config
cp -rf ~/.config/openbox .config/openbox
rm -rf .conky/
cp -rf ~/.conky .
rm -rf .conkycolors/
cp -rf ~/.conkycolors .
#rm -rf .xmonad/
#cp -rf ~/.xmonad/ .
rm -rf .i3/
cp -rf ~/.i3/ .
#rm -rf .vim/
#cp -rf ~/.vim .
