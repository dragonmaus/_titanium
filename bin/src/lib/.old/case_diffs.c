#include "case.h"

#define tolower(c) (((unsigned char)((c) - 'A')) <= 'Z' - 'A' ? (c) - 'A' + 'a' : (c))

  int
case_diffs(register const char *s, register const char *t)
{
  register unsigned char x;
  register unsigned char y;

  for (;;) {
    x = tolower(*s); y = tolower(*t); if (x != y) break; if (!x) break; ++s; ++t;
    x = tolower(*s); y = tolower(*t); if (x != y) break; if (!x) break; ++s; ++t;
    x = tolower(*s); y = tolower(*t); if (x != y) break; if (!x) break; ++s; ++t;
    x = tolower(*s); y = tolower(*t); if (x != y) break; if (!x) break; ++s; ++t;
  }
  return ((int)(unsigned int) x)
       - ((int)(unsigned int) y);
}
