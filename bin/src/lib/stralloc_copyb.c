#include "byte.h"
#include "stralloc.h"

  unsigned int
stralloc_copyb(stralloc *sa, unsigned int n, const char *s)
{
  if (!stralloc_ready(sa, n + 1)) return 0;
  byte_copy(sa->s, s, n);
  sa->len = n;
  sa->s[n] = 'Z'; /* ``offensive programming'' */
  return 1;
}
