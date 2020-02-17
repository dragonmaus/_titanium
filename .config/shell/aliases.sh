alias lc='ls -C'
alias ll='ls -Fl'

case "$( uname )" in
(OpenBSD)
  alias ls='ls -1A'
  ;;
(*)
  alias ls='ls -1AN --color=auto'
  alias pstree='pstree -achlnp'
  ;;
esac

which doas > /dev/null 2>&1 && alias doas='doas '
which sudo > /dev/null 2>&1 && alias sudo='sudo '
