redo-ifchange src/clean
tr '\n' '\0' < all.list | xargs -0 rm -f
redo-always
