#!/bin/sh

set -e

. echo.sh

inc=5
max=255

getlevel() {
	echo $(($(mixerctl -n outputs.master | cut -d , -f 1) * 100))
}
level2percent() {
	echo $((level / max))
}
percent2level() {
	echo $((percent * max))
}
printlevel() {
	echo "$percent% ($((level / 100))/$max)"
}
roundlevel() {
	print $(((level + ((100 - (level % 100)) % 100)) / 100))
}
roundpercent() {
	print $((percent + ((inc - (percent % inc)) % inc)))
}

case "$*" in
('')
	level=$(getlevel)
	percent=$(level2percent)
	level=$(percent2level)
	printlevel
	exit 0
	;;
(+|-)
	level=$(getlevel)
	percent=$(level2percent)
	percent=$(roundpercent)
	percent=$((percent $1 inc))
	[ $percent -lt 0 ] && percent=0
	[ $percent -gt 100 ] && percent=100
	level=$(percent2level)
	printlevel
	exec mixerctl -q outputs.master=$(roundlevel)
	;;
([0-9]|[1-9][0-9]|100)
	percent=$(($1))
	level=$(percent2level)
	printlevel
	exec mixerctl -q outputs.master=$(roundlevel)
	;;
(mute)
	exec mixerctl -q outputs.master.mute=toggle
	;;
(*)
	die 1 "$0: Invalid argument '$1'"
	;;
esac
