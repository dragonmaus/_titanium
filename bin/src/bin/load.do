redo-ifchange compile.binary
binary="$( head -1 < compile.binary )"

redo-ifchange preamble.sh load.format "$binary"
( cat preamble.sh; printf "$( cat load.format )" "$binary" ) > "$3"
chmod +x-w "$3"
