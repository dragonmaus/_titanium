#include "fmt.h"

  unsigned int
fmt_uintx(register char *s, register unsigned int u)
{
  return fmt_ulongx(s, u);
}
