exists() {
	test -e "$1" -a -f "$1" -a -s "$1"
	return $?
}

if exists "$2.s"
then
	if exists "$2.s.o.args"
	then
		redo-ifchange "$2.s.o" bin/load bin/strip "$2.s.o.args"
		bin/load -o "$3" "$2.s.o" -nostdlib $( cat "$2.s.o.args" )
	else
		redo-ifchange "$2.s.o" bin/load bin/strip
		bin/load -o "$3" "$2.s.o" -nostdlib
	fi
	bin/strip "$3"
elif exists "$2.c"
then
	if exists "$2.c.o.args"
	then
		redo-ifchange "$2.c.o" bin/load bin/strip "$2.c.o.args"
		bin/load -o "$3" "$2.c.o" $( cat "$2.c.o.args" )
	else
		redo-ifchange "$2.c.o" bin/load bin/strip
		bin/load -o "$3" "$2.c.o"
	fi
	bin/strip "$3"
else
	for ext in sh py sed calc
	do
		if exists "$2.$ext"
		then
			redo-ifchange "$2.$ext"
			cp -f "$2.$ext" "$3"
			chmod +x "$3"
			exit 0
		fi
	done

	echo "$0: Fatal: don't know how to build '$1'" 1>&2
	exit 99
fi
