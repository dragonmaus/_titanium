#include <sys.h>

  static int
fmt_int(register char *s, register int u)
{
  register unsigned int len;
  register int q;

  len = 1;
  q = u;
  while (q > 9) {
    ++len;
    q /= 10;
  }
  if (s) {
    s += len;
    do {
      *--s = '0' + (u % 10);
      u /= 10;
    } while(u); /* handles u == 0 */
  }
  return len;
}

  unsigned int
str_copy(register char *to, register const char *from)
{
  register int len;

  len = 0;
  for (;;) {
    if (!(*to = *from)) return len; ++to; ++from; ++len;
    if (!(*to = *from)) return len; ++to; ++from; ++len;
    if (!(*to = *from)) return len; ++to; ++from; ++len;
    if (!(*to = *from)) return len; ++to; ++from; ++len;
  }
}

  static unsigned int
str_len(const char *s)
{
  register const char *t;

  t = s;
  for (;;) {
    if (!*t) return t - s; ++t;
    if (!*t) return t - s; ++t;
    if (!*t) return t - s; ++t;
    if (!*t) return t - s; ++t;
  }
}

  int
main(int argc, const char **argv, const char **envv)
{
  char buf[4096], *p;
  int i, l;

  l = 0;
  l += str_copy(buf + l, "argc = ");
  l += fmt_int(buf + l, argc);
  l += str_copy(buf + l, "\n");
  for (i = 0; argv[i]; ++i) {
    l += str_copy(buf + l, "argv[");
    l += fmt_int(buf + l, i);
    l += str_copy(buf + l, "] = '");
    l += str_copy(buf + l, argv[i]);
    l += str_copy(buf + l, "'\n");
  }
  for (i = 0; envv[i]; ++i) {
    l += str_copy(buf + l, "envv[");
    l += fmt_int(buf + l, i);
    l += str_copy(buf + l, "] = '");
    l += str_copy(buf + l, envv[i]);
    l += str_copy(buf + l, "'\n");
  }
  l += str_copy(buf + l, "\n");
  i = write(1, buf, l);
  write(1, "i = ", 4);
  i = fmt_int(buf, i);
  write(1, buf, i);
  write(1, "\nl = ", 5);
  i = fmt_int(buf, l);
  write(1, buf, i);
  write(1, "\n", 1);
  return 0;
}
