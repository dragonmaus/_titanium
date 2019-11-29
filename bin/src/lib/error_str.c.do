redo-ifchange error.preamble error.list

cat error.preamble > "$3"

cat >> "$3" <<END

#define X(n,s) if (e == n) return s

  const char *
error_str(int e)
{
  X(0, "no error");
END

while IFS='	' read -r name errno temp str
do
	if test "x$name" = x-
	then
		cat >> "$3" <<-END
		#ifdef $errno
		  X($errno, "$str");
		#endif
		END
	else
		cat >> "$3" <<-END
		  X($name, "$str");
		END
	fi
done < error.list

cat >> "$3" <<END
  return "unknown error";
}
END

chmod -w "$3"
