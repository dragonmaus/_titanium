#!/bin/sh

set -e

echo() {
	print -r -- "$*"
}

warn() {
	echo "$*" 1>&2
}

die() {
	e="$1"
	shift
	warn "$*"
	exit "$e"
}

name="$( basename "$0" .sh )"
usage="Usage: $name [-hv] from to"
help="$usage

Recursively copy a directory while preserving permissions.

  -h   display this help
  -v   print files as they are copied"

v=
while getopts :hv opt
do
	case "$opt" in
	(h)
		die 0 "$help"
		;;
	(v)
		v=v
		;;
	(:)
		warn "$name: Option '$OPTARG' requires an argument"
		die 100 "$usage"
		;;
	(\?)
		warn "$name: Unknown option '$OPTARG'"
		die 100 "$usage"
		;;
	esac
done
shift $(( OPTIND - 1 ))

if [[ $# -lt 2 ]]
then
	warn "$name: Missing argument(s)"
	die 100 "$usage"
fi

[[ -e "$1" ]] || die 1 "$name: Could not find '$1': No such file or directory"
[[ -d "$1" ]] || die 1 "$name: Could not chdir into '$1': Not a directory"

sort="$( which pathsort sort 2> /dev/null | head -1 )"

mkdir -p "$2"
( cd "$1" && exec find . -print0 ) | "$sort" -z | ( cd "$1" && exec pax -0dwz ) | ( cd "$2" && exec pax -rz$v -p e )
