# ~/.profile
# User-level login shell configuration

# Clean up and augment PATH
path=
ifs=$IFS
IFS=:
for d in ~/bin ~/sbin ~/.cargo/bin ~/.local/bin ~/.local/python/bin ~/go/bin $PATH
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
MANPATH=~/.local/share/man:
PATH=$path

## Interactive shell configuration
ENV=~/.shrc

## Command-specific configuration
HACKDIR=~/.hack
LESS=Ri
LESSHISTFILE=-
PYTHONUSERBASE=~/.local/python
RIPGREP_CONFIG_PATH=~/.config/ripgrep.conf

set +a
