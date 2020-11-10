find ${HOME} -not -path '*/\.*' | rofi -dmenu -i -matching "glob" -p "search" | xargs -r -0 xdg-open
