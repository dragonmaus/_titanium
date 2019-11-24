cat > "$3" << 'END'
exec '%s' -I"$home/inc" -f elf64 "$@"\n
END
