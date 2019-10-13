exists() {
	test -e "$1" -a -f "$1" -a -s "$1"
	return $?
}

check() {
	if exists "$2.s" || exists "$2.c"
	then
		file="$2.o"
		kind=object
		return 0
	fi
	for ext in sh py sed calc
	do
		if exists "$2.$ext"
		then
			file="$2.$ext"
			kind=script
			return 0
		fi
	done
	echo "$0: Fatal: don't know how to build '$1'" 1>&2
	exit 99
}

check "$@"

case "$kind" in
(object)
	if exists "$file.args"
	then
		redo-ifchange "$file" bin/load bin/strip "$file.args"
		args="$( cat "$file.args" )"
	else
		redo-ifchange "$file" bin/load bin/strip
		args=
	fi

	bin/load -o "$3" "$file" $args
	bin/strip "$3"
	;;
(script)
	redo-ifchange "$file"

	cp -f "$file" "$3"
	chmod +x "$3"
	;;
esac
