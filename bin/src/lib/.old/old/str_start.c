#include "str.h"

  unsigned int
str_start(register const char *s, register const char *t)
{
  for (;;) {
    if (!*t) return 1; if (*t != *s) return 0; ++s; ++t;
    if (!*t) return 1; if (*t != *s) return 0; ++s; ++t;
    if (!*t) return 1; if (*t != *s) return 0; ++s; ++t;
    if (!*t) return 1; if (*t != *s) return 0; ++s; ++t;
  }
}
