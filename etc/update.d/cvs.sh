echo '>> Updating CVS repositories'
read -r cvsroot < ~/etc/cvsroot
r=$(uname -r | tr . _)
for repo in /usr/{src,xenocara,ports}
do
	[ -d $repo ] || continue
	echo - $repo
	(cd $repo && exec cvs -q -d $cvsroot update -Pd -r OPENBSD_$r)
done
