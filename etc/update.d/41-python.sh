for i in 2 3
do
  which pip$i > /dev/null 2>&1 || continue
  echo ">> Updating python$i packages"
  pip$i install -U --no-python-version-warning --upgrade-strategy=eager --user pip
  pip$i list --format=json --no-python-version-warning --not-required --user \
  | jq -r '.[] | .name' \
  | grep -Fvx pip \
  | xargs -r pip$i install -U --no-python-version-warning --upgrade-strategy=eager --user
done
