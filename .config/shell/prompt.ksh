PS1="$(
    r='\e[m'
    g='\e[32m'
    y='\e[33m'
    m='\e[35m'
    c='\e[36m'
    if [[ "$TERM" != linux && "$TERM" != linux-* ]]
    then
        echo -n '\e];'
        echo -n '$HOSTNAME'
        echo -n ' '
        echo -n '[$(_pwd)]'
        echo -n ' - '
        echo -n "$shell"
        echo -n '\a'
    fi
    echo -n "($c\$USER$r@$m\$HOSTNAME$r)"
    echo -n ' '
    echo -n "$g\$(date +%T)$r"
    echo -n ' '
    echo -n "[$y\$(_pwd)$r]"
    echo
    echo -n 'τ '
)"
