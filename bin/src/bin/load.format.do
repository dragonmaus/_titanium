redo-ifchange compile.binary
binary="$( basename "$( head -1 < compile.binary )" )"
case "$binary" in
(musl-clang)
	cat > "$3" << 'END'
exec '%s' -static -L"$home/lib" -Qunused-arguments "$@"\n
END
	;;
(*)
	cat > "$3" << 'END'
exec '%s' -static -L"$home/lib" "$@"\n
END
	;;
esac
