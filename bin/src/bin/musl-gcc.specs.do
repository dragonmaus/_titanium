redo-always

redo-ifchange musl-gcc.binary
script="$( head -1 < musl-gcc.binary )"
sed -En 's/^.* -specs "(.*)".*$/\1/p' < "$script" > "$3"
redo-stamp < "$3"
