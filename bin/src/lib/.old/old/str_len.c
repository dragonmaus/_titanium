#include "str.h"

  unsigned int
str_len(register const char *s)
{
  const char *t;

  t = s;
  for (;;) {
    if (!*s) return s - t; ++s;
    if (!*s) return s - t; ++s;
    if (!*s) return s - t; ++s;
    if (!*s) return s - t; ++s;
  }
}
