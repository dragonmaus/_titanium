#!/bin/sh

# poor man's method
tr / '\001' | sort "$@" | tr '\001' /
