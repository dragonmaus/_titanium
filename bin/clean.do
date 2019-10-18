find . -type f -perm /0111 | sed -n 's/^\.\///p' | grep -Fv / | tr '\n' '\0' | xargs -0 rm -fv 1>&2
redo-ifchange src/clean
redo-always
