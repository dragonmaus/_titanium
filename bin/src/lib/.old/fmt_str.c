#include "fmt.h"

  unsigned int
fmt_str(register char *s, register const char *t)
{
  register unsigned int len;
  register char c;

  len = 0;
  if (s) while ((c = t[len])) s[len++] = c;
  else while (t[len]) len++;
  return len;
}
