#!/bin/sh

set -e

host=$(sed -n '/^# My local servers$/,/^# Public servers$/s/^Host \(.*\)$/\1/p' < ~/.ssh/config | sort -u | dmenu)
[[ -n $host ]]

exec st -e ssh "$host" "$@"
