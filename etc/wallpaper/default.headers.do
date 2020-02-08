redo-ifchange "$HOME/etc/secret/digitalblasphemy.netrc"
redo-always

uri="https://secure.digitalblasphemy.com/content/zips"
curl -ILs --netrc-file "$HOME/etc/secret/digitalblasphemy.netrc" "$uri/$2.zip" \
| sort -u \
| grep -iv \
	-e '^cf-ray: ' \
	-e '^date: ' \
	-e '^set-cookie: ' \
| redo-stamp
