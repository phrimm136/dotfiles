#!/bin/bash

MENU="$(rofi -dmenu -i -p 'System' -lines 4 <<< " Lock| Logout|累 Reboot|⏻ Shutdown")"
case "$MENU" in
    *Lock) i3lock -i ~/Downloads/238803.png ;;
    *Logout) i3-msg exit ;;
    *Reboot) systemctl reboot ;;
    *Shutdown) systemctl -i poweroff
esac
