#!/bin/sh

exists() {
	[[ -e "$1" && -f "$1" && -s "$1" ]]
	return $?
}

if exists "$2.s"
then
	file="$2.s"
	build=assemble
elif exists "$2.c"
then
	file="$2.c"
	build=compile
else
	echo "$0: Fatal: don't know how to build '$1'" 1>&2
	exit 99
fi



if exists "$file.args"
then
	redo-ifchange "$file" "bin/$build" "$file.args"
	args="$( cat "$file.args" )"
else
	redo-ifchange "$file" "bin/$build"
	args=
fi

"bin/$build" -o "$3" "$file" $args
