  unsigned int
byte_findr(register const char *s, register const char c, register unsigned int n)
{
  const char *t;
  const char *u;

  t = s;
  u = 0;
  for (;;) {
    if (!n) break; if (*s == c) u = s; ++s; --n;
    if (!n) break; if (*s == c) u = s; ++s; --n;
    if (!n) break; if (*s == c) u = s; ++s; --n;
    if (!n) break; if (*s == c) u = s; ++s; --n;
  }
  if (!u) u = s;
  return u - t;
}
