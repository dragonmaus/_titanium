redo-ifchange "$home/bin/assemble.binary"
case "$( basename "$( head -1 < "$home/bin/assemble.binary" )" ):$( uname -m )" in
(nasm:i?86)   spec=nasm-x32 ;;
(nasm:x86_64) spec=nasm-x64 ;;
esac

whichsrc() {
	for f
	do
		case "$f" in
		(*.s)
			if test -e "$f-$spec"
			then
				echo "$f-$spec"
				return 0
			fi
			;;
		esac
		if test -e "$f" || test -e "$f.do"
		then
			echo "$f"
			return 0
		fi
	done
	return 1
}
