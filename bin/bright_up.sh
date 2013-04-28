#!/bin/sh

BRIGHT_INCREMENT=1
MIN_BRIGHT=0

read MAX_BRIGHT < /sys/class/backlight/acpi_video0/max_brightness
read CURRENT_BRIGHT < /sys/class/backlight/acpi_video0/brightness

CURRENT_BRIGHT=`expr $CURRENT_BRIGHT + $BRIGHT_INCREMENT`

if [ $CURRENT_BRIGHT -le $MAX_BRIGHT ]
then
        echo $CURRENT_BRIGHT > /sys/class/backlight/acpi_video0/brightness
fi

