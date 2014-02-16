#!/bin/bash

# Map caps lock to esc
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
