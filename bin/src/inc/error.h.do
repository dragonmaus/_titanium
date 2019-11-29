redo-ifchange ../lib/error.list

cat > "$3" <<END
/* automatically generated */
#ifndef ERROR_H
#define ERROR_H

#if defined __OpenBSD__
int *__errno(void);
#define errno (*__errno())
#elif defined __linux__
int *__errno_location(void);
#define errno (*__errno_location())
#else
extern int errno;
#endif

END

while IFS='	' read -r name errno temp str
do
	test "x$name" = x- && continue
	cat >> "$3" <<-END
	extern int $name;
	END
done < ../lib/error.list

cat >> "$3" <<END

extern const char * error_str(int);
extern unsigned int error_temp(int);

#endif
END

chmod -w "$3"
