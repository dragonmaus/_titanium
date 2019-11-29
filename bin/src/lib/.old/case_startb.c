#include "case.h"

#define tolower(c) (((unsigned char)((c) - 'A')) <= 'Z' - 'A' ? (c) - 'A' + 'a' : (c))

  unsigned int
case_startb(register const char *s, register unsigned int len, register const char *t)
{
  register unsigned char x;
  register unsigned char y;

  for (;;) {
    y = tolower(*t); if (!y) return 1; if (!len) return 0; x = tolower(*s); if (x != y) return 0; ++s; ++t; --len;
    y = tolower(*t); if (!y) return 1; if (!len) return 0; x = tolower(*s); if (x != y) return 0; ++s; ++t; --len;
    y = tolower(*t); if (!y) return 1; if (!len) return 0; x = tolower(*s); if (x != y) return 0; ++s; ++t; --len;
    y = tolower(*t); if (!y) return 1; if (!len) return 0; x = tolower(*s); if (x != y) return 0; ++s; ++t; --len;
  }
}
