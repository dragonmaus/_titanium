#include "case.h"

#define tolower(c) (((unsigned char)((c) - 'A')) <= 'Z' - 'A' ? (c) - 'A' + 'a' : (c))

  unsigned int
case_starts(register const char *s, register const char *t)
{
  register unsigned char x;
  register unsigned char y;

  for (;;) {
    x = tolower(*s); y = tolower(*t); if (!y) return 1; if (x != y) return 0; ++s; ++t;
    x = tolower(*s); y = tolower(*t); if (!y) return 1; if (x != y) return 0; ++s; ++t;
    x = tolower(*s); y = tolower(*t); if (!y) return 1; if (x != y) return 0; ++s; ++t;
    x = tolower(*s); y = tolower(*t); if (!y) return 1; if (x != y) return 0; ++s; ++t;
  }
}
