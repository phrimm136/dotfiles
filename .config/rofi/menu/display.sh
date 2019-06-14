#!/bin/sh

menu=$(echo -e "laptop only\nduplicate\nexpand\nprojector only" | rofi -theme ~/.config/rofi/full.rasi -dmenu -i -p "display ")

case $menu in
	"laptop only")
		xrandr --output eDP-1 --mode 1920x1080 --output HDMI-1 --off ;;
	"duplicate")
		xrandr --output HDMI-1 --sams-as eDP-1 ;;
	"expand")
		xrandr --output HDMI-1 --right-of eDP-1 --mode 1920x1080 ;;
	"projector only")
		xrandr --output HDMI-1 --mode 1920x1080 --output eDP-1 --off ;;
esac
