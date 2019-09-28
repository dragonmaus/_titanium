#!/bin/sh

set -e

canon() {
	realpath "$1" 2>/dev/null && return || :
	local p="$1"
	[[ "$p" = /* ]] || p="$PWD/$p"
	p="$( print -r -- "$p" | sed -E -e ': loop' -e 's:/+:/:g' -e 's:/\./:/:g' -e 's:/[^/]+/\.\./:/:g' -e 's:^/\.\./:/:' -e 's:/[^/]+/\.\.$::g' -e 't loop' )"
	print -r -- "$p"
}

ascend=
from="$( canon "$1" )"
to="$( canon "$2" )"

[[ -e "$from" && ! -d "$from" ]] && from="$( dirname "$from" )"

while [[ "$from" != / && "$to" != "$from"/* ]]
do
	ascend="../$ascend"
	from="$( dirname "$from" )"
done

print -r -- "$ascend${to#"${from%/}/"}"
