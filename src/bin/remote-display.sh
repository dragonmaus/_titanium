#!/bin/sh
set -e

file="$HOME/tmp/x.env.display"
[[ -r "$file" ]]
display="$(head -n 1 <"$file")"
exec env "DISPLAY=$display" "$@"
