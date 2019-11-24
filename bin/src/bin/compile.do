redo-ifchange compile.binary
binary="$( head -1 < compile.binary )"

redo-ifchange preamble.sh compile.format "$binary"
( cat preamble.sh; printf "$( cat compile.format )" "$binary" ) > "$3"
chmod +x-w "$3"
