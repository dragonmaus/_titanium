PS1="$(
  r='\001\e[m\001'
  g='\001\e[32m\001'
  y='\001\e[33m\001'
  m='\001\e[35m\001'
  c='\001\e[36m\001'
  echo -n '\001\r'
  if [[ "$TERM" != linux && "$TERM" != linux-* ]]
  then
    echo -n '\001\e];'
    echo -n '$HOSTNAME'
    echo -n ' '
    echo -n '[$( _pwd )]'
    echo -n ' - '
    echo -n "$shell"
    echo -n '\a\001'
  fi
  echo -n "($c\$USER$r@$m\$HOSTNAME$r)"
  echo -n ' '
  echo -n "$g\$( date +%T )$r"
  echo -n ' '
  echo -n "[$y\$( _pwd )$r]"
  echo
  echo -n 'τ '
)"
