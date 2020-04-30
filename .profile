# ~/.profile

# User-specific shell profile

# Ensure that `echo' is sane
case "$KSH_VERSION" in
(*'MIRBSD KSH'*|*'LEGACY KSH'*|*'PD KSH'*)
  echo() {
    print -R "$@"
  }
  ;;
(*)
  echo() {
    case "$1" in
    (-n)
      shift
      printf '%s' "$*"
      ;;
    (*)
      printf '%s\n' "$*"
      ;;
    esac
  }
  ;;
esac

# XDG directories
CONF=${XDG_CONFIG_HOME:-~/.config}
DATA=${XDG_DATA_HOME:-~/.local/share}

# Clean up and augment PATH
path=
ifs=$IFS
IFS=:
for d in ~/bin ~/.cargo/bin ~/src/go/bin ~/src/go/ext/bin ~/.local/bin $PATH /usr/games
do
  d=`realpath $d 2> /dev/null || echo $d`
  case ":$path:" in
  (*:$d:*)
    continue
    ;;
  esac
  path=$path:$d
done
IFS=$ifs
path=${path#:}

# Set environment
set -a

## Paths
GOPATH=~/src/go/ext:~/src/go
MANPATH=$DATA/man:
PATH=$path

## Shell configuration
ENV=$CONF/shell/init.sh

## Global configuration
BROWSER=firefox
EDITOR=`which nvim vim vi 2> /dev/null | head -1`
LANG=en_US.UTF-8
LC_COLLATE=C

## App-specific configuration
HACKDIR=~/.hack

set +a

# Set umask
umask 022

# SSH agent
test -f ~/tmp/x.env.ssh && . ~/tmp/x.env.ssh

# Update SSH environment
f=~/.ssh/environment
rm -f $f{new}
grep -v '^PATH=' < $f > $f{new}
echo "PATH='$PATH'" >> $f{new}
mv -f $f{new} $f
