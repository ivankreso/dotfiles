#!/bin/bash

gxmessage "You sure?" -center -title "Take action" -font "Sans bold 10" -default "Cancel" -buttons "_Cancel":1,"_Reboot":2 >/dev/null

case $? in
	1)
		echo "Exit";;
	2)
		systemctl reboot;;
esac
