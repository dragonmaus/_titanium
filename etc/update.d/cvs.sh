echo '>> Updating CVS repositories'
r=$(uname -r | tr . _)
for repo in /usr/{src,xenocara,ports}
do
  [[ -d $repo ]] || continue
  echo - $repo
  (cd $repo && exec cvs -q update -Pd -r "OPENBSD_$r")
done
