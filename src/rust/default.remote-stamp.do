redo-always
curl -s "https://crates.io/api/v1/crates/$2" | jq .crate.updated_at | redo-stamp
