# copy of https://github.com/juacq97/dotfiles-lap/blob/master/scripts/links-dmenu
select=$(cat ~/.config/rofi/web_list | rofi -dmenu -i -p "web")

if [ "$select" != "" ]; then
    if grep -Fxq "$select" ~/.config/rofi/web_list; then
        page=$(echo $select | cut -d":" -f2-)
        xdg-open $page
    else
        site=$(echo $select | cut -d" " -f1)
        keyword=$(echo $select | cut -d" " -f2-)
        case $site in
            arch) xdg-open https://wiki.archlinux.org/index.php?search="$keyword" ;;
            aur) xdg-open https:///aur.archlinux.org/packages/?K="$keyword" ;;
            ytb) xdg-open https://youtube.com/results?search_query="$keyword" ;;
            qr) xdg-open https://quora.com/search?q="$keyword" ;;
            git) xdg-open https://github.com/search?q="$keyword" ;;
            *) xdg-open https://google.com/search?q="$select" ;;
        esac
    fi
fi
