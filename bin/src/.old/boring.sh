#!/bin/sh
set -e

repo="$(while :; do [[ -d _darcs ]] && pwd -P && exit; [[ . -ef .. ]] && exit; cd ..; done)"
[[ -n "$repo" ]]

file="$repo/_boring"
[[ -f "$file" ]] || touch "$file"

rm -f "$file{new}"
for line
do
	print -r -- "$line"
done | cat "$file" - | sort -u >"$file{new}"

cmp -s "$file" "$file{new}" || cp -f "$file{new}" "$file"
rm -f "$file{new}"
