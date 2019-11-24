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

canon() {
	realpath "$1" 2> /dev/null && return || :
	local p="$1"
	[[ "$p" = /* ]] || p="$PWD/$p"
	p="$( echo "$p" | sed -E -e ': loop' -e 's:/+:/:g' -e 's:/\./:/:g' -e 's:/[^/]+/\.\./:/:g' -e 's:^/\.\./:/:' -e 's:/[^/]+/\.\.$::g' -e 't loop' )"
	echo "$p"
}

ascend=
case "$#" in
(1)
	from="$( canon "$PWD" )"
	to="$( canon "$1" )"
	;;
(2)
	from="$( canon "$1" )"
	to="$( canon "$2" )"
	;;
(*)
	die 111 "Usage: relpath [from] to"
	;;
esac

[[ -e "$from" && ! -d "$from" ]] && from="$( dirname "$from" )"

while [[ "$from" != / && "$to" != "$from"/* ]]
do
	ascend="../$ascend"
	from="$( dirname "$from" )"
done

echo "$ascend${to#"${from%/}/"}"
