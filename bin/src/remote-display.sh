#!/bin/sh

set -e

file="$HOME/tmp/x.env.display"
[[ -r "$file" ]] || exit 1

display="$( head -1 < "$file" )"

exec env "DISPLAY=$display" "$@"
