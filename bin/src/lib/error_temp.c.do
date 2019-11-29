redo-ifchange error.preamble error.list

cat error.preamble > "$3"

cat >> "$3" <<END

#define X(n) if (e == n) return 1

  unsigned int
error_temp(int e)
{
END

while IFS='	' read -r name errno temp str
do
	test "x$temp" = xsoft || continue
	if test "x$name" = x-
	then
		cat >> "$3" <<-END
		#ifdef $errno
		  X($errno);
		#endif
		END
	else
		cat >> "$3" <<-END
		  X($name);
		END
	fi
done < error.list

cat >> "$3" <<END
  return 0;
}
END

chmod -w "$3"
