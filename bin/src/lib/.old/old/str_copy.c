#include "str.h"

  unsigned int
str_copy(register char *s, register const char *t)
{
  const char *u;

  u = s;
  for (;;) {
    *s = *t; if (!*t) return s - u; ++s; ++t;
    *s = *t; if (!*t) return s - u; ++s; ++t;
    *s = *t; if (!*t) return s - u; ++s; ++t;
    *s = *t; if (!*t) return s - u; ++s; ++t;
  }
}
