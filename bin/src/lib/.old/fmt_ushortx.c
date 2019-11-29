#include "fmt.h"

  unsigned int
fmt_ushortx(register char *s, register unsigned short int u)
{
  return fmt_ulongx(s, u);
}
