redo-ifchange digitalblasphemy.sh "$HOME/bin/pass2netrc"
redo-always
. ./digitalblasphemy.sh
uri="$uri/$2.zip"
pass2netrc "$key" | curl -ILs --netrc-file /dev/fd/0 "$uri" | grep -iv '^Date: ' | redo-stamp
