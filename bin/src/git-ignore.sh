#!/bin/sh

set -e

echo() {
	print -r -- "$*"
}

set -o physical
while :
do
	[[ -d .git ]] && break
	[[ . -ef .. ]] && die 1 "$name: Not inside a git repository"
	cd ..
done

file="$PWD/.gitignore"
[[ -f "$file" ]] || : >> "$file"

rm -f "$file.tmp"
for line
do
	echo "$line"
done | cat "$file" - | sort -u | grep . > "$file.tmp"

rm -f "$file.new"
{
	grep -v '^!' < "$file.tmp" || :
	grep '^!' < "$file.tmp" || :
} > "$file.new"
rm -f "$file.tmp"

print -n "Updating $file... "
if cmp -s "$file" "$file.new"
then
	echo 'Nothing to do!'
else
	mv -f "$file.new" "$file"
	echo 'Done!'
fi
rm -f "$file.new"
