case "$shell" in
(sh)
  _logout() {
    CONF="${XDG_CONFIG_HOME:-"$HOME/.config"}"
    [[ -r "$CONF/logout.sh" ]] && . "$CONF/logout.sh"
  }
  ;;
(*)
  _logout() {
    CONF="${XDG_CONFIG_HOME:-"$HOME/.config"}"
    for f in "$CONF/logout.$shell" "$CONF/logout.sh"
    do
      if [[ -r "$f" ]]
      then
        . "$f"
        return $?
      fi
    done
  }
  ;;
esac
trap -- _logout EXIT
