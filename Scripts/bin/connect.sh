#!/bin/bash
sudo wpa_supplicant -Dwired -ieth0 -c/etc/wpa_supplicant.conf -B &
sudo dhcpcd eth0 &
