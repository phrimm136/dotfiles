killall polybar
i3 restart
exec ~/.config/polybar/scripts/start.sh
while pgrep -x polybar >/dev/null; do sleep 1; done
polybar top -c ~/.config/polybar/config-top.init &
polybar bottom -c ~/.config/polybar/config-bottom.init &
