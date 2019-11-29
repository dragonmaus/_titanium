#!/bin/sh

echo() {
	printf '%s\n' "$*"
}

echo '/* automatically generated */'
echo '#include <errno.h>'
echo '#include "error.h"'
echo
echo '#undef errno'
echo
echo '#define X(n) if (e == n) return 1'
echo
echo '  unsigned int'
echo 'error_temp(int e)'
echo '{'
while read -r name errno temp str
do
	test x"$temp" = xsoft || continue
	if test x"$name" = x-
	then
		echo "#ifdef $errno"
		echo "  X($errno);"
		echo '#endif'
	else
		echo "  X($name);"
	fi
done <error.list
echo '  return 0;'
echo '}'
