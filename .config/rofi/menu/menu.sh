#!/bin/sh
menu=$(echo -e "program\nsearch\ncalc\nclipboard\npower" | rofi -theme ~/.config/rofi/select.rasi -dmenu -xoffset -865 -yoffset -375 -width 10 -i)

case $menu in
    program)
	rofi -show drun -p "program " ;;
    search)
	find ${HOME} -not -path '*/\.*' | rofi  -dmenu +i -p "search" | xargs -r -0 xdg-open ;;
    calc)
	rofi -show calc -modi calc ;;
    clipboard)
	rofi -modi "clipboard:greenclip print" -show clipboard -run-command '{cmd}' ;;
    power)
	exec ~/.config/rofi/menu/powermenu.sh ;;
esac
