#include "fmt.h"

  unsigned int
fmt_uint0(register char *s, register unsigned int u, unsigned int n)
{
  return fmt_ulong0(s, u, n);
}
