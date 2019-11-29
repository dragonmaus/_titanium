home="$( cd "$( dirname "$0" )" && env - "PATH=$PATH" pwd )"

_1="$1"
_2="$2"
_3="$3"

redo-ifchange "$_2.o.deps"
set -- $( sed -En "s;$home/inc/(.+)\\.h$;$home/lib/lib\\1.a;p" < "$_2.o.deps" | sort -u )

seen=
while test $# -gt 0
do
	for lib in $seen
	do
		if test "x$1" = "x$lib"
		then
			shift
			continue 2
		fi
	done
	redo-ifchange "$1.deps"
	while IFS= read lib
	do
		set -- "$@" "$lib"
	done < "$1.deps"
	seen="$seen $1"
done

for lib in $seen
do
	echo "$lib"
done | sort -u > "$_3"
