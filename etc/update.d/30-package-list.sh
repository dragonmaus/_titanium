echo '>> Updating package list'
(
  list="$HOME/etc/packages.list"
  pkg_info -mz | sort -u >"$list{new}"
  cmp -s "$list{new}" "$list" || mv -f "$list{new}" "$list"
  rm -f "$list{new}"
)
