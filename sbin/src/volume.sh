#!/bin/sh

set -e

. echo.sh

round() {
	set -- $(($1))
	case $1 in
	(*[0-4])
		echo ${1%?}0
		;;
	(*[5-9])
		echo $((${1%?} + 1))0
		;;
	esac
}

show() {
	printf '%5.1f%%\n' $(echo $1 | sed -E 's/^([0-9])\.([0-9]{2})([0-9])$/\1\2.\3/')
}

set -- "$*"
case "$1" in
('')
	show $(sndioctl -n output.level)
	;;
(+|-)
	level=$(sndioctl -n output.level | tr -d . | sed -E 's/^0+//')
	level=$(round $level)
	level=$((level $1 50))
	if [ $level -lt 0 ]
	then
		level=0
	elif [ $level -gt 1000 ]
	then
		level=1000
	fi
	level=$(echo $level | sed 's/^/000/' | sed -E 's/^([0-9]*)([0-9]{3})$/\1.\2/')
	show $(sndioctl -n output.level=$level)
	;;
([0-9]|[1-9][0-9]|100)
	show $(sndioctl -n output.level=0.${1}0)
	;;
(mute)
	sndioctl -q output.mute=!
	;;
(*)
	die 1 "$0: Invalid argument '$1'"
	;;
esac
