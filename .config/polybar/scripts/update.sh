#!/bin/sh

if pacman -Qi yay > /dev/null ; then
    if pacman -Qi powerpill > /dev/null ; then
        cmd="yay --pacman powerpill -Syu"
    else
        cmd="yay -Syu"
    fi
else
    if pacman -Qi powerpill > dev/null ; then
        cmd="sudo powerpill -Syu"
    else
        cmd="sudo pacman -Syu"
    fi
fi

termite --title=floating -e "$cmd"
