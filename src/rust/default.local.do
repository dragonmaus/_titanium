redo-ifchange cargo.binary rustc.binary
redo-ifchange $( cat cargo.binary rustc.binary ) "$2.local-stamp"
cd "$2"
cargo clean
cargo install --force --frozen --offline --path=.
cargo clean
