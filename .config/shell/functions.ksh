if command -v hd > /dev/null
then
	:
elif command -v hexdump > /dev/null
then
	function hd {
		hexdump -e '"%08.8_ax  " 8/1 "%02X " "  " 8/1 "%02X "' -e '"  |" "%_p"' -e '"|\n"' "$@"
	}
else
	function hd {
		cat "$@" | _hd
	}
fi
function _hd {
	typeset -Uu -Z11 -i16 pos=0
	typeset -Uu -Z5 -i16 hv=2147483647
	typeset dasc dn i line
	set +U
	while read -ar -n512 line
	do
		typeset -i1 'line[*]'
		i=0
		while (( i < ${#line[*]} ))
		do
			dn=
			(( (hv = line[i++]) != 0 )) && dn="${line[i-1]#1#}"
			if (( (pos & 15) == 0 ))
			then
				(( pos )) && echo "$dasc|"
				echo -n "${pos#16#}  "
				dasc=' |'
			fi
			echo -n "${hv#16#} "
			if [[ "$dn" = [[:print:]] ]]
			then
				dasc+="$dn"
			else
				dasc+=.
			fi
			(( (pos++ & 15) == 7 )) && echo -n '- '
		done
	done
	while (( pos & 15 ))
	do
		echo -n '   '
		(( (pos++ & 15) == 7 )) && echo -n '- '
	done
	(( hv == 2147483647 )) || echo "$dasc|"
}

_pwd() {
	typeset h="$( cd ~ && pwd )"
	typeset p="$PWD/"
	case "$p" in
	("$h/"*)
		p="~${p#"$h"}"
		;;
	esac
	echo "${p%/}"
}
