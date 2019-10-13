redo-ifchange "$2.local-stamp"
cd "$2"
cargo clean
cargo install --force --path=.
cargo clean
