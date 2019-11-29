whichsrc() {
	for f
	do
		if test -e "$f" || test -e "$f.do"
		then
			echo "$f"
			return 0
		fi
	done
	return 1
}
