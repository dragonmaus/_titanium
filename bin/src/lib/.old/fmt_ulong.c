#include "fmt.h"

  unsigned int
fmt_ulong(register char *s, register unsigned long int u)
{
  register unsigned int len;
  register unsigned long int q;

  len = 1;
  q = u;
  while (q > 9) {
    ++len;
    q /= 10;
  }
  if (s) {
    s += len;
    do {
      *--s = '0' + (u % 10);
      u /= 10;
    } while (u); /* handles u == 0 */
  }
  return len;
}
