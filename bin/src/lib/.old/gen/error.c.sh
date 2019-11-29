#!/bin/sh

echo() {
	printf '%s\n' "$*"
}

echo '/* automatically generated */'
echo '#include <errno.h>'
echo '#include "error.h"'
echo
echo '#undef errno'
i=0
while read -r name errno temp str
do
	test x"$name" = x- && continue
	i=`expr -- $i - 1`
	echo
	echo "int $name ="
	echo "#ifdef $errno"
	echo "$errno;"
	echo '#else'
	echo "$i;"
	echo '#endif'
done <error.list
