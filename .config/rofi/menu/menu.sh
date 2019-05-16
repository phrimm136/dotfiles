#!/bin/sh
menu=$(echo -e "program\nsearch\npower" | rofi -theme ~/.config/rofi/full.rasi -dmenu -i -p "menu ")

case $menu in
	program)
		rofi -theme ~/.config/rofi/full.rasi -show drun ;;
	search)
		find ${HOME} -not -path '*/\.*'| rofi -theme ~/.config/rofi/full.rasi -dmenu +i -p "search "  | xargs -r -0 xdg-open ;;
	power)
		exec ~/.config/rofi/menu/powermenu.sh ;;
esac
