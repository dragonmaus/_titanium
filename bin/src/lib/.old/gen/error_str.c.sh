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
echo '#define X(n,s) if (e == n) return s'
echo
echo '  const char *'
echo 'error_str(int e)'
echo '{'
echo '  X(0, "no error");'
while read -r name errno temp str
do
	if test x"$name" = x-
	then
		echo "#ifdef $errno"
		echo "  X($errno, \"$str\");"
		echo '#endif'
	else
		echo "  X($name, \"$str\");"
	fi
done <error.list
echo "  return \"unknown error\";"
echo "}"
