#!/bin/sh

if [ $(xprop -root _NET_ACTIVE_WINDOW | cut -d ' ' -f 5) == "0x0" ]; then
	exec ~/.config/rofi/menu/powermenu.sh
else
	exec i3-msg kill
fi
