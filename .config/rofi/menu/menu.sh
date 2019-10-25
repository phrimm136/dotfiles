#!/bin/sh
menu=$(echo -e "program\nsearch\nweb\ncalc\nclipboard\npower" | rofi -theme ~/.config/rofi/select.rasi -dmenu -xoffset -864 -yoffset -376 -width 10 -i)

case $menu in
    program)
	rofi -show drun -p "program " ;;
    search)
	exec ~/.config/rofi/menu/find.sh ;;
    web)
    exec ~/.config/rofi/menu/web.sh ;;
    calc)
	rofi -show calc -modi calc ;;
    clipboard)
	rofi -modi "clipboard:greenclip print" -show clipboard -run-command '{cmd}' ;;
    power)
	exec ~/.config/rofi/menu/powermenu.sh ;;
esac
