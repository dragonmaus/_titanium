exists() {
	test -e "$1" -a -f "$1" -a -s "$1"
	return $?
}

if exists "$2.c.args"
then
	redo-ifchange "$2.c" bin/compile "$2.c.args"
	bin/compile -o "$3" "$2.c" $( cat "$2.c.args" )
else
	redo-ifchange "$2.c" bin/compile
	bin/compile -o "$3" "$2.c"
fi
