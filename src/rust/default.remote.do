redo-ifchange cargo.binary rustc.binary
redo-ifchange $( cat cargo.binary rustc.binary ) "$2.remote-stamp"
cargo install --force "$2"
