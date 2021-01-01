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
