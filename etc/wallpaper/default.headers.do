redo-ifchange "$HOME/etc/secret/digitalblasphemy.netrc"
redo-always

uri="https://secure.digitalblasphemy.com/content/zips"
curl -ILs --netrc-file "$HOME/etc/secret/digitalblasphemy.netrc" "$uri/$2.zip" \
| tr -s '\n\r' '\n' \
| tr '[:upper:]' '[:lower:]' \
| sort -u \
| while read k v
  do
    case "$k" in
    (content-length:|last-modified:)
      echo $k $v
      ;;
    (content-type:)
      if test "x$v" != 'xapplication/zip'
      then
        echo "$0: Authentication error"
        exit 99
      fi
      ;;
    esac
  done \
| redo-stamp
