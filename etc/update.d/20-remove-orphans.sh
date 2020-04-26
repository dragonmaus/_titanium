echo '>> Removing orphaned packages'
t=$(mktemp -d)
trap -- "rm -fr '$t'" EXIT INT KILL
while :
do
  (
    pkg_info -mz | sort -u > $t/manual
    pkg_info -tz | sort -u > $t/leaves
    diff $t/manual $t/leaves | (
      set -A auto --
      set -A delete --
      while IFS=' ' read -r a b
      do
        case "$a" in
        ('<')
          set -A auto -- "${auto[@]}" "$b"
          ;;
        ('>')
          set -A delete -- "${delete[@]}" "$b"
          ;;
        esac
      done
      if [[ ${#auto[@]} -eq 0 && ${#delete[@]} -eq 0 ]]
      then
        exit 1
      fi
      if [[ ${#auto[@]} -gt 0 ]]
      then
        doas pkg_add -aa "${auto[@]}"
      fi
      if [[ ${#delete[@]} -gt 0 ]]
      then
        doas pkg_delete "${delete[@]}"
      fi
    )
  ) || break
done
rm -fr $t
