#include "fmt.h"

  unsigned int
fmt_ulong0(register char *s, register unsigned long int u, unsigned int n)
{
  register unsigned int len;

  len = fmt_ulong(FMT_LEN, u);
  while (len < n) {
    if (s) *s++ = '0';
    ++len;
  }
  if (s) fmt_ulong(s, u);
  return len;
}
