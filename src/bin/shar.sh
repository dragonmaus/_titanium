#!/bin/sh

echo() {
	print -r -- "$*"
}

cat << END
# This is a shell archive. Save it in a file, remove anything before
# this line, and then unpack it by entering "sh file". Note, it may
# create directories; files and directories will be owned by you and
# have default permissions.
#
# This archive contains:
#
END
for f do
	echo "#	$f"
done

echo '#'

mkdirs() {
	d="$( dirname "$1" )"
	[[ $d = . || $d = / ]] && return
	echo "mkdir -p '$d'"
}

for f do
	q="$( echo "$f" | sed "s/'/'\\\\''/g" )"
	echo "echo x - '$q'"
	mkdirs "$q"
	echo "sed 's/^X//' > '$q' << 'END-of-$q'"
	sed 's/^/X/' < "$f"
	echo "END-of-$q"
done

echo exit
echo
