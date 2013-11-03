#!/bin/sh

#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
#

#run () { type -p $1 >/dev/null && exec $* & }

#run systemd as user instance
#systemd --user &

exec dbus-launch openbox-session
#exec xmonad
#exec i3
#exec ck-launch-session dbus-launch openbox-session
#exec gnome-session-cinnamon
#exec gnome-session
#exec mate-session
#exec enlightenment_start

