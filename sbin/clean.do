redo-always

ls -AF \
| sed -n -e '/^\.gitignore$/p' -e 's/\*$//p' \
| grep -v '\.do$' \
| xargs -r rm -fv 1>&2

redo-ifchange src/clean
