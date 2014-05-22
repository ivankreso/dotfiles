#!/bin/sh

BRIGHT_INCREMENT=10
MIN_BRIGHT=0

read MAX_BRIGHT < /sys/class/backlight/acpi_video0/max_brightness
read CURRENT_BRIGHT < /sys/class/backlight/acpi_video0/brightness
echo $MAX_BRIGHT
echo $CURRENT_BRIGHT
CURRENT_BRIGHT=`expr $CURRENT_BRIGHT + $BRIGHT_INCREMENT`
echo $CURRENT_BRIGHT

if [ $CURRENT_BRIGHT -le $MAX_BRIGHT ]
then
  echo $CURRENT_BRIGHT > /sys/class/backlight/acpi_video0/brightness
else
  echo $MAX_BRIGHT > /sys/class/backlight/acpi_video0/brightness
fi

