#!/bin/sh

. "$HOME/etc/secret/coords.sh"

exec redshift -l "$latitude:$longitude" "$@"
