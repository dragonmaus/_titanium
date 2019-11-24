redo-ifchange digitalblasphemy.sh "$2.headers" "$HOME/bin/pass2netrc"
. ./digitalblasphemy.sh
uri="$uri/$2.zip"
pass2netrc "$key" | curl -Rs -o "$3" --netrc-file /dev/fd/0 "$uri"
