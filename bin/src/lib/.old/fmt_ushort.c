#include "fmt.h"

  unsigned int
fmt_ushort(register char *s, register unsigned short int u)
{
  return fmt_ulong(s, u);
}
