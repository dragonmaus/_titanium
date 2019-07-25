#!/bin/sh
set -e

min=0
max=255
inc=5

case "$*" in
('')
	level=$(mixerctl -n outputs.master | cut -d , -f 1)
	percent=$((level * 100 / max))
	print "$percent% ($level/$max)"
	exit 0
	;;
(+|-)
	level=$(mixerctl -n outputs.master | cut -d , -f 1)
	level=$((level * 100 / max))
	level=$((level + ((inc - (level % inc)) % inc)))
	level=$((level $1 inc))
	[[ $level -lt 0 ]] && level=0
	[[ $level -gt 100 ]] && level=100
	level=$((max * level / 100))
	print "$((level * 100 / max))% ($level/$max)"
	exec mixerctl -q outputs.master=$level,$level
	;;
([0-9]|[1-9][0-9]|100)
	level=$(($1))
	# level=$((level + ((inc - (level % inc)) % inc)))
	level=$((max * level / 100))
	print "$((level * 100 / max))% ($level/$max)"
	exec mixerctl -q outputs.master=$level,$level
	;;
(mute)
	exec mixerctl -q outputs.master.mute=toggle
	;;
(*)
	print "$0: Invalid argument '$1'" 1>&2
	exit 1
	;;
esac
