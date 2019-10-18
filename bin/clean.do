find . -type f '(' -perm -01 -o -perm -010 -o -perm -0100 ')' | sed -n 's/^\.\///p' | grep -Fv / | tr '\n' '\0' | xargs -0r rm -fv 1>&2
redo-ifchange src/clean
redo-always
