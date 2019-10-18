( cd "$2" && cargo generate-lockfile --offline > /dev/null 2>&1 )
redo-always
cat "$2/Cargo.toml" "$2/Cargo.lock" | redo-stamp
