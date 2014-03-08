#!/bin/bash

cp ~/.vimrc .
cp ~/.bashrc .
cp ~/.bash_profile .
cp ~/.gitconfig .
cp ~/.gtkrc-2.0 .
cp ~/.Xdefaults .
cp ~/.Xcolors .
cp ~/.valgrindrc .
cp --parents /etc/samba/smb.conf .
cp --parents /etc/systemd/logind.conf .
cp --parents /etc/systemd/system/fixwlan-suspend.service .
cp --parents /etc/systemd/system/fixwlan-resume.service .
cp --parents /etc/fstab .
#cp ~/.xinitrc .
#cp ~/.tmux.conf .
#cp ~/.emacs .
#cp ~/.zshrc .
#cp ~/.conkyrc .
#cp ~/.compton.conf . 
#cp ~/.gtkrc-2.0.mine .
#cp --parents /usr/local/bin/rc.local .

rm -rf .config/
mkdir .config
cp -rf ~/.config/openbox .config/openbox
rm -rf Scripts/
cp -rf ~/Scripts/ .
#rm -rf .mpd/
#mkdir .mpd
#cp -rf ~/.mpd/mpd.conf .mpd/mpd.conf
#rm -rf .conky/
#cp -rf ~/.conky .
#rm -rf .conkycolors/
#cp -rf ~/.conkycolors .

#rm -rf .xmonad/
#cp -rf ~/.xmonad/ .
#rm -rf .i3/
#cp -rf ~/.i3/ .
#rm -rf .vim/
#cp -rf ~/.vim .
