#include "str.h"

  int
str_diffn(register const char *s, register const char *t, register unsigned int n)
{
  for (;;) {
    if (!n) return 0; if (*s != *t) break; if (!*t) break; ++s; ++t; --n;
    if (!n) return 0; if (*s != *t) break; if (!*t) break; ++s; ++t; --n;
    if (!n) return 0; if (*s != *t) break; if (!*t) break; ++s; ++t; --n;
    if (!n) return 0; if (*s != *t) break; if (!*t) break; ++s; ++t; --n;
  }
  return ((int)(unsigned int)(unsigned char) *s)
       - ((int)(unsigned int)(unsigned char) *t);
}
