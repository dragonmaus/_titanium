redo-ifchange all.list ../bin/git-ignore

sed 's;^;/;' < all.list \
| xargs git ignore -f "$3" /.gitignore /.redo/ 2> /dev/null
chmod -w "$3"
