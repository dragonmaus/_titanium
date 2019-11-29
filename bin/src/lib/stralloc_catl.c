#include "stralloc.h"

  unsigned int
stralloc_catulong0(stralloc *sa, unsigned int n, unsigned long u)
{
  unsigned int len;
  unsigned long q;
  char *s;

  len = 1;
  q = u;
  while (q > 9) {
    ++len;
    q /= 10;
  }
  if (len < n) len = n;
  if (!stralloc_readyplus(sa, len)) return 0;
  s = sa->s + sa->len;
  sa->len += len;
  while (len) {
    s[--len] = '0' + (u % 10);
    u /= 10;
  }
  return 1;
}

  unsigned int
stralloc_catlong0(stralloc *sa, unsigned int n, long l)
{
  if (l < 0) {
    if (!stralloc_append(sa, "-")) return 0;
    l = -l;
  }
  return stralloc_catulong0(sa, n, l);
}
