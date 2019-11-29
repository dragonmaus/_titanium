home="$( cd "$( dirname "$0" )" && env - "PATH=$PATH" pwd )"

redo-ifchange "$home/inc/whichsrc.sh"
. "$home/inc/whichsrc.sh"

if whichsrc "$2.s" > /dev/null
then
	redo-ifchange "$2.o.deps"
	xargs redo-ifchange bin/assemble < "$2.o.deps"
	bin/assemble -o "$3" "$2.s"
elif whichsrc "$2.c" > /dev/null
then
	redo-ifchange "$2.o.deps"
	xargs redo-ifchange bin/compile < "$2.o.deps"
	bin/compile -o "$3" "$2.c"
else
	echo "$0: fatal: don't know how to build '$1'" 1>&2
	exit 99
fi
