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
cp --parents /etc/samba/smb.conf .
cp --parents /home/kivan/toolbox/ulogme/render/render_settings.js .
cp --parents /etc/systemd/logind.conf .
cp --parents /etc/fstab .
cp --parents ~/.ssh/config .
cp -r --parents ~/.mozilla/firefox/is68sox3.default/chrome .
#cp ~/.xinitrc .
#cp ~/.emacs .
#cp ~/.conkyrc .
#cp ~/.compton.conf . 
#cp --parents /usr/local/bin/rc.local .

mkdir -p magellan
scp kivan@magellan.zemris.fer.hr:~/.pylintrc magellan/
scp kivan@magellan.zemris.fer.hr:~/.zshrc magellan/
scp -r kivan@magellan.zemris.fer.hr:~/.i3/ magellan/

#mkdir -p nazgul
#scp kivan@magellan.zemris.fer.hr:~/.pylintrc magellan/
#scp kivan@magellan.zemris.fer.hr:~/.zshrc magellan/
#scp -r kivan@magellan.zemris.fer.hr:~/.i3/ magellan/

rm -rf .config/
mkdir -p .config/gtk-3.0/
cp ~/.config/gtk-3.0/settings.ini .config/gtk-3.0/settings.ini
cp -rf ~/.config/openbox .config/openbox
rm -rf Scripts/
cp -rf ~/Scripts/ .
rm -rf .i3/
cp -rf ~/.i3/ .
cp -rf ~/.screenlayout/ .

#rm -rf .mpd/
#mkdir .mpd
#cp -rf ~/.mpd/mpd.conf .mpd/mpd.conf
#rm -rf .conky/
#cp -rf ~/.conky .
#rm -rf .conkycolors/
#cp -rf ~/.conkycolors .

#rm -rf .xmonad/
#cp -rf ~/.xmonad/ .
#rm -rf .vim/
#cp -rf ~/.vim .
