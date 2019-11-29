#include "case.h"

#define tolower(c) (((unsigned char)((c) - 'A')) <= 'Z' - 'A' ? (c) - 'A' + 'a' : (c))

  int
case_diffb(register const char *s, register unsigned int len, register const char *t)
{
  register unsigned char x;
  register unsigned char y;

  for (;;) {
    if (!len) return 0; x = tolower(*s); y = tolower(*t); if (x != y) break; ++s; ++t; --len;
    if (!len) return 0; x = tolower(*s); y = tolower(*t); if (x != y) break; ++s; ++t; --len;
    if (!len) return 0; x = tolower(*s); y = tolower(*t); if (x != y) break; ++s; ++t; --len;
    if (!len) return 0; x = tolower(*s); y = tolower(*t); if (x != y) break; ++s; ++t; --len;
  }
  return ((int)(unsigned int) x)
       - ((int)(unsigned int) y);
}
