#!/bin/sh
ssh home redo bin/pass2netrc
exec ssh home bin/pass2netrc "$@"
