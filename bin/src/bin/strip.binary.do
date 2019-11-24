redo-always

( which sstrip 2> /dev/null || which strip ) > "$3"
redo-stamp < "$3"
