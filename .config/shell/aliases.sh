alias lc='ls -C'
alias ll='ls -Fl'

case "$( uname )" in
(OpenBSD)
	alias doas='doas '
	alias ls='ls -1A'
	;;
(*)
	alias ls='ls -1AN --color=auto'
	alias pstree='pstree -achlnp'
	alias sudo='sudo '
	;;
esac
