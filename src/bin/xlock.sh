#!/bin/sh
modes="$(print $(cat "$HOME/etc/xlock-modes.list") | tr ' ' ,)"
exec /usr/X11R6/bin/xlock -duration $((30 * 60)) -mode random -modelist "$modes" "$@"
