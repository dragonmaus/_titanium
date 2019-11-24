redo-always

compiler="$( basename "$( which musl-clang musl-gcc clang gcc 2> /dev/null | head -1 )" )"
case "$compiler" in
(musl-gcc)
	redo-ifchange "$compiler.binary" "$compiler.specs"
	;;
(*)
	redo-ifchange "$compiler.binary"
	;;
esac

tee "$3" < "$compiler.binary" | redo-stamp
