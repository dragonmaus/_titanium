#include "str.h"

  int
str_diff(register const char *s, register const char *t)
{
  for (;;) {
    if (*s != *t) break; if (!*t) break; ++s; ++t;
    if (*s != *t) break; if (!*t) break; ++s; ++t;
    if (*s != *t) break; if (!*t) break; ++s; ++t;
    if (*s != *t) break; if (!*t) break; ++s; ++t;
  }
  return ((int)(unsigned int)(unsigned char) *s)
       - ((int)(unsigned int)(unsigned char) *t);
}
