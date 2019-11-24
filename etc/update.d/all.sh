for script in "$home/"*.sh
do
	if [[ -f "$script" && -s "$script" && -x "$script" ]]
	then
		. "$script"
	fi
done
