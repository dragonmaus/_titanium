#!/bin/sh
set -e

die() {
	e="$1"
	shift
	print -r -- "$*" 1>&2
	exit "$e"
}

name="$(basename "$0" .sh)"
usage="Usage: $name [-hv] from to"
help="$usage\n\nRecursively copy a directory while preserving permissions.\n\n  -h   display this help\n  -v   print files as they are copied"

while getopts :hv opt
do
	case "$opt" in
	(h)
		die 0 "$help"
		;;
	(v)
		v=v
		;;
	(\?)
		if [[ -n $OPTARG ]]
		then
			warn "$name: Unknown option -- $OPTARG"
			die 100 "$usage"
		fi
		break
		;;
	(:)
		if [[ -n $OPTARG ]]
		then
			warn "$name: Option requires an argument -- $OPTARG"
			die 100 "$usage"
		fi
		break
		;;
	esac
done
shift $(( OPTIND - 1 ))

[[ $# -ge 1 ]] || die 100 "missing required 'from' argument\n$usage"
[[ $# -ge 2 ]] || die 100 "missing required 'to' argument\n$usage"

mkdir -p "$2"
( cd "$1" && exec find . -print0 ) | sort -z | ( cd "$1" && exec pax -0dwz ) | ( cd "$2" && exec pax -rz -p p )
