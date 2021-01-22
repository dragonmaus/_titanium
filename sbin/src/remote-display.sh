#!/bin/sh

set -e

file=~/.xsession-display
[ -r "$file" ]
read -r display < "$file"

exec env DISPLAY="$display" "$@"
