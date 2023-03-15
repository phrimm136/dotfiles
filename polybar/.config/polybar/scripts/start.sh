#!/bin/sh

# export TEMP_PATH=/sys/devices/platform/coretemp.0/hwmon/$(ls /sys/devices/platform/coretemp.0/hwmon)/temp1_input
export TEMP_PATH=/sys/class/thermal/thermal_zone0/temp
killall polybar
while pgrep -x polybar >/dev/null; do sleep 1; done
polybar top -c ~/.config/polybar/config-top.ini &
polybar bottom -c ~/.config/polybar/config-bottom.ini &
