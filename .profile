# ~/.profile

# User-specific shell login profile

# Clean up and augment PATH
command -v realpath > /dev/null || realpath() ( cd "$1" && env - "PATH=$PATH" pwd ) 2> /dev/null
path=
ifs="$IFS"
IFS=:
for d in "$HOME/bin" "$HOME/.cargo/bin" "$HOME/.local/bin" $PATH
do
	d="$( realpath "$d" 2> /dev/null || print -r -- "$d" )"
	case ":$path:" in
	(*":$d:"*) continue ;;
	esac
	path="$path:$d"
done
IFS="$ifs"
path="${path#:}"

# Set environment
set -a

# Paths
PATH="$path"
MANPATH="$HOME/.local/share/man:"
GOPATH="$HOME/src/go/ext:$HOME/src/go"

# Shell configuration
ENV="$HOME/.shrc"

# Global configuration
EDITOR="$( which nvim vim vi 2> /dev/null | head -1 )"
LC_COLLATE=C
[[ -f "$HOME/tmp/x.env.ssh" ]] && . "$HOME/tmp/x.env.ssh"

# App-specific configuration
HACKDIR="$HOME/.hack"

set +a

umask 022

# Update SSH environment
f="$HOME/.ssh/environment"
rm -f "$f.new"
grep -v '^PATH=' < "$f" > "$f.new"
print -r -- "PATH=$PATH" >> "$f.new"
mv -f "$f.new" "$f"
