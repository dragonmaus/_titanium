shell=$(basename "$SHELL")
shell=${shell:-sh}

shell_cache=${XDG_CACHE_HOME:-~/.cache}/shell
shell_config=${XDG_CONFIG_HOME:-~/.config}/shell
shell_data=${XDG_DATA_HOME:-~/.local/share}/shell
mkdir -p "$shell_cache" "$shell_config" "$shell_data"

case $shell in
(sh)
    load() {
        [[ -r "$shell_config/$1.sh" ]] && . "$shell_config/$1.sh"
    }
    ;;
(*)
    load() {
        for f in "$shell_config/$1.$shell" "$shell_config/$1.sh"
        do
            if [[ -r "$f" ]]
            then
                . "$f"
                return $?
            fi
        done
    }
    ;;
esac

load echo

load aliases
load exports
load functions
load history
load options
load prompt
load traps

load login

unset -f load
unset f shell shell_cache shell_config shell_data
