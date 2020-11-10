#!/bin/sh

menu=$(echo -e "\n\n-\n" | rofi -theme ~/.config/rofi/side.rasi -lines 4 -dmenu -i -p "display ")

case $menu in
    "")
	xrandr --output eDP-1 --mode 1920x1080 --output HDMI-1 --off ;;
    "")
	xrandr --output HDMI-1 --sams-as eDP-1 ;;
    "-")
	xrandr --output HDMI-1 --mode 1920x1080 --right-of eDP-1 ;;
    "")
	xrandr --output HDMI-1 --mode 1920x1080 --output eDP-1 --off ;;
esac
