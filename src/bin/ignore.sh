#!/bin/sh
set -e

repo="$(while :; do [[ -d .pijul ]] && pwd -P && exit; [[ . -ef .. ]] && exit; cd ..; done)"
[[ -n "$repo" ]]

file="$repo/.ignore"
[[ -f "$file" ]] || touch "$file"

rm -f "$file{tmp}"
for line
do
	print -r -- "$line"
done | cat "$file" - | sort -u >"$file{tmp}"

rm -f "$file{new}"
{
	grep -v '^!' <"$file{tmp}" || :
	grep '^!' <"$file{tmp}" || :
} >"$file{new}"
rm -f "$file{tmp}"

cmp -s "$file" "$file{new}" || cp -f "$file{new}" "$file"
rm -f "$file{new}"
