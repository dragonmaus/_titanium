# ~/.profile

# User-specific shell login profile

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-"$HOME/.config"}"
XDG_CACHE_HOME="${XDG_CACHE_HOME:-"$HOME/.cache"}"
XDG_DATA_HOME="${XDG_DATA_HOME:-"$HOME/.local/share"}"

# Clean up PATH
command -v realpath >/dev/null || realpath() ( cd "$1" && env - "PATH=$PATH" pwd ) 2>/dev/null
path=
ifs="$IFS"
IFS=:
for d in "$HOME/bin" "$HOME/sbin" "$HOME/.local/bin" "$HOME/.local/sbin" $PATH
do
	d="$(realpath "$d" 2>/dev/null || print -r -- "$d")"
	case ":$path:" in
	(*":$d:"*)
		continue
		;;
	esac
	path="$path:$d"
done
IFS="$ifs"
path="${path#:}"

# Export environment
set -a

# Core
ENV="$HOME/.shrc"
PATH="$path"

# Configuration
EDITOR="$(command -v vi)"
[[ -f $XDG_CONFIG_HOME/locale.conf ]] && . "$XDG_CONFIG_HOME/locale.conf"

# Application-specific
HACKDIR="$HOME/.hack"

set +a

# Set umask
umask 022
