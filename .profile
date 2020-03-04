# ~/.profile

# User-specific shell profile

# Ensure that `echo' is sane
case "$KSH_VERSION" in
(*MIRBSD\ KSH*|*LEGACY\ KSH*|*PD\ KSH*)
  echo() {
    print -R "$@"
  }
  ;;
(*)
  echo() {
    if [[ "$1" = -n ]]
    then
      shift
      printf '%s' "$*"
    else
      printf '%s\n' "$*"
    fi
  }
  ;;
esac

# XDG directories
CONF="${XDG_CONFIG_HOME:-"$HOME/.config"}"
DATA="${XDG_DATA_HOME:-"$HOME/.local/share"}"

# Clean up and augment PATH
path=
ifs="$IFS"
IFS=:
for d in "$HOME/bin" "$HOME/.cargo/bin" "$HOME/src/go/bin" "$HOME/src/go/ext/bin" "$HOME/.local/bin" $PATH /usr/games
do
  d="$( readlink -f "$d" 2> /dev/null || echo "$d" )"
  case ":$path:" in
  (*":$d:"*)
    continue
    ;;
  esac
  path="$path:$d"
done
IFS="$ifs"
path="${path#:}"

# Set environment
set -a

## Paths
GOPATH="$HOME/src/go/ext:$HOME/src/go"
MANPATH="$DATA/man:"
PATH="$path"

## Shell configuration
ENV="$CONF/shell/init.sh"

## Global configuration
EDITOR="$( which nvim vim vi 2> /dev/null | head -1 )"
LANG=en_US.UTF-8
LC_COLLATE=C

## App-specific configuration
HACKDIR="$HOME/.hack"
[[ -f "$HOME/tmp/x.env.ssh" ]] && . "$HOME/tmp/x.env.ssh"

set +a

# Set umask
umask 022

# Update SSH environment
f="$HOME/.ssh/environment"
rm -f "$f{new}"
grep -v '^PATH=' < "$f" > "$f{new}"
echo "PATH='$PATH'" >> "$f{new}"
mv -f "$f{new}" "$f"
