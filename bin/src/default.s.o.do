exists() {
	test -e "$1" -a -f "$1" -a -s "$1"
	return $?
}

if exists "$2.s.args"
then
	redo-ifchange "$2.s" bin/assemble "$2.s.args"
	bin/assemble -o "$3" "$2.s" $( cat "$2.s.args" )
else
	redo-ifchange "$2.s" bin/assemble
	bin/assemble -o "$3" "$2.s"
fi
