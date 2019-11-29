  unsigned int
byte_find(register const char *s, register const char c, register unsigned int n)
{
  const char *t;

  t = s;
  for (;;) {
    if (!n) break; if (*s == c) break; ++s; --n;
    if (!n) break; if (*s == c) break; ++s; --n;
    if (!n) break; if (*s == c) break; ++s; --n;
    if (!n) break; if (*s == c) break; ++s; --n;
  }
  return s - t;
}
