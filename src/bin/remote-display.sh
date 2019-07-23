#!/bin/sh
set -e

file="$HOME/tmp/x.display"
[[ -r "$file" ]]
display="$(head -n 1 <"$file")"
exec env "DISPLAY=$display" "$@"
