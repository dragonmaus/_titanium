#!/bin/sh
set -A modes -- $(cat "$HOME/etc/xlock-modes.list")
exec /usr/X11R6/bin/xlock -mode "${modes[RANDOM % ${#modes[@]}]}" "$@"
