#!/bin/sh

cd "$HOME/desk/pictures/wallpapers"

current="$( readlink .current )"

random="$current"
while [[ "$random" = "$current" ]]
do
	random="$( ls *.png digitalblasphemy/.current/* 2> /dev/null | sort -R | head -n 1 )"
done

ln -fs "$random" .current

[[ "$1" = -s ]] && exec set-wallpaper .current
