#include "fmt.h"

  unsigned int
fmt_ulongo(register char *s, register unsigned long int u)
{
  register unsigned int len;
  register unsigned long int q;

  len = 1;
  q = u;
  while (q > 7) {
    ++len;
    q /= 8;
  }
  if (s) {
    s += len;
    do {
      *--s = '0' + (u % 8);
      u /= 8;
    } while (u); /* handles u == 0 */
  }
  return len;
}
