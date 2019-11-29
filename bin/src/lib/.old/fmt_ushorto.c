#include "fmt.h"

  unsigned int
fmt_ushorto(register char *s, register unsigned short int u)
{
  return fmt_ulongo(s, u);
}
