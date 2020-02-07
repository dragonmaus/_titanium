echo() (
	f='%s\n'
	case "$1" in
	(-n)
		f='%s'
		shift
		;;
	esac
	printf "$f" "$*"
)
