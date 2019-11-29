#include "str.h"

  unsigned int
str_find(register const char *s, register char c)
{
  const char *t;

  t = s;
  for (;;) {
    if (!*s) break; if (*s == c) break; ++s;
    if (!*s) break; if (*s == c) break; ++s;
    if (!*s) break; if (*s == c) break; ++s;
    if (!*s) break; if (*s == c) break; ++s;
  }
  return s - t;
}
