. "$shell_config/functions.mksh"

_pwd() {
  typeset h="$( cd ~ && pwd )"
  typeset p="$PWD/"
  case "$p" in
  ("$h/"*)
    p="~${p#"$h"}"
    ;;
  esac
  echo "${p%/}"
}
