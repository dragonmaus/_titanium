case "$( uname -m )" in
(i?86)
	cat > "$3" <<-'END'
	exec '%s' -I"$home/inc" -f elf32 "$@"\n
	END
	;;
(x86_64)
	cat > "$3" <<-'END'
	exec '%s' -I"$home/inc" -f elf64 "$@"\n
	END
	;;
esac
