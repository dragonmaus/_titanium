#!/bin/sh

bin="$HOME/bin"
mkdir -p "$bin"

redo-ifchange all

while IFS= read name
do
	dest="$bin/$name"
	rm -f "$dest.new"
	cp -f "$name.exe" "$dest.new"
	chmod -w "$dest.new"
	mv -f "$dest.new" "$dest"
done < all.list
