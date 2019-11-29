home="$( cd "$( dirname "$0" )/.." && env - "PATH=$PATH" pwd )"

redo-ifchange "$2.a.list"

deps=
objs=
while IFS= read -r obj
do
	deps="$deps $obj.deps"
	objs="$objs $obj"
done < "$2.a.list"

redo-ifchange $objs $deps

cat $deps | sed -En "s;^$home/inc/(.+)\\.h$;$home/lib/lib\\1.a;p" | grep -Fvx "$home/lib/$2.a" | sort -u > "$3"
