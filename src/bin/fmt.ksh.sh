#!/bin/sh

echo() {
	print -r -- "$*"
}

{
	echo 'function z {'
	cat "$@"
	echo
	echo '}'
	echo 'typeset -f z'
} | ksh | sed -e 1d -e '$d' -e 's/^	//' -e 's/ $//'
