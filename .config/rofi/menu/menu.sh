#!/bin/sh
menu=$(echo -e "display\nprogram\nsearch\ncalc\nclipboard\npower" | rofi -theme ~/.config/rofi/select.rasi -dmenu -xoffset -865 -yoffset -375 -width 10 -i)

case $menu in
    display)
	exec ~/.config/rofi/menu/display.sh ;;
    program)
	rofi -theme ~/.config/rofi/menu.rasi -show drun -p "program " ;;
    search)
	find ${HOME} -not -path '*/\.*' | rofi -theme ~/.config/rofi/menu.rasi -dmenu +i -p "search" | xargs -r -0 xdg-open ;;
    calc)
	rofi -theme ~/.config/rofi/menu.rasi -show calc -modi calc ;;
    clipboard)
	rofi -modi "clipboard:greenclip print" -show clipboard -run-command '{cmd}' ;;
    power)
	exec ~/.config/rofi/menu/powermenu.sh ;;
esac
