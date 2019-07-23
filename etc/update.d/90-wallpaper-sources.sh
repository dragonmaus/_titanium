print ">> Updating wallpaper sources"
(
	base=https://secure.digitalblasphemy.com/content/zips
	path="$HOME/desk/downloads"
	while read res suf
	do
		file="$path/$res.zip"
		uri="$base/$res.zip"
		[[ "$(file -b --mime-type "$file" 2>/dev/null)" = application/zip ]] || touch -r /etc/epoch "$file"
		print -r -- "- ${file##*/} ($uri)" 1>&2
		ssh home bin/pass2netrc web/com.digitalblasphemy | curl -R -o "$file{new}" -z "$file" --netrc-file /dev/fd/0 "$uri"
		[[ "$(file -b --mime-type "$file{new}" 2>/dev/null)" = application/zip && "$file{new}" -nt "$file" ]] && mv -f "$file{new}" "$file"
		rm -f "$file{new}"
	done <"$HOME/etc/wallpaper/res.list"
)
