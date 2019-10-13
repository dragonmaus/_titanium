#!/bin/sh

echo() {
	print -r -- "$*"
}

(
	echo '#include <sys/syscall.h>'
	for name do
		echo "SYS_$name \"$name\""
	done
) | cc -E - | grep '^[^#_]' | sort -n
