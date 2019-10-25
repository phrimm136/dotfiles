#!/bin/sh
killall polybar
while pgrep -x polybar >/dev/null; do sleep 1; done
polybar top -c ~/.config/polybar/config-top.ini &
polybar bottom -c ~/.config/polybar/config-bottom.ini &
