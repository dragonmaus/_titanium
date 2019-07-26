# ~/.profile

# User-specific shell login profile

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
[[ -f "$HOME/etc/locale.conf" ]] && . "$HOME/etc/locale.conf"
[[ -f "$HOME/tmp/ssh-agent.env" ]] && . "$HOME/tmp/ssh-agent.env" && [[ -n "$SSH_AGENT_PID" ]] && print "Agent pid $SSH_AGENT_PID"

# Application-specific
HACKDIR="$HOME/.hack"

set +a

# Set umask
umask 022
