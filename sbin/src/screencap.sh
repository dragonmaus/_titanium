#!/bin/sh

window=
while getopts :fr opt
do
    case $opt in
    (f) window=$(xdotool getwindowfocus -f) ;;
    (r) window=root                         ;;
    (*) break                               ;;
    esac
done
shift $((OPTIND - 1))

exec gm import ${window:+-window "$window"} "$@" ~/desk/pictures/screenshots/$(date -u +%FT%TZ).png
