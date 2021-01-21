redo-always

ls -A \
| grep -E '\.(binary|deps|exe|o)$' \
| xargs -r rm -fv 1>&2
