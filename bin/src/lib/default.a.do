home="$( cd "$( dirname "$0" )/.." && env - "PATH=$PATH" pwd )"

redo-ifchange "$2.a.list"
xargs redo-ifchange "$home/bin/archive" < "$2.a.list"
xargs "$home/bin/archive" cr "$3" < "$2.a.list"
