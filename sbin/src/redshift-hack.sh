#!/bin/sh

. ~/etc/secret/coords.sh

exec redshift -l "$latitude:$longitude" "$@"
