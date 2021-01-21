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

# Enforce `separation of concerns' between login and interactive shells
shell=$(basename "$SHELL")
shell=${shell:-sh}
case $- in
(*i*)
    exec $shell -l -c 'exec $shell -i "$@"' $shell "$@"
    ;;
esac

# Pull in Nix configuration
nix=~/.nix-profile/etc/profile.d/nix.sh
[[ -e $nix ]] && . $nix

# XDG directories
CONF=${XDG_CONFIG_HOME:-~/.config}
DATA=${XDG_DATA_HOME:-~/.local/share}

# Clean up and augment PATH
path=
ifs=$IFS
IFS=:
for d in ~/bin ~/sbin ~/.cargo/bin ~/.local/bin ~/.local/games ~/bin/ext $PATH /usr/games
do
    case /$d/ in
    (*/.nix-profile/*|*/nix/*)
        ;;
    (*)
        d=$(realpath $d 2> /dev/null || echo $d)
        ;;
    esac
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
MANPATH=$DATA/man:
PATH=$path

## Shell configuration
ENV=$CONF/shell/init.sh

## Global configuration
EDITOR=$(which nvim vim vi 2> /dev/null | head -1)
HOSTNAME=${HOSTNAME:-$(hostname -s)}
PAGER=less; MANPAGER="$PAGER -s"

## App-specific configuration
HACKDIR=~/.hack
LESS=FMRXi
LESSHISTFILE=-
RIPGREP_CONFIG_PATH=$CONF/ripgrep/config

set +a

# SSH agent
[[ -f ~/.ssh/agent.sh ]] && . ~/.ssh/agent.sh

# Update SSH environment
f=~/.ssh/environment
rm -f $f{new}
grep -v '^PATH=' < $f > $f{new}
echo "PATH=$PATH" >> $f{new}
mv -f $f{new} $f
