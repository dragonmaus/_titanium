home="$( cd "$( dirname "$0" )" && env - "PATH=$PATH" pwd )"

redo-ifchange "$home/inc/whichsrc.sh"
. "$home/inc/whichsrc.sh"

if whichsrc "$2.s" > /dev/null
then
	redo-ifchange "$2.exe.deps"
	xargs redo-ifchange bin/load bin/strip "$2.o" < "$2.exe.deps"

	sed -E < "$2.exe.deps" \
		-e 's|^lib/lib(.+)\.a$|-l\1|' \
		-e '1i\
-Wl,--start-group
' \
		-e '$a\
-Wl,--end-group
' \
	| xargs bin/load -o "$3" "$2.o" -nostdlib
	bin/strip "$3"
elif whichsrc "$2.c" > /dev/null
then
	redo-ifchange "$2.exe.deps"
	xargs redo-ifchange bin/load bin/strip "$2.o" < "$2.exe.deps"

	sed -E < "$2.exe.deps" \
		-e 's|^lib/lib(.+)\.a$|-l\1|' \
		-e '1i\
-Wl,--start-group
' \
		-e '$a\
-Wl,--end-group
' \
	| xargs bin/load -o "$3" "$2.o"
	bin/strip "$3"
elif src="$( whichsrc "$2.sh" "$2.py" "$2.sed" "$2.calc" )"
then
	redo-ifchange "$src"
	cp -f "$src" "$3"
	chmod +x "$3"
else
	echo "$0: fatal: don't know how to build '$1'" 1>&2
	exit 99
fi
