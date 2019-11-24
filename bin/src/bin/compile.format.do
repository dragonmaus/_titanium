redo-ifchange compile.binary
binary="$( basename "$( head -1 < compile.binary )" )"
case "$binary" in
(musl-clang)
	cat > "$3" << 'END'
exec '%s' -c -I"$home/inc" -Qunused-arguments "$@"\n
END
	;;
(*)
	cat > "$3" << 'END'
exec '%s' -c -I"$home/inc" "$@"\n
END
	;;
esac
