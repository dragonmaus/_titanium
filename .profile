# ~/.profile
# User-level login shell configuration

# Clean up and augment PATH
path=
ifs=$IFS
IFS=:
for d in ~/bin ~/sbin ~/.cargo/bin ~/.local/bin ~/.local/go/bin ~/.local/python/bin $PATH
do
	d=$(readlink -f $d 2> /dev/null || echo $d)
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
GOBIN=~/.local/go/bin
GOPATH=~/.local/go:~/src/go
MANPATH=~/.local/share/man:
PATH=$path
PYTHONUSERBASE=~/.local/python

## Interactive shell configuration
ENV=~/.shrc

## Command-specific configuration
LESS=Ri
LESSHISTFILE=-
RIPGREP_CONFIG_PATH=~/.config/ripgrep.conf

set +a
