ls -F \
| sed -n \
	-e '/\.binary$/p' \
	-e '/\.format$/p' \
	-e '/\.specs$/p' \
	-e '/\.wrapper$/p' \
	-e 's/\*$//p' \
| tr '\n' '\0' \
| xargs -0r rm -fv 1>&2
redo-always
