redo-always

readlink -f "$( which "$2" )" > "$3"
redo-stamp < "$3"
