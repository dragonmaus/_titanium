#!/bin/sh

set -e

file=~/tmp/x.env.display
[ -r "$file" ]
read -r display < "$file"

exec env DISPLAY="$display" "$@"
