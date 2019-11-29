#include "fmt.h"

  unsigned int
fmt_strn(register char *s, register const char *t, register unsigned int n)
{
  register unsigned int len;
  register char c;

  len = 0;
  if (s) while (n-- && (c = t[len])) s[len++] = c;
  else while (n-- && t[len]) len++;
  return len;
}
