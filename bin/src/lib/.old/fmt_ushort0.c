#include "fmt.h"

  unsigned int
fmt_ushort0(register char *s, register unsigned short int u, unsigned int n)
{
  return fmt_ulong0(s, u, n);
}
