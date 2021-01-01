case $shell in
(sh)
    _logout() {
        shell_config=${XDG_CONFIG_HOME:-~/.config}/shell
        [[ -r "$shell_config/logout.sh" ]] && . "$shell_config/logout.sh"
    }
    ;;
(*)
    _logout() {
        shell=$(basename "$SHELL")
        shell=${shell:-sh}
        shell_config=${XDG_CONFIG_HOME:-~/.config}/shell
        for f in "$shell_config/logout.$shell" "$shell_config/logout.sh"
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
trap -- _logout EXIT
