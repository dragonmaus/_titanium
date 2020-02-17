# Brute-force edition of `set -o physical'
_cd() {
  PWD="$( env - "PATH=$PATH" pwd )"
}
cd() {
  command cd "$@" && _cd
}
