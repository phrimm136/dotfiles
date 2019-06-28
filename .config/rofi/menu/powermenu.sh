#!/bin/sh

menu=$(echo -e "lock\nlogout\nsuspend\nhibernate\nreboot\npoweroff" | rofi -xoffset 865 -yoffset -375 -width 10 -anchor east -dmenu -i)

case $menu in
    lock)
	betterlockscreen -l ;;
    logout)
	i3-msg exit ;;
    suspend)
	systemctl suspend ;;
    hibernate)
	systemctl hibernate ;;
    reboot)
	reboot ;;
    poweroff)
	poweroff ;;
esac
