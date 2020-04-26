redo-ifchange "$2.suffix" "$2.zip" black.list white.list

home=$(env - PATH="$PATH" pwd)

dest=$(xdg-user-dir BACKGROUNDS)/$2/digitalblasphemy
file=$home/$2.zip
suff=$(head -1 < "$2.suffix")
temp=$(env TMPDIR=$HOME/tmp mktemp -d)

trap -- "rm -fr '$temp'" EXIT INT KILL

mkdir -p "$dest"
find "$dest" -type f -exec chmod =rwx {} +

(
  cd "$temp"
  7z x "$file" > /dev/null
  find . -type f -exec chmod =rw {} +

  sed "s/\$/$suff.jpg/" < "$home/black.list" | xargs rm -f 2> /dev/null || :
  sed "s/\$/$suff.jpg/" < "$home/white.list" | xargs -J {} mv -f {} "$dest" 2> /dev/null || :
)

find "$dest" -type f '(' -perm -01 -o -perm -010 -o -perm -0100 ')' -delete
