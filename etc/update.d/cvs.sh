print ">> Updating CVS repositories"
(
	for repo in /usr/{src,xenocara,ports}
	do
		[[ -d "$repo" ]] || continue
		print -- "- $repo"
		( cd "$repo" && exec cvs -q update -Pd -r OPENBSD_6_5 )
	done
)
