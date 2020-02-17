(
  for i in 2 3
  do
    echo ">> Updating python$i packages"
    pip$i install -Uq --no-python-version-warning --upgrade-strategy=eager --user pip
    pip$i list --format=json --no-python-version-warning --not-required --user | jq -r '.[] | .name' | grep -Fvx pip | xargs -r pip$i install -Uq --no-python-version-warning --upgrade-strategy=eager --user
  done
)
