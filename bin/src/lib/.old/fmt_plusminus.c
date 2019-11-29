#include "fmt.h"

  unsigned int
fmt_plusminus(register char *s, register long int i)
{
  unsigned int len;

  len = 0;
  if (i < 0) {
    len += fmt_str(s, "-");
    i = -i;
  } else {
    len += fmt_str(s, "+");
  }
  len += fmt_ulong(s + len, i);
  return len;
}
