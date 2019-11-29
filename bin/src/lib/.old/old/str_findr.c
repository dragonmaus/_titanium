#include "str.h"

  unsigned int
str_findr(register const char *s, register char c)
{
  register const char *t;
  register const char *u;

  t = s;
  u = 0;
  for (;;) {
    if (!*s) break; if (*s == c) u = s; ++s;
    if (!*s) break; if (*s == c) u = s; ++s;
    if (!*s) break; if (*s == c) u = s; ++s;
    if (!*s) break; if (*s == c) u = s; ++s;
  }
  if (!u) u = s;
  return u - t;
}
