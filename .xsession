#!/bin/sh

PATH="$HOME/bin:$PATH"
export PATH

printenv | grep '^SSH' | sort >"$HOME/tmp/ssh-agent.env"

randomise-wallpaper -s

dstat wpi0 &
exec dwm
