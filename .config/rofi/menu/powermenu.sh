#!/bin/sh
menu=$(echo -e "lock\nlogout\nsuspend\nhibernate\nreboot\npoweroff" | rofi -theme ~/.config/rofi/full.rasi -dmenu -i -p "power ")

case $menu in
	lock)
		betterlockscreen -l dimblur ;;
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
