redo-ifchange "$2.binary"
binary="$( head -1 < "$2.binary" )"

redo-ifchange preamble.sh "$2.format" "$binary"
( cat preamble.sh; printf "$( cat "$2.format" )" "$binary" ) > "$3"
chmod +x-w "$3"
