# ~/.profile
# User-specific login shell profile

# Enforce `separation of concerns' between login and interactive shells
shell=$(basename "$SHELL")
: ${shell:=sh}
case $- in
(*i*)
	exec $shell -l -c 'exec $shell -i "$@"' $shell "$@"
	;;
esac

# XDG directories
CONF=${XDG_CONFIG_HOME:-~/.config}
DATA=${XDG_DATA_HOME:-~/.local/share}

# Clean up and augment PATH
path=
ifs=$IFS
IFS=:
for d in ~/bin ~/sbin ~/.cargo/bin ~/.local/bin $PATH
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
MANPATH=$DATA/man:$MANPATH
PATH=$path

## Shell configuration
ENV=~/.shrc

## Global configuration
EDITOR=nvim
HOSTNAME=${HOSTNAME:-$(hostname -s)}
PAGER=less

## App-specific configuration
GPG_TTY=$(tty)
HACKDIR=~/.hack
LESS=FMRXi
LESSHISTFILE=-
RIPGREP_CONFIG_PATH=$CONF/ripgrep.conf

set +a

# SSH agent
[ -f ~/.ssh/agent.sh ] && . ~/.ssh/agent.sh

# Update SSH environment
f=~/.ssh/environment
rm -f $f{new}
grep -v '^PATH=' < $f > $f{new}
echo "PATH=$PATH" >> $f{new}
mv -f $f{new} $f
