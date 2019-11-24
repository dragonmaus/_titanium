redo-ifchange gcc.binary

redo-always

which musl-gcc > "$3"
redo-stamp < "$3"
