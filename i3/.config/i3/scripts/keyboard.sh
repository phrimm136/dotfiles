xkbcomp ~/.xkb/keymap/custom.xkb $DISPLAY &> /dev/null
xset r rate 250 40
if pgrep xcape &> /dev/null ;
then
    pkill xcape
fi
xcape -t 150 -e "Control_L=Escape"
echo "keyboard set done"
