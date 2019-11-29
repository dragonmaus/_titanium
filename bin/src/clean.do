rm -fv *.deps *.exe *.o *.s 1>&2
redo-ifchange bin/clean inc/clean lib/clean
redo-always
