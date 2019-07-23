#!/bin/sh

echo() {
	print -r -- "$*"
}

{
	echo 'function z {'
	cat "$@"
	echo
	echo '}'
	echo '\\builtin typeset -f z'
} | mksh | sed -e 1d -e '$d' -e 's/^	//' -e 's/ $//'
