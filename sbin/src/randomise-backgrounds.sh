#!/bin/sh

d=0
while getopts :d opt
do
	case $opt in
	(d)
		d=1
		;;
	(*)
		exit 1
		;;
	esac
done
shift $((OPTIND - 1))

cd "$(xdg-user-dir BACKGROUNDS)"

desktop=$(readlink .current-desktop 2> /dev/null)

find * -type f 2> /dev/null \
| grep -Fvx -e "$desktop" \
| sort -R \
| head -1 \
| (
	IFS= read -r desktop
	ln -fhs "$desktop" .current-desktop
)

[ "$d" -eq 1 ] && set-desktop .current-desktop
