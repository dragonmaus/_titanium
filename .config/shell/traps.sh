case "$shell" in
(sh)
	_logout() {
		[[ -r "$shell_config/logout.sh" ]] && . "$shell_config/logout.sh"
	}
	;;
(*)
	_logout() {
		for f in "$shell_config/logout.$shell" "$shell_config/logout.sh"
		do
			if [[ -r "$f" ]]
			then
				. "$f"
				return $?
			fi
		done
	}
	;;
esac
trap -- _logout EXIT
